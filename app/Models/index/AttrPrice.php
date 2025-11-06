<?php

namespace App\Models\index;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AttrPrice extends Model
{
    use HasFactory;

    // 关联的表名
    public $table = 'attr_price';

    // 主键名
    public $primaryKey = 'attr_price_id';

    // 是否维护时间戳
    public $timestamps = false;

    // protected $dateFormat = 'U'; // Unix 时间戳

    // 允许批量赋值的字段

    protected $fillable = ['attr_price_id', 'price', 'attr', 'stock', 'good_id'];

    public function goods(): BelongsTo
    {
        return $this->belongsTo(Good::class, 'good_id');
    }
}
