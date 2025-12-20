<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
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
            'password' => 'required|string|min:8|confirmed',
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
         * 修改当前用户信息
         */
        public function updateProfile(Request $request)
        {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
                'phone' => 'nullable|string|max:20',

            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => '验证失败',
                    'errors' => $validator->errors(),
                ], 422);
            }

            try {
                $user->update($validator->validated());

                return response()->json([
                    'success' => true,
                    'message' => '个人信息更新成功',
                    'user' => $user->fresh(),
                ]);
            } catch (\Exception $e) {
                return response()->json([
                    'success' => false,
                    'message' => '更新失败: '.$e->getMessage(),
                ], 500);
            }
        }

    /**
     * 更新用户头像
     */
    public function avatar(Request $request)
    {
        $user = $request->user();

        $validator = Validator::make($request->all(), [
            'avatar' => 'required|file|image|mimes:jpeg,png,jpg,gif|max:5120', // 5MB
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => '头像验证失败',
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            // 删除旧头像
            if ($user->profile_photo_path && Storage::disk('public')->exists($user->profile_photo_path)) {
                Storage::disk('public')->delete($user->profile_photo_path);
            }

            // 存储新头像
            $avatarPath = $request->file('avatar')->store('avatars', 'public');

            // 生成完整的头像 URL
            $avatarUrl = Storage::disk('public')->url($avatarPath);

            // 更新用户记录
            $user->update([
                'profile_photo_path' => $avatarPath,

            ]);

            return response()->json([
                'success' => true,
                'message' => '头像更新成功',
                'avatar_url' => $avatarUrl,
                'user' => $user->fresh(),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => '头像更新失败: '.$e->getMessage(),
            ], 500);
        }
    }

    /**
     * 更新密码
     */
    public function updatePassword(Request $request)
    {
        $user = $request->user();

        $validator = Validator::make($request->all(), [
            'current_password' => ['required'],
            'password' => ['required',  'min:8', 'confirmed'],
        ]);

        if (! $user || ! Hash::check($request->current_password, $user->password)) {
            throw ValidationException::withMessages([
                'message' => ['当前密码错误'],
            ]);
        }

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => '密码验证失败',
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $user->update([
                'password' => Hash::make($request->password),
            ]);

            return response()->json([
                'success' => true,
                'message' => '密码更新成功',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => '密码更新失败: '.$e->getMessage(),
            ], 500);
        }
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
