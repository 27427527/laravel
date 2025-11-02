<?php

use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;

// 公开路由（无需认证）
Route::get('/csrf-cookie', [AuthController::class, 'getCsrfToken']);
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// 轮播图
Route::get('/banner', [App\Http\Controllers\index\BannerController::class, 'show']);

// 受保护的路由（需要认证）
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/percate', [App\Http\Controllers\TaskController::class, 'index']);
    // 用户相关
    Route::get('/user', [AuthController::class, 'user']);
    Route::post('/logout', [AuthController::class, 'logout']);

    // 其他受保护的路由...
    Route::get('/dashboard', function () {
        return response()->json([
            'message' => '欢迎访问仪表板！',
            'user' => auth()->user(),
        ]);
    });
});
