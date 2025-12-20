<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\index\AddressController;
use App\Http\Controllers\index\OrderController;
use App\Http\Controllers\index\ProxyController;
use Illuminate\Support\Facades\Route;

Route::post('/chat/send', [ChatController::class, 'send']);
Route::get('/Proxy', [ProxyController::class, 'fetchData']);
Route::post('/Proxy', [ProxyController::class, 'postData']);

// 公开路由（无需认证）
Route::get('/csrf-cookie', [AuthController::class, 'getCsrfToken']);
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// 轮播图
Route::get('/banner', [App\Http\Controllers\index\BannerController::class, 'show']);
// 品牌
Route::get('/brand', [App\Http\Controllers\index\BrandController::class, 'show']);
Route::get('/brand/good/{id}', [App\Http\Controllers\index\BrandController::class, 'getGoods']);

// 文章
Route::get('/post/{id}', [App\Http\Controllers\index\PostController::class, 'show']);
Route::get('/post/list/{id}', [App\Http\Controllers\index\PostController::class, 'list']);

Route::get('/cate', [App\Http\Controllers\index\CateController::class, 'show']);

Route::get('/good', [App\Http\Controllers\index\GoodController::class, 'show']);
Route::get('/good/featured', [App\Http\Controllers\index\GoodController::class, 'featured']);
Route::get('/good/details', [App\Http\Controllers\index\GoodController::class, 'details']);
Route::post('/good/search', [App\Http\Controllers\index\GoodController::class, 'search']);

Broadcast::routes(['middleware' => ['auth:sanctum']]);

// 受保护的路由（需要认证）
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/send', [App\Http\Controllers\Admin\MessageController::class, 'sendMessage']);
    // 订单
    Route::post('/orders', [OrderController::class, 'store']);
    Route::get('/orders', [OrderController::class, 'show']);
    Route::get('/orders/list', [OrderController::class, 'list']);
    Route::put('/orders/{order}/cancel', [OrderController::class, 'cancel']);

    // 地址
    Route::post('/address', [AddressController::class, 'store']);
    Route::get('/address/{id}', [AddressController::class, 'show']);
    Route::put('/address/{id}', [AddressController::class, 'update']);
    Route::put('/address/default/{id}', [AddressController::class, 'default']);
    Route::delete('/address/{id}', [AddressController::class, 'destory']);

    Route::post('/percate', [App\Http\Controllers\TaskController::class, 'index']);
    // 用户相关
    Route::get('/user', [AuthController::class, 'user']);
    Route::put('/user', [AuthController::class, 'updateProfile']);
    Route::put('/user/password', [AuthController::class, 'updatePassword']);
    Route::post('/user/avatar', [AuthController::class, 'avatar']);
    Route::post('/logout', [AuthController::class, 'logout']);

    // 其他受保护的路由...
    Route::get('/dashboard', function () {
        return response()->json([
            'message' => '欢迎访问仪表板！',
            'user' => auth()->user(),
        ]);
    });
});
