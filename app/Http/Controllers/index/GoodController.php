<?php

namespace App\Http\Controllers\index;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use App\Models\index\Good;
use Illuminate\Http\Request;

class GoodController extends Controller
{
    public function show(Request $request)
    {
        $cate_id = $request->cate_id;
        $cate = Cate::find($cate_id);
        $good_list = $cate->goods->where('is_active', true);

        foreach ($cate->getAncestors() as $v) {
            $nav_list[] = $v;
        }

        return response()->json([
            'message' => 'success',
            'good_list' => $good_list,
            'nav_list' => $nav_list,
            'state' => 200,
        ]);
    }

     public function featured()
     {
         $good_list = Good::where('is_active', '1')
         ->where('is_featured', '1')
         ->get()->toArray();

         return response()->json([
             'message' => 'success',
             'good_list' => $good_list,
             'state' => 200,
         ]);
     }

     public function details(Request $request)
     {
         $good_id = $request->good_id;

         $good_details = Good::find($good_id);

         $good_details->all_attrs();

         $good_details->attr_prices;

         $good_details->dis_prices = $good_details->attr_prices->where('stock', 0)->pluck('attr');
         $good_details->default_prices = $good_details->attr_prices->where('stock', '>', 0)->first();

         return response()->json([
             'message' => 'success',
             'good_details' => $good_details,
             'state' => 200,
         ]);
     }
}
