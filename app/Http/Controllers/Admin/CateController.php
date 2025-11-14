<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class CateController extends Controller
{
    /**
     * 显示分类列表
     */
    public function index()
    {
        // 获取所有根分类及其子孙分类
        $cate = Cate::with('allChildren')
            ->root()
            ->active()
            ->get();

        return view('cate.index', compact('cate'));
    }

      public function show(Request $request, $id)
      {
          DB::enableQueryLog();
          // 获取分类

          $cate = Cate::find($id);

          $cate_list = $cate->getAllDescendants();

          return view('admin.cate.show', ['cate' => $cate, 'cate_list' => $cate_list]);
      }

    /**
     * 显示创建分类表单
     */
    public function create(Request $request)
    {
        $input = $request->all();

        $parent_id = $input['parent_id'] ? $input['parent_id'] : 0;

        return view('admin.cate.add', compact('parent_id'));
    }

    /**
     * 保存新分类
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:100',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }

        $input = $request->except('_token');

        if (! empty($input['parent_id'])) {
            $parent = Cate::find($input['parent_id']);

            $input['level'] = $parent->level + 1;
        }

        $cate = Cate::create($input);

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
        $cate = Cate::find($id);

        return view('admin.cate.edit', compact('cate'));
    }

    /**
     * 更新分类
     */
    public function update(Request $request, $id)
    {
        $cate = Cate::find($id);

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|string',
        ]);
        $input = $request->except('_token');

        // 处理图片上传

        $old_img = $cate->image;

        $cate->update($input);

        if ($cate) {
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
     * 删除分类
     */
    public function destroy($id)
    {
        $cate = Cate::find($id);

        // 检查是否有子分类
        if ($cate->hasChildren()) {
            return response()->json([
                'success' => false,
                'message' => '请先删除子分类！',
            ], 200);
        }

        if ($cate->hasbanners()) {
            return response()->json([
                'success' => false,
                'message' => '请先删除分类下的banner图',
            ], 200);
        }

        if ($cate->hasbrands()) {
            return response()->json([
                'success' => false,
                'message' => '请先删除分类下的品牌',
            ], 200);
        }

        if ($cate->hasgoods()) {
            return response()->json([
                'success' => false,
                'message' => '请先删除分类下的商品',
            ], 200);
        }

        if ($cate->hasposts()) {
            return response()->json([
                'success' => false,
                'message' => '请先删除分类下的文章',
            ], 200);
        }

        // 删除图片
        if ($cate->image) {
            Storage::disk('public')->delete($cate->image);
        }

        $rs = $cate->delete();

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

    /**
     * 生成唯一的 slug
     */
    private function generateUniqueSlug($name): string
    {
        $slug = Str::slug($name);
        $originalSlug = $slug;
        $count = 1;

        while (Cate::where('slug', $slug)->exists()) {
            $slug = $originalSlug.'-'.$count++;
        }

        return $slug;
    }

    /**
     * 检查循环引用
     */
    private function hasCircularReference(Cate $category, $parentId): bool
    {
        $parent = Cate::find($parentId);

        while ($parent) {
            if ($parent->id === $category->id) {
                return true;
            }
            $parent = $parent->parent;
        }

        return false;
    }

    /**
     * 获取分类树（API）
     */
    public function tree()
    {
        $cate = Cate::with('allChildren')
            ->root()
            ->active()
            ->ordered()
            ->get();

        return response()->json($cate);
    }

    /**
     * 获取子分类（AJAX）
     */
    public function children($parentId)
    {
        $cate = Cate::where('parent_id', $parentId)
            ->active()
            ->ordered()
            ->get();

        return response()->json($cate);
    }

    public function status(Request $request, $id)
    {
        $cate = Cate::find($id);

        $cate->is_active = $cate->is_active == '1' ? '0' : '1';
        $res = $cate->save();

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

    public function order(Request $request, $id)
    {
        $cate = Cate::find($id);

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
        $cate->order = $input['order'];
        $res = $cate->save();

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
