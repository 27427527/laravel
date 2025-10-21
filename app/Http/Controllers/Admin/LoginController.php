<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:15',
            'password' => 'required|string|max:20',
            'captcha' => 'required|captcha',
        ], [
            'captcha.required' => '请输入验证码',
            'captcha.captcha' => '验证码错误',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
            ], 200);
        }

        if (Auth::guard('admin')->attempt($request->only('username', 'password'))) {
            $admin = Auth::guard('admin')->user();

            if ($admin->status != '1') {
                Auth::guard('admin')->logout();

                return response()->json(['message' => '账号已被禁用', 'success' => false], 200);
            }

            return response()->json([
                'message' => '登录成功',
                'admin' => $admin,
                'success' => true,
            ]);
        }

        return response()->json(['message' => '登录失败', 'success' => false], 200);
    }

    public function logout()
    {
        Auth::guard('admin')->logout();

        return redirect()->route('admin.login');
    }

    public function profile()
    {
        $admin = Auth::guard('admin')->user();

        return response()->json(['admin' => $admin]);
    }
}
