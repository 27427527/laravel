<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\index\Order;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $order_list = Order::with('items')->orderBy('order_id', 'desc')
        ->where(function ($query) use ($request) {
            // 按关键字搜索
            if ($request->has('keyword') && ! empty($request->input('keyword'))) {
                $keyword = $request->input('keyword');
                $query->where('name', 'like', '%'.$keyword.'%')
                      ->orWhere('phone', 'like', "%{$keyword}%")
                      ->orWhere('order_no', 'like', "%{$keyword}%")
                      ->orWhere('express_no', 'like', "%{$keyword}%");
            }
        })
        ->where(function ($query) use ($request) {
            // 按起始日期搜索
            if ($request->has('start') && ! empty($request->input('start'))) {
                $query->where('created_at', '>=', $request->input('start'));
            }

            // 按截止日期搜索
            if ($request->has('end') && ! empty($request->input('end'))) {
                $query->where('created_at', '<=', $request->input('end'));
            }
        })
        ->where(function ($query) use ($request) {
            // 按订单状态
            if ($request->has('status') && ! empty($request->input('status'))) {
                $query->where('status', $request->input('status'));
            }
        })
        ->paginate(2)->withQueryString();

        // print_r($order_list);

        $state_arr = ['pending' => '待付款', 'paid' => '已支付', 'shipped' => '已发货', 'completed' => '已完成',  'cancelled' => '已退款', 'canceling' => '退款中'];
        $pay_arr = [1 => '支付宝支付', 2 => '微信支付'];

        return view('admin.order.list', ['order_list' => $order_list, 'state_arr' => $state_arr, 'pay_arr' => $pay_arr]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $order = Order::find($id);
        $state_arr = ['shipped' => '已发货', 'cancelled' => '已退款'];

        return view('admin.order.edit', compact('order', 'state_arr'));
    }

    public function update(Request $request, $id)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'express_name' => 'required|string',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }
        $order = Order::find($id);

        if (! $input['status']) {
            unset($input['status']);
        }

        $rs = $order->update($input);

        if ($rs) {
            return response()->json([
                'success' => true,
                'message' => '修改成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '修改失败',
            ], 200);
        }
    }

      public function vip(Request $request)
      {
          $input = $request->all();
          $member_list = User::orderBy('id', 'asc')
          ->where('is_vip', '1')
          ->where(function ($query) use ($request) {
              // 按关键字搜索
              if ($request->has('keyword') && ! empty($request->input('keyword'))) {
                  $keyword = $request->input('keyword');
                  $query->where('name', 'like', '%'.$keyword.'%')
                        ->orWhere('phone', 'like', "%{$keyword}%")
                        ->orWhere('email', 'like', "%{$keyword}%");
              }
          })
          ->where(function ($query) use ($request) {
              // 按起始日期搜索
              if ($request->has('start') && ! empty($request->input('start'))) {
                  $query->where('created_at', '>=', $request->input('start'));
              }

              // 按截止日期搜索
              if ($request->has('end') && ! empty($request->input('end'))) {
                  $query->where('created_at', '<=', $request->input('end'));
              }
          })
          ->paginate(2)->withQueryString();

          return view('admin.member.vip', ['member_list' => $member_list]);
      }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $res = User::find($id)->delete();
        if ($res) {
            return response()->json([
                'success' => true,
                'message' => '删除成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '删除失败',
            ], 200);
        }
    }
/*     * Change the status of the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function status(Request $request, $id)
    {
        $user = User::find($id);

        $user->status = $user->status == '1' ? '0' : '1';
        $user->updated_at = date('Y-m-d H:i:s');
        $res = $user->save();

        if ($res) {
            return response()->json([
                'success' => true,
                'message' => '状态修改成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '状态修改失败',
            ], 200);
        }
    }
}
