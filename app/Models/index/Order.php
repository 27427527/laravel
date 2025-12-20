<?php

namespace App\Models\index;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    protected $fillable = [
        'order_id',
        'order_no',
        'id',
        'total_amount',
        'pay_amount',
        'status',
        'payment_method',
        'paid_at',
        'remark',
        'note',
        'address',
        'name',
        'phone',
        'express_no',
        'express_info',
        'express_name',
    ];

    protected $casts = [
        'address' => 'array',
        'total_amount' => 'decimal:2',
        'pay_amount' => 'decimal:2',

    ];

    public $table = 'orders';

    // 主键名
    public $primaryKey = 'order_id';

    public $timestamps = true;

    // 订单状态常量
    const STATUS_PENDING = 'pending';      // 待支付

    const STATUS_PAID = 'paid';           // 已支付

    const STATUS_SHIPPED = 'shipped';     // 已发货

    const STATUS_COMPLETED = 'completed'; // 已完成

    const STATUS_CANCELLED = 'cancelled'; // 已取消

    const STATUS_CANCELING = 'canceling'; // 退款中

    /**
     * 生成订单号
     */
    public static function generateOrderNo(): string
    {
        return date('YmdHis').str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
    }

    /**
     * 订单商品项
     */
    public function items(): HasMany
    {
        return $this->hasMany(OrderItem::class, 'order_id');
    }

    /**
     * 所属用户
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'id');
    }

    /**
     * 检查订单是否可支付
     */
    public function canBePaid(): bool
    {
        return $this->status === self::STATUS_PENDING;
    }

    /**
     * 标记为已支付
     */
    public function markAsPaid(string $paymentMethod): bool
    {
        return $this->update([
            'status' => self::STATUS_PAID,
            'payment_method' => $paymentMethod,
            'paid_at' => now(),
        ]);
    }
}
