<?php

namespace App\Models\index;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $fillable = [
        'order_id',
        'good_id',
        'good_name',
        'category',
        'image',
        'good_price',
        'quantity',
        'total_price',

    ];

    protected $casts = [
        'good_price' => 'decimal:2',
        'total_price' => 'decimal:2',
        'category' => 'array',

    ];

    // 关联的表名
    public $table = 'order_item';

    // 主键名
    public $primaryKey = 'order_item_id';

    public $timestamps = false;

    /**
     * 所属订单
     */
    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    /**
     * 所属商品
     */
    public function good()
    {
        return $this->belongsTo(Good::class);
    }
}
