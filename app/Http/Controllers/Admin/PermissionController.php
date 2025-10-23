<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\admin\Permission;
use App\Models\admin\PermissionCate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $permission_list = Permission::all()->groupBy('module');

        return view('admin.permission.list', ['permission_list' => $permission_list]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $cate_list = PermissionCate::all();

        return view('admin.permission.add', ['cate_list' => $cate_list]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:16|unique:permissions',
            'slug' => 'required|string|max:99|unique:permissions',
            'module' => 'required|string|max:16',

        ], [
            'name' => '权限名称错误',
            'slug' => '权限规则错误',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }

        $input = $request->except('_token');

        $rs = Permission::create($input);

        if ($rs) {
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
        $permission = Permission::find($id);

        $cate_list = PermissionCate::all();

        return view('admin.permission.edit', ['permission' => $permission], ['cate_list' => $cate_list]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input = $request->except('_token');
        $validator = Validator::make($input, [
            'name' => [
                'required',
                Rule::unique('permissions')->ignore($id, 'permission_id'),
            ],
            'slug' => [
                'required',
                Rule::unique('permissions')->ignore($id, 'permission_id'),
            ],

        ], [
            'name' => '权限名称错误',
            'slug' => '权限规则错误',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }

        $rs = Permission::find($id);
        $rs->update($input);

        if ($rs) {
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
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $rs = Permission::destroy($id);

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
