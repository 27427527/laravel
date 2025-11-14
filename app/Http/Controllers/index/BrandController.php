<?php

namespace App\Http\Controllers\index;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $cate_id = $request->cate_id;
        $cate = Cate::find($cate_id);
        $brand_list = $cate->brands;

        return response()->json([
            'message' => 'success',
            'brand_list' => $brand_list,
            'state' => 200,
        ]);
    }
}
