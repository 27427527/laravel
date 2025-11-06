<?php

namespace App\Http\Controllers\index;

use App\Http\Controllers\Controller;
use App\Models\index\AttrName;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AttrNameController extends Controller
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
            'name' => 'required|string|max:255',
            'good_id' => 'required|exists:goods,good_id',

        ]);

        $attrname = AttrName::create($validated);

        if ($attrname) {
            return response()->json([
                'success' => true,
                'message' => '添加成功',
                'attr_name_id' => $attrname->attr_name_id,
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '添加失败',
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
        try {
            DB::transaction(function () use ($id) {
                $attrname = AttrName::find($id);

                // 删除属性值
                $attrname->attr_vals()->delete();
                // 删除属性名
                $attrname->delete();
                // 删除关联价格
                $attrname->goods->attr_prices()->delete();
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
}
