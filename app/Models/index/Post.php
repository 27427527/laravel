<?php

namespace App\Models\index;

use App\Models\admin\Cate;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Str;

class Post extends Model
{
    use HasFactory;

    // 关联的表名
    public $table = 'posts';

    // 主键名
    public $primaryKey = 'post_id';

    // 是否维护时间戳
    public $timestamps = true;
    // protected $dateFormat = 'U'; // Unix 时间戳

    protected $fillable = [
        'title',
        'cate_id',
        'content',
        'slug',
        'excerpt',
        'image',
        'is_published',
        'published_at',
        'id',
        'meta_title',
        'meta_description',

    ];

    protected $casts = [
        'is_published' => 'boolean',
        'published_at' => 'datetime',
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($post) {
            if (empty($post->slug)) {
                $post->slug = Str::slug($post->title);
            }
        });

        static::updating(function ($post) {
            if ($post->isDirty('title') && empty($post->slug)) {
                $post->slug = Str::slug($post->title);
            }
        });
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(Admin::class);
    }

       public function cate(): BelongsTo
       {
           return $this->belongsTo(Cate::class);
       }

    public function getExcerptAttribute($value)
    {
        if ($value) {
            return $value;
        }

        return Str::limit(strip_tags($this->content), 80);
    }

    public function scopePublished($query)
    {
        return $query->where('is_published', true)
                    ->where('published_at', '<=', now());
    }
}
