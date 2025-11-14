<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    /**
     * 用户注册
     */
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => '注册成功',
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => $user,
            'state' => 200,
        ]);
    }

    /**
     * 用户登录
     */
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (! $user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'message' => ['提供的凭据不正确。'],
            ]);
        }

        // 删除用户所有现有令牌（可选）
        $user->tokens()->delete();
        $address_list = $user->address;
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => '登录成功',
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => $user,
            'address_list' => $address_list,
            'state' => 200,
        ]);
    }

    /**
     * 用户登出
     */
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => '成功登出',
        ]);
    }

    /**
     * 获取当前用户信息
     */
    public function user(Request $request)
    {
        $user = $request->user();

        $address_list = $user->address;

        return response()->json([
            'message' => '获取信息成功',
            'address_list' => $address_list,
            'user' => $user,

        ]);
    }

    /**
     * 获取 CSRF Cookie（用于 SPA 认证）
     */
    public function getCsrfToken()
    {
        return response()->json([
            'message' => 'CSRF cookie set successfully',
        ]);
    }
}
