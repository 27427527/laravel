<?php

namespace App\Models\admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
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
    public function getAllDescendants()
    {
        $descendants = [];
        $this->loadDescendantsRecursive($this->cate_id, $descendants);

        return $descendants;
    }

    private function loadDescendantsRecursive($parent_id, &$descendants)
    {
        $children = self::withCount('children')
            ->where('parent_id', $parent_id)
            ->orderBy('order', 'asc')
            ->get();

        foreach ($children as $child) {
            $descendants[] = $child;
            $this->loadDescendantsRecursive($child->cate_id, $descendants);
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
