<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\admin\Permission;
use App\Models\admin\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $roles = Role::all();

        return view('admin.role.list', ['roles' => $roles]);
    }

    /**
     * @return \Illuminate\Http\Response
     */
    public function auth($id)
    {
        $role = Role::find($id);

        $role_permissions = $role->permissions->pluck('permission_id')->toArray();

        // dd($role_permissions);

        $permission_list = Permission::all()->groupBy('module');

        return view('admin.role.auth', ['role' => $role, 'permission_list' => $permission_list, 'role_permissions' => $role_permissions]);
    }

    /**
     * 更新角色权限
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function doauth(Request $request, $id)
    {
        $input = $request->all();

        $role = Role::find($id);

        $role_list = $request->input('id', []);
        if (! empty($role_list)) {
            $role->permissions()->sync($role_list);
        } else {
            $role->permissions()->detach();
        }

        return response()->json([
            'success' => true,
            'message' => '分配权限成功',
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // dd('create');

        return view('admin.role.add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:16|unique:roles',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }

        $input = $request->all();

        $role = Role::create([
            'name' => $input['name'],
            'slug' => $input['slug'],
            'description' => $input['description'],
        ]);

        if ($role) {
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
        $role = Role::find($id);

        return view('admin.role.edit', ['role' => $role]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:16',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }

        $input = $request->all();

        $role = Role::find($id);
        $role->name = $input['name'];
        $role->slug = $input['slug'];
        $role->description = $input['description'];
        $role->save();

        if ($role) {
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
