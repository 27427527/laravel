<?php

namespace App\Http\Controllers\index;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use App\Models\index\Post;
use App\Providers\RedisPostServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class PostController extends Controller
{
    protected $RedisPostServiceProvider;

    // 导航列表前缀
    const NAV_KEY_PREFIX = 'post_nav_list:';

    const CACHE_TTL = 3600; // 1小时缓存

    public function __construct(RedisPostServiceProvider $RedisPostServiceProvider)
    {
        $this->RedisPostServiceProvider = $RedisPostServiceProvider;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        // 先从 Redis 获取
        $post = $this->RedisPostServiceProvider->getArticle($id);

        // 如果 Redis 中没有，从数据库获取并缓存
        if (! $post) {
            $post = Post::findOrFail($id);
            $this->RedisPostServiceProvider->storeArticle($post);
            $post = $this->RedisPostServiceProvider->getArticle($id);
        }

        // 记录阅读数
        $userId = auth()->id();
        $this->RedisPostServiceProvider->recordView($id, $userId);

        // 获取导航列表

        $nav_list = Cache::remember($this::NAV_KEY_PREFIX.'18', $this::CACHE_TTL, function () {
            $cate = Cate::find(18);

            return  $cate->getAllDescendants();
        });

        return response()->json([
            'message' => 'success',
            'success' => true,
            'post' => $post,
            'nav_list' => $nav_list,

        ]);
    }

     public function list(Request $request, $id)
     {
         $cate = Cate::find(18);
         $nav_list = $cate->getAllDescendants();

         $post_list = DB::table('posts')->where('cate_id', $id)
         ->where('is_published', 1)
         ->get();

         return response()->json([
             'message' => 'success',
             'success' => true,
             'post_list' => $post_list,
             'nav_list' => $nav_list,
         ]);
     }
}
