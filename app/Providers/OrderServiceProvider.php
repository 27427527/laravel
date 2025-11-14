<?php

namespace App\Providers;

use App\Models\index\Good;
use App\Models\index\Order;
use App\Models\index\OrderItem;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\ServiceProvider;

class OrderServiceProvider extends ServiceProvider
{
    /**
     * 注册所有的应用服务
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(OrderServiceProvider::class, function ($app) {
            return new OrderServiceProvider();
        });
    }

    /**
     * 创建订单
     */
    public function createOrder(array $data): ?Order
    {
        return DB::transaction(function () use ($data) {
            try {
                // 验证商品库存
                $this->validateGoodsStock($data['items']);

                // 计算订单金额
                $amounts = $this->calculateOrderAmounts($data['items']);

                // 创建订单
                $order = Order::create([
                    'order_no' => Order::generateOrderNo(),
                    'id' => $data['id'],
                    'total_amount' => $amounts['total_amount'],
                    'pay_amount' => $amounts['pay_amount'],
                    'status' => Order::STATUS_PENDING,
                    'remark' => $data['remark'] ?? null,
                    'address' => $data['address'] ?? null,
                ]);

                // 创建订单项
                $this->createOrderItems($order, $data['items']);

                // 扣减库存
                $this->deductGoodsStock($data['items']);

                return $order->load('items');
            } catch (\Exception $e) {
                Log::error('创建订单失败: '.$e->getMessage());
                throw $e;
            }
        });
    }

    /**
     * 验证商品库存
     */
    private function validateGoodsStock(array $items)
    {
        foreach ($items as $item) {
            $product = Good::find($item['good_id']);

            if ($item['category']) {
                $newproduct = $product->attr_prices->where('attr', $item['category'])->first();

                return  $newproduct;
                exit;
                if ($newproduct->stock < $item['quantity']) {
                    throw new \Exception("商品 {$product->name} 库存不足");
                }
            } else {
                if ($product->stock < $item['quantity']) {
                    throw new \Exception("商品 {$product->name} 库存不足");
                }
            }
        }
    }

    /**
     * 计算订单金额
     */
    private function calculateOrderAmounts(array $items): array
    {
        $totalAmount = 0;

        foreach ($items as $item) {
            $product = Good::findOrFail($item['good_id']);
            $itemTotal = $product->price * $item['quantity'];
            $totalAmount += $itemTotal;
        }

        // 这里可以添加优惠券、运费等计算逻辑
        $payAmount = $totalAmount;

        return [
            'total_amount' => $totalAmount,
            'pay_amount' => $payAmount,
        ];
    }

    /**
     * 创建订单项
     */
    private function createOrderItems(Order $order, array $items): void
    {
        foreach ($items as $item) {
            $product = Good::findOrFail($item['good_id']);

            OrderItem::create([
                'order_id' => $order->order_id,
                'good_id' => $product->good_id,
                'product_name' => $product->name,
                'product_price' => $product->price,
                'quantity' => $item['quantity'],
                'total_price' => $product->price * $item['quantity'],
                'product_snapshot' => $product->toArray(), // 保存商品快照
            ]);
        }
    }

    /**
     * 扣减库存
     */
    private function deductGoodsStock(array $items): void
    {
        foreach ($items as $item) {
            Good::where('good_id', $item['good_id'])
                ->decrement('stock', $item['quantity']);
        }
    }

    /**
     * 取消订单
     */
    public function cancelOrder(Order $order): bool
    {
        return DB::transaction(function () use ($order) {
            try {
                // 恢复库存
                $this->restoreGoodsStock($order);

                // 更新订单状态
                return $order->update([
                    'status' => Order::STATUS_CANCELLED,
                ]);
            } catch (\Exception $e) {
                Log::error('取消订单失败: '.$e->getMessage());
                throw $e;
            }
        });
    }

    /**
     * 恢复库存
     */
    private function restoreGoodsStock(Order $order): void
    {
        foreach ($order->items as $item) {
            Good::where('good_id', $item->good_id)
                ->increment('stock', $item->quantity);
        }
    }
}
