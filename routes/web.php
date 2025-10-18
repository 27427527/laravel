<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\TaskController;
use App\Http\Controllers\MemberController;
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

Route::get('/index2/{name?}', function ($name='hi') {
    return '222'.$name;
})->where(['name'=>'[0-9]+']);

Route::get('/index2', function () {
    return '222';
});



// Route::get('user/{id}', [UserController::class, 'show']);

Route::get('/task', [TaskController::class,'index']);
Route::get('/member', [MemberController::class,'index']);

// Route::get('/task/read/{id}', 'TaskController@read');
Route::get('/task/read/{id}', 'App\Http\Controllers\TaskController@read');
