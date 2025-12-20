<?php

namespace App\Http\Controllers\index;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use App\Models\index\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BrandController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $cate_id = $request->cate_id ? $request->cate_id : 13;
        $cate = Cate::find($cate_id);
        $brand_list = $cate->brands;

        foreach ($cate->getAncestors() as $v) {
            $nav_list[] = $v;
        }

        return response()->json([
            'message' => 'success',
            'brand_list' => $brand_list,
            'nav_list' => $nav_list,
            'state' => 200,
        ]);
    }

      public function getGoods(Request $request, $id)
      {
          $brand_id = $id;

          $brand = Brand::find($brand_id);

          $cate = Cate::find($brand->cate->cate_id);
          $brand_list = $cate->brands;

          foreach ($cate->getAncestors() as $v) {
              $nav_list[] = $v;
          }

          $good_list = DB::table('goods')->where('brand_id', $brand_id)
          ->where('is_active', 1)
          ->get();

          return response()->json([
              'message' => 'success',
              'good_list' => $good_list,
              'nav_list' => $nav_list,
              'brand' => $brand,
              'state' => 200,
          ]);
      }
}
