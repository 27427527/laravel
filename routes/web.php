<?php

use App\Http\Controllers\Admin\AdminViewController;
use App\Http\Controllers\Admin\LoginController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    // return view('welcome');
    return 'helloworld';
});

// 后台路由

Route::prefix('admin')->group(function () {
    // 后台登录路由
    Route::view('/login', 'admin.login')->name('admin.login');
    Route::post('/login', [LoginController::class, 'login']);

    // 后台页面路由
    Route::middleware('admin.auth')->group(function () {
        // 退出登录路由
        Route::get('/logout', [LoginController::class, 'logout']);

        // 后台文件上传
        Route::post('/upfile', [AdminViewController::class, 'upfile']);

        // 后台页面路由

        Route::controller(AdminViewController::class)->group(function () {
            Route::get('/index', 'index');
            Route::get('/', 'index');
            Route::get('/welcom', 'welcom');
        });

        // 用户管理路由

        Route::resource('/user', App\Http\Controllers\Admin\UserController::class)->middleware('role:max');
        Route::put('/user/status/{id}', [App\Http\Controllers\Admin\UserController::class, 'status']);
        Route::put('/info', [App\Http\Controllers\Admin\UserController::class, 'doedit']);

        // 分类管理路由
        Route::resource('/cate', App\Http\Controllers\Admin\CateController::class);
        Route::put('/cate/status/{id}', [App\Http\Controllers\Admin\CateController::class, 'status']);
        Route::put('/cate/order/{id}', [App\Http\Controllers\Admin\CateController::class, 'order']);

        // 角色管理路由
        Route::resource('/role', App\Http\Controllers\Admin\RoleController::class)->middleware('permission:role.index');
        Route::get('/role/auth/{id}', [App\Http\Controllers\Admin\RoleController::class, 'auth']);
        Route::put('/role/auth/{id}', [App\Http\Controllers\Admin\RoleController::class, 'doauth']);

        // 权限管理路由
        Route::resource('/permission', App\Http\Controllers\Admin\PermissionController::class)->middleware('permission:permission.index');
        Route::resource('/permissioncate', App\Http\Controllers\Admin\PermissionCateController::class)->except([
            'show', 'create',
        ])->middleware('permission:permission.cate');
    });
});
