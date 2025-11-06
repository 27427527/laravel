<?php

namespace App\Models\index;

use App\Models\admin\Cate;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Good extends Model
{
    use HasFactory, SoftDeletes;

    // 关联的表名
    public $table = 'goods';

    // 主键名
    public $primaryKey = 'good_id';

    // 是否维护时间戳
    public $timestamps = true;

    protected $fillable = [
        'name',
        'description',
        'price',
        'original_price',
        'stock',
        'sku',
        'image',
        'images',
        'is_featured',
        'is_active',
        'sort_order',
        'specifications',
        'brand_id',
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'original_price' => 'decimal:2',
        'is_featured' => 'boolean',
        'is_active' => 'boolean',
        'images' => 'array',
        'specifications' => 'array',
    ];

    /**
     * 关联分类
     */
    public function cates(): BelongsToMany
    {
        return $this->belongsToMany(Cate::class, 'good_cate', 'good_id', 'cate_id');
    }

      public function cate_id_list()
      {
          return $this->cates->pluck('cate_id')->toArray();
      }

    /**
     * 关联品牌
     */
    public function brands(): BelongsTo
    {
        return $this->belongsTo(Brand::class, 'brand_id');
    }

    /**
     * 获取折扣百分比
     */
    public function getDiscountPercentageAttribute(): float
    {
        if (! $this->original_price || $this->original_price <= $this->price) {
            return 0;
        }

        return round((($this->original_price - $this->price) / $this->original_price) * 100, 2);
    }

    /**
     * 检查是否有库存
     */
    public function getInStockAttribute(): bool
    {
        return $this->stock > 0;
    }

    /**
     * 范围：上架的商品
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    /**
     * 范围：推荐商品
     */
    public function scopeFeatured($query)
    {
        return $query->where('is_featured', true);
    }

    /**
     * 范围：按分类筛选
     */
    public function scopeByCategory($query, $categoryId)
    {
        return $query->where('category_id', $categoryId);
    }

    /**
     * 范围：搜索商品
     */
    public function scopeSearch($query, $search)
    {
        return $query->where('name', 'like', "%{$search}%")
                    ->orWhere('description', 'like', "%{$search}%");
    }

    // 生效的值
     public function allAttr_vals()
     {
         return $this->attr_names->flatMap(function ($attr_names) {
             return $attr_names->attr_vals->pluck('name');
         })->toArray();
     }

    //  attr_price存在的值
      public function price_ids()
      {
          return $this->attr_prices->toArray();
      }

     public function attr_names(): HasMany
     {
         return $this->hasMany(AttrName::class, 'good_id');
     }

     public function attr_prices(): HasMany
     {
         return $this->hasMany(AttrPrice::class, 'good_id');
     }

    //  商品所有价格组合
       public function generateCombinationsLazy()
       {
           $arrays = [];
           foreach ($this->attr_names as $item) {
               foreach ($item->attr_vals as $v) {
                   $arrays[$item->name][] = $v->name;
               }
           }

           $keys = array_keys($arrays);

           return $this->combineLazy($arrays, $keys);
       }

    private function combineLazy($arrays, $keys, $currentIndex = 0, $currentCombo = [])
    {
        if ($currentIndex == count($keys)) {
            yield $currentCombo;

            return;
        }

        $currentKey = $keys[$currentIndex];
        $currentValues = $arrays[$currentKey];

        foreach ($currentValues as $value) {
            $newCombo = $currentCombo;
            $newCombo[$currentKey] = $value;
            yield from $this->combineLazy($arrays, $keys, $currentIndex + 1, $newCombo);
        }
    }

    public function generateCombinationsWithKeys($arrays, $keys = [], $currentIndex = 0, $currentCombination = [])
    {
        if (empty($keys)) {
            $keys = array_keys($arrays);
        }

        if ($currentIndex == count($keys)) {
            return [$currentCombination];
        }

        $result = [];
        $currentKey = $keys[$currentIndex];
        $currentArray = $arrays[$currentKey];

        foreach ($currentArray as $value) {
            $newCombination = $currentCombination;
            $newCombination[$currentKey] = $value;
            $result = array_merge($result, generateCombinationsWithKeys($arrays, $keys, $currentIndex + 1, $newCombination));
        }

        return $result;
    }
}
