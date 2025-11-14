<?php

namespace App\Http\Controllers\index;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateOrderRequest;
use App\Models\index\Address;
use App\Models\index\AttrPrice;
use App\Models\index\Good;
use App\Models\index\Order;
use App\Models\index\OrderItem;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class OrderController extends Controller
{
    /**
     * 创建订单
     */
    public function store(CreateOrderRequest $request): JsonResponse
    {
        try {
            $order = $this->createOrder([
                'id' => auth()->id(),
                'items' => $request->input('items'),
                'address' => $request->input('address'),
                'remark' => $request->input('remark'),
                'payment_method' => $request->input('payment_method'),
            ]);

            return response()->json([
                'success' => true,
                'data' => $order,
                'message' => '订单创建成功',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * 订单列表
     */
    public function list(): JsonResponse
    {
        $id = auth()->id();

        $order_list = Order::with('items')
        ->where('id', $id)->orderBy('created_at', 'desc')->get();

        return response()->json([
            'success' => true,
            'order_list' => $order_list,
        ]);
    }

    /**
     * 订单详情
     */
    public function show(array $order): JsonResponse
    {
        // 权限检查
        if ($order->user_id !== auth()->id()) {
            abort(403, '无权查看此订单');
        }

        return response()->json([
            'success' => true,
            'data' => $order->load('items'),
        ]);
    }

    /**
     * 取消订单
     */
    public function cancel(array $order): JsonResponse
    {
        try {
            if ($order->user_id !== auth()->id()) {
                abort(403, '无权操作此订单');
            }

            $this->cancelOrder($order);

            return response()->json([
                'success' => true,
                'message' => '订单取消成功',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * 创建订单
     */
    public function createOrder(array $data)
    {
        return DB::transaction(function () use ($data) {
            try {
                // 验证商品库存
                $this->validateGoodsStock($data['items']);

                // 计算订单金额
                $amounts = $this->calculateOrderAmounts($data['items']);

                $address = Address::where('id', $data['id'])
                ->where('address_id', $data['id'])->first();

                $all = $address->province.$address->city.$address->district.$address->detail;

                // 创建订单
                $order = Order::create([
                    'order_no' => Order::generateOrderNo(),
                    'id' => $data['id'],
                    'total_amount' => $amounts['total_amount'],
                    'pay_amount' => $amounts['pay_amount'],
                    'status' => Order::STATUS_PENDING,
                    'remark' => $data['remark'] ?? null,
                    'address' => $all ?? null,
                    'payment_method' => $data['payment_method'] ?? null,
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

            if ($item['category'] && '[]' != $item['category']) {
                $attr = is_array($item['category']) ? $item['category'] : json_decode($item['category'], true);
                $newproduct = AttrPrice::where('good_id', $item['good_id'])
                            ->where(function ($query) use ($attr) {
                                foreach ($attr as $v) {
                                    $query->where('attr->'.$v[0], $v[1]);
                                }
                            })->first();

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

            if ($item['category'] && '[]' != $item['category']) {
                $attr = is_array($item['category']) ? $item['category'] : json_decode($item['category'], true);
                $newproduct = AttrPrice::where('good_id', $item['good_id'])
                            ->where(function ($query) use ($attr) {
                                foreach ($attr as $v) {
                                    $query->where('attr->'.$v[0], $v[1]);
                                }
                            })->first();

                $itemTotal = $newproduct->price * $item['quantity'];
                $totalAmount += $itemTotal;
            } else {
                $itemTotal = $product->price * $item['quantity'];
                $totalAmount += $itemTotal;
            }
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
    private function createOrderItems($order, array $items): void
    {
        foreach ($items as $item) {
            $product = Good::findOrFail($item['good_id']);

            if ($item['category'] && '[]' != $item['category']) {
                $attr = is_array($item['category']) ? $item['category'] : json_decode($item['category'], true);
                $newproduct = AttrPrice::where('good_id', $item['good_id'])
                            ->where(function ($query) use ($attr) {
                                foreach ($attr as $v) {
                                    $query->where('attr->'.$v[0], $v[1]);
                                }
                            })->first();

                OrderItem::create([
                    'order_id' => $order->order_id,
                    'good_id' => $product->good_id,
                    'good_name' => $product->name,
                    'image' => $product->image,
                    'category' => $newproduct->attr,
                    'good_price' => $newproduct->price,
                    'quantity' => $item['quantity'],
                    'total_price' => $newproduct->price * $item['quantity'],
                    // 'product_snapshot' => $product->toArray(), // 保存商品快照
                ]);
            } else {
                OrderItem::create([
                    'order_id' => $order->order_id,
                    'good_id' => $product->good_id,
                    'good_name' => $product->name,
                    'good_price' => $product->price,
                    'image' => $product->image,
                    'quantity' => $item['quantity'],
                    'total_price' => $product->price * $item['quantity'],
                    // 'product_snapshot' => $product->toArray(), // 保存商品快照
                ]);
            }
        }
    }

    /**
     * 扣减库存
     */
    private function deductGoodsStock(array $items): void
    {
        foreach ($items as $item) {
            if ($item['category'] && '[]' != $item['category']) {
                $attr = is_array($item['category']) ? $item['category'] : json_decode($item['category'], true);

                $newproduct = AttrPrice::where('good_id', $item['good_id'])
                            ->where(function ($query) use ($attr) {
                                foreach ($attr as $v) {
                                    $query->where('attr->'.$v[0], $v[1]);
                                }
                            })->first();
                $newproduct->decrement('stock', $item['quantity']);
            } else {
                Good::where('good_id', $item['good_id'])
                ->decrement('stock', $item['quantity']);
            }
        }
    }

    /**
     * 取消订单
     */
    public function cancelOrder(array $order): bool
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
    private function restoreGoodsStock(array $order): void
    {
        foreach ($order->items as $item) {
            if ($item['category'] && '[]' != $item['category']) {
                $attr = is_array($item['category']) ? $item['category'] : json_decode($item['category'], true);
                $newproduct = AttrPrice::where('good_id', $item['good_id'])
                            ->where(function ($query) use ($attr) {
                                foreach ($attr as $v) {
                                    $query->where('attr->'.$v[0], $v[1]);
                                }
                            })->first();
                $newproduct->increment('stock', $item->quantity);
            } else {
                Good::where('good_id', $item->good_id)
                ->increment('stock', $item->quantity);
            }
        }
    }
}
