<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateOrderRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'items' => 'required|array|min:1',
            'items.*.good_id' => 'required|exists:goods,good_id',
            'items.*.quantity' => 'required|integer|min:1',
            'address' => 'required|integer',
            'payment_method' => 'required|integer',
            // 'address.name' => 'required|string',
            // 'address.phone' => 'required|string',
            // 'address.province' => 'required|string',
            // 'address.city' => 'required|string',
            // 'address.district' => 'required|string',
            // 'address.detail' => 'required|string',
            'remark' => 'nullable|string|max:500',
        ];
    }

    public function messages(): array
    {
        return [
            'items.required' => '请选择商品',
            'items.*.good_id.required' => '商品ID不能为空',
            'items.*.quantity.required' => '商品数量不能为空',
            'items.*.quantity.min' => '商品数量至少为1',
            'payment_method' => '请选择一种支付方式',
            'address' => '地址不能为空',
        ];
    }
}
