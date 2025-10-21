<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Admin::all();

        return view('admin.user.list', compact('user'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.user.add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:16',
            'password' => 'required|string|max:20',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }

        $input = $request->all();

        // dd($input);

        $password = bcrypt($input['password']);

        $user = Admin::create([
            'username' => $input['username'],
            'password' => $password,
            'real_name' => $input['real_name'],
            'phone' => $input['phone'],
        ]);

        if ($user) {
            return response()->json([
                'success' => true,
                'message' => '用户添加成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '用户添加失败',
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
        $admin = auth()->guard('admin')->user();

        return view('admin.user.info', compact('admin'));
    }

    /**
     * 修改后台已登录用户资料
     *
     * @return \Illuminate\Http\Response
     */
    public function doedit(Request $request)
    {
        $input = $request->except(['_token']);

        $admin = auth()->guard('admin')->user();

        // $user = Admin::find($admin['id']);

        if (isset($input['password']) && ! empty($input['password'])) {
            $input['password'] = bcrypt($input['password']);
        } else {
            unset($input['password']);
        }

        $rs = $admin->update($input);

        if ($rs) {
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
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = Admin::find($id);

        return view('admin.user.edit', compact('user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input = $request->except(['_token']);

        $user = Admin::find($id);

        if (isset($input['password']) && ! empty($input['password'])) {
            $input['password'] = bcrypt($input['password']);
        } else {
            unset($input['password']);
        }

        $rs = $user->update($input);

        if ($rs) {
            return response()->json([
                'success' => true,
                'message' => '用户修改成功',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => '用户修改失败',
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
        $res = Admin::find($id)->delete();
        if ($res) {
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
/*     * Change the status of the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function status(Request $request, $id)
    {
        $user = Admin::find($id);

        // Admin::where('id', 2)->update(['status' => 0, 'updated_at' => date('Y-m-d H:i:s'), 'avatar' => '123']);

        // $res = DB::table('admins')
        //       ->where('id', 2)
        //       ->update(['avatar' => '123', 'status' => '0', 'updated_at' => date('Y-m-d H:i:s')]);

        $user->status = $user->status == '1' ? '0' : '1';
        $user->updated_at = date('Y-m-d H:i:s');
        $res = $user->save();

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
}
