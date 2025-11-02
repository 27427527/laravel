<?php

namespace App\Http\Controllers;

use App\Models\admin\PermissionCate;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index(Request $request)
    {
        $cate_list = PermissionCate::all();

        return response()->json([

            'cate_list' => $cate_list,
        ], 200);
    }
}
