<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use App\Models\index\Brand;
use App\Models\index\Good;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GoodController extends Controller
{
    public function index(Request $request)
    {
        $cate_id = $request->cate_id;
        $cate = Cate::find($cate_id);

        $nav_list = $cate->getAncestors();

        $good_list = $cate->goods()
                   ->with('brands')
                   ->with('cates')
                   ->active()
                   ->orderBy('sort_order')
                   ->orderBy('created_at', 'desc')
                   ->paginate(12);

        return view('admin.good.index', ['cate' => $cate, 'good_list' => $good_list, 'nav_list' => $nav_list]);
    }

       public function attr(Request $request, $id)
       {
           $good = Good::find($id);

           return view('admin.good.attr', ['good' => $good]);
       }

        public function eprice(Request $request, $id)
        {
            $good = Good::find($id);

            // 根据属性生成的价格组合
            $attr_list = $good->generateCombinationsLazy();

            // 数据库的价格组合
            $price_list = $good->attr_prices;

            $count = 0;

            return view('admin.good.eprice', ['good' => $good, 'attr_list' => $attr_list, 'count' => $count, 'price_list' => $price_list]);
        }

    public function create(Request $request)
    {
        $cate = Cate::where('relation', 'good')->first();

        $cate_list = $cate->getAllDescendants();
        $brand_list = Brand::get();
        $cate_id = $request->cate_id;

        return view('admin.good.add', compact('cate_list', 'brand_list', 'cate_id'));
    }

    public function store(Request $request)
    {
        // dd($request);
        $input = $request->input();
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'intro' => 'required|string|max:191',
            'description' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'original_price' => 'nullable|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'sku' => 'nullable|string|unique:goods',
            'image' => 'required|max:2048',
            'images' => 'nullable|array',
            'is_featured' => 'boolean',
            'is_active' => 'boolean',
            'cate_id' => 'required|exists:cates,cate_id',
            'brand_id' => 'required|exists:brands,brand_id',
            'specifications_name' => 'nullable|array',
            'specifications_val' => 'nullable|array',
        ]);
        if (! empty($input['specifications_name'])) {
            // 参数数组处理
            $specifications = [];

            $specifications_name = $input['specifications_name'];
            $specifications_val = $input['specifications_val'];

            foreach ($specifications_name as $k => $v) {
                if ($specifications_val[$k]) {
                    $specifications[$k] = ['name' => $v, 'value' => $specifications_val[$k]];
                }
            }

            $input['specifications'] = $specifications;
        }

        $good = Good::create($input);

        if ($good) {
            // 商品添加分类
            $cate_list = $request->input('cate_id', []);
            if (! empty($cate_list)) {
                $good->cates()->attach($cate_list);
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

    public function show(Good $product)
    {
        return view('products.show', compact('product'));
    }

    public function edit(Request $request, $id)
    {
        $good = Good::find($id);

        $cate = Cate::where('relation', 'good')->first();

        $cate_list = $cate->getAllDescendants();
        $brand_list = Brand::get();

        return view('admin.good.edit', compact('good', 'cate_list', 'brand_list'));
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'intro' => 'required|string|max:191',
            'description' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'original_price' => 'nullable|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'sku' => 'nullable|string|unique:goods,sku,'.$id.',good_id',
            'image' => 'nullable|max:2048',
            'images' => 'nullable|array',
            'is_featured' => 'boolean',
            'is_active' => 'boolean',
            'cate_id' => 'required|exists:cates,cate_id',
            'brand_id' => 'nullable|exists:brands,brand_id',
            'specifications_name' => 'nullable|array',
            'specifications_val' => 'nullable|array',
        ]);

        $good = Good::find($id);
        $input = $request->input();
        // 参数数组处理

        if (! empty($input['specifications_name'])) {
            $specifications = [];

            $specifications_name = $input['specifications_name'];
            $specifications_val = $input['specifications_val'];

            foreach ($specifications_name as $k => $v) {
                if ($specifications_val[$k]) {
                    $specifications[$k] = ['name' => $v, 'value' => $specifications_val[$k]];
                }
            }

            $input['specifications'] = $specifications;
        }

        $res = $good->update($input);

        if ($res) {
            if ($good) {
                // 商品添加分类
                $cate_list = $request->input('cate_id', []);
                if (! empty($cate_list)) {
                    $good->cates()->sync($cate_list);
                } else {
                    $good->cates()->detach();
                }
            }

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

    public function destroy(Good $product)
    {
        $product->delete();

        return redirect()->route('products.index')
            ->with('success', '商品删除成功！');
    }

     public function featured(Request $request, $id)
     {
         $good = Good::find($id);

         $good->is_featured = $good->is_featured == '1' ? '0' : '1';
         $res = $good->save();

         if ($res) {
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

     public function active(Request $request, $id)
     {
         $good = Good::find($id);

         $good->is_active = $good->is_active == '1' ? '0' : '1';
         $res = $good->save();

         if ($res) {
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

     public function order(Request $request, $id)
     {
         $good = Good::find($id);

         $input = $request->all();

         $validator = Validator::make($input, [
             'order' => 'required|integer',

         ]);

         if ($validator->fails()) {
             return response()->json([
                 'success' => false,
                 'message' => $validator->errors()->first(),
             ], 200);
         }
         $good->sort_order = $input['order'];
         $res = $good->save();

         if ($res) {
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
}
