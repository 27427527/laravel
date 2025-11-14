<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use App\Models\index\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $cate_id = $request->cate_id;
        $cate = Cate::find($cate_id);
        $brand_list = $cate->brands;
        $nav_list = $cate->getAncestors();

        return view('admin.brand.index', ['cate' => $cate, 'brand_list' => $brand_list, 'nav_list' => $nav_list]);
    }

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

    public function create(Request $request)
    {
        $cate_id = $request->cate_id;

        return view('admin.brand.add', ['cate_id' => $cate_id]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:100',
            'image' => 'required|string|max:100',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }

        $input = $request->except('_token');

        $cate = Brand::create($input);

        if ($cate) {
            return response()->json([
                'success' => true,
                'message' => '添加成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '添加失败',
            ], 200);
        }
    }

    /**
     * 显示编辑分类表单
     */
    public function edit($id)
    {
        $brand = Brand::find($id);

        return view('admin.brand.edit', compact('brand'));
    }

    /**
     * 更新分类
     */
    public function update(Request $request, $id)
    {
        $brand = Brand::find($id);

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'image' => 'string',
        ]);
        $input = $request->except('_token');

        // 处理图片上传

        $old_img = $brand->image;

        $brand->update($input);

        if ($brand) {
            // 上传了新图片
            if ($input['image'] && ($input['image'] != $old_img) && $old_img) {
                // 删除旧图片

                Storage::disk('public')->delete($old_img);
            }

            // 没有上传图片
            if (empty($input['image']) && $old_img) {
                // 删除旧图片

                Storage::disk('public')->delete($old_img);
            }

            return response()->json([
                'success' => true,
                'message' => '添加成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '添加失败',
            ], 200);
        }
    }

    /**
     * 删除
     */
    public function destroy($id)
    {
        $brand = Brand::find($id);

        // 删除图片
        if ($brand->image) {
            Storage::disk('public')->delete($brand->image);
        }

        $rs = $brand->delete();

        if ($rs) {
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
}
