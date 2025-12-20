<?php

namespace App\Providers;

use App\Jobs\ProcessUserVisit;
use App\Models\index\Post;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\ServiceProvider;

class RedisPostServiceProvider extends ServiceProvider
{
    // Redis 键名前缀
    const ARTICLE_KEY_PREFIX = 'article:';

    const VIEWS_KEY_PREFIX = 'article_views:';

    const CACHE_TTL = 3600; // 1小时缓存

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(RedisPostServiceProvider::class, function ($app) {
            return new RedisPostServiceProvider($this);
        });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * 存储文章到 Redis
     */
    public function storeArticle(Post $article)
    {
        $key = self::ARTICLE_KEY_PREFIX.$article->post_id;

        $articleData = [
            'post_id' => $article->post_id,
            'cate_id' => $article->cate_id,
            'title' => $article->title,
            'content' => $article->content,
            'excerpt' => $article->excerpt,
            'image' => $article->image,
            'is_published' => $article->is_published,
            'published_at' => $article->published_at->toISOString(),
            'id' => $article->id,
            'slug' => $article->slug,
            'view_count' => $article->view_count,
            'created_at' => $article->created_at->toISOString(),
            'updated_at' => $article->updated_at->toISOString(),
        ];

        // 使用 Hash 存储文章数据
        Redis::connection()->hmset($key, $articleData);

        // 设置过期时间
        Redis::connection()->expire($key, self::CACHE_TTL);

        return true;
    }

    /**
     * 从 Redis 获取文章
     */
    public function getArticle($articleId)
    {
        $key = self::ARTICLE_KEY_PREFIX.$articleId;

        // 获取文章数据
        $articleData = Redis::connection()->hgetall($key);

        if (empty($articleData)) {
            return null;
        }

        // 从 Redis 获取实时阅读数
        $viewCount = $this->getViewCount($articleId);
        $articleData['view_count'] = $articleData['view_count'] + $viewCount;

        return $articleData;
    }

    /**
     * 记录阅读数
     */
    public function recordView($articleId, $userId = null)
    {
        $viewsKey = self::VIEWS_KEY_PREFIX.$articleId;

        // 使用 HyperLogLog 统计独立阅读数（避免重复计数）
        if ($userId) {
            $count = Redis::connection()->pfadd($viewsKey, [$userId]);
        } else {
            // 如果没有用户ID，使用IP地址
            $ip = request()->ip();
            $count = Redis::connection()->pfadd($viewsKey, [$ip]);
        }

        // 异步更新访问量到数据库

        if ($count > 0) {
            ProcessUserVisit::dispatch($articleId);
        }

        return true;
    }

    /**
     * 获取阅读数
     */
    public function getViewCount($articleId)
    {
        $viewsKey = self::VIEWS_KEY_PREFIX.$articleId;

        // 使用 HyperLogLog 获取独立阅读数
        $uniqueViews = Redis::connection()->pfcount($viewsKey);

        return $uniqueViews;
    }

    /**
     * 获取热门文章
     */
    public function getPopularArticles($limit = 10)
    {
        $dailyKey = 'article_views_daily:'.date('Y-m-d');

        // 获取今天阅读数最高的文章
        $popularArticles = Redis::connection()->zrevrange($dailyKey, 0, $limit - 1, ['WITHSCORES' => true]);

        $result = [];
        foreach ($popularArticles as $articleId => $views) {
            $article = $this->getArticle($articleId);
            if ($article) {
                $article['redis_views'] = $views;
                $result[] = $article;
            }
        }

        return $result;
    }

    /**
     * 删除文章缓存
     */
    public function deleteArticleCache($articleId)
    {
        $articleKey = self::ARTICLE_KEY_PREFIX.$articleId;
        $viewsKey = self::VIEWS_KEY_PREFIX.$articleId;

        Redis::connection()->del($articleKey);
        Redis::connection()->del($viewsKey);

        return true;
    }

    /**
     * 批量获取文章
     */
    public function getMultipleArticles(array $articleIds)
    {
        $result = [];

        foreach ($articleIds as $articleId) {
            $article = $this->getArticle($articleId);
            if ($article) {
                $result[] = $article;
            }
        }

        return $result;
    }
}
