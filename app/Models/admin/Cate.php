<?php

namespace App\Models\admin;

use App\Models\index\Banner;
use App\Models\index\Brand;
use App\Models\index\Good;
use App\Models\index\Post;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Cate extends Model
{
    use HasFactory;

    // 关联的表名
    public $table = 'cates';

    // 主键名
    public $primaryKey = 'cate_id';

    protected $fillable = [
        'name',
        'slug',
        'level',
        'relation',
        'description',
        'parent_id',
        'order',
        'is_active',
        'image',
        'meta_title',
        'meta_description',
    ];

    protected $casts = [
        'order' => 'integer',
    ];

    public function goods(): BelongsToMany
    {
        return $this->belongsToMany(Good::class, 'good_cate', 'cate_id', 'good_id');
    }

     public function hasgoods(): bool
     {
         return $this->goods()->exists();
     }

    /**
     * 子分类
     */
    public function posts(): HasMany
    {
        return $this->hasMany(Post::class, 'cate_id');
    }

     public function hasposts(): bool
     {
         return $this->posts()->exists();
     }

    /**
     * 子分类
     */
    public function banners(): HasMany
    {
        return $this->hasMany(Banner::class, 'cate_id');
    }

    /**
     * 检查是否有子分类
     */
    public function hasbanners(): bool
    {
        return $this->banners()->exists();
    }

    /**
     * 子分类
     */
    public function brands(): HasMany
    {
        return $this->hasMany(Brand::class, 'cate_id');
    }

    /**
     * 检查是否有子分类
     */
    public function hasbrands(): bool
    {
        return $this->brands()->exists();
    }

    /**
     * 父分类
     */
    public function parent(): BelongsTo
    {
        return $this->belongsTo(Cate::class, 'parent_id', 'cate_id');
    }

    /**
     * 子分类
     */
    public function children(): HasMany
    {
        return $this->hasMany(Cate::class, 'parent_id', 'cate_id')->orderBy('order');
    }

    /**
     * 所有子孙分类（递归）
     */
    public function allChildren(): HasMany
    {
        return $this->children()->with('allChildren');
    }

    /**
     * 递归获取所有子孙分类
     */
    public function getAllDescendants($is_active = false)
    {
        $descendants = [];
        $this->loadDescendantsRecursive($this->cate_id, $descendants, $is_active);

        return $descendants;
    }

// 所有子孙分类
    private function loadDescendantsRecursive($parent_id, &$descendants, $is_active)
    {
        $children = self::withCount('children')
            ->where(function ($query) use ($is_active) {
                if ($is_active == true) {
                    $query->where('is_active', '1');
                }
            })
            ->where('parent_id', $parent_id)
            ->orderBy('order', 'asc')
            ->get();

        foreach ($children as $child) {
            $descendants[] = $child;
            $this->loadDescendantsRecursive($child->cate_id, $descendants, $is_active);
        }
    }

    /**
     * 获取所有父级分类（包括自己）
     */
    public function getAncestors()
    {
        $ancestors = collect([$this]);
        $parent = $this->parent;

        while ($parent) {
            $ancestors->push($parent);
            $parent = $parent->parent;
        }

        return $ancestors->reverse();
    }

    /**
     * 获取所有子孙分类ID（包括自己）
     */
    public function getAllDescendantIds()
    {
        $ids = [$this->id];

        foreach ($this->children as $child) {
            $ids = array_merge($ids, $child->getAllDescendantIds());
        }

        return $ids;
    }

    /**
     * 作用域：根分类
     */
    public function scopeRoot($query)
    {
        return $query->whereNull('parent_id');
    }

    /**
     * 作用域：激活的分类
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    /**
     * 作用域：按排序
     */
    public function scopeOrdered($query)
    {
        return $query->orderBy('order')->orderBy('name');
    }

    /**
     * 检查是否有子分类
     */
    public function hasChildren(): bool
    {
        return $this->children()->exists();
    }

    /**
     * 检查是否是根分类
     */
    public function isRoot(): bool
    {
        return $this->parent_id == 0 ? true : false;
    }

    /**
     * 获取层级名称（包含父级名称）
     */
    public function getHierarchyNameAttribute(): string
    {
        $names = $this->getAncestors()->pluck('name');

        return $names->implode(' > ');
    }

    /**
     * 获取层级深度
     */
    public function getDepthAttribute(): int
    {
        return $this->getAncestors()->count() - 1;
    }
}
