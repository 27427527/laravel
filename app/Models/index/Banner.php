<?php

namespace App\Models\index;

use App\Models\admin\Cate;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Banner extends Model
{
    use HasFactory;

    // 关联的表名
    public $table = 'banners';

    // 主键名
    public $primaryKey = 'banner_id';

    // 是否维护时间戳
    public $timestamps = true;

    // protected $dateFormat = 'U'; // Unix 时间戳

    // 允许批量赋值的字段

    protected $fillable = ['name', 'cate_id', 'slug', 'image', 'title'];

    public function cate(): BelongsTo
    {
        return $this->belongsTo(Cate::class, 'cate_id', 'banner_id');
    }
}
