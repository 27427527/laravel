<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\index\AttrName;
use App\Models\index\AttrPrice;
use App\Models\index\AttrVal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AttrValController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'attr_name' => 'required|array',

        ]);

        $list = $request->attr_name;

        try {
            DB::transaction(function () use ($list) {
                $data = [];

                foreach ($list as $k => $item) {
                    $attrname = AttrName::find($k);
                    $attrname->attr_vals()->delete();
                    foreach ($item as $k2 => $v) {
                        if ($v) {
                            $data[] = ['name' => $v, 'attr_name_id' => $k];
                        }
                    }
                }

                $rs = AttrVal::insert($data);

                // 所有属性值
                $price_arr = $attrname->goods->allAttr_vals();

                // 所有价格
                $attr_prices = $attrname->goods->attr_prices();

                $del = [];

                foreach ($attr_prices as $item) {
                    $attr_arr = json_decode($item['attr'], true);

                    foreach ($attr_arr as $v) {
                        if (! in_array($v, $price_arr)) {
                            $del[] = $item['attr_price_id'];
                        }
                    }
                }

                $del = array_unique($del);
                AttrPrice::destroy($del);
            });

            return response()->json([
                'success' => true,
                'message' => '删除成功',
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 200);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
