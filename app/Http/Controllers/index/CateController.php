<?php

namespace App\Http\Controllers\index;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;

class CateController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        $cate_list = Cate::withCount('children')
        ->with('children')
        ->where('level', '1')
        ->where('is_active', '1')
        ->orderBy('order')
        ->get()->toArray();

        return response()->json([
            'message' => 'success',
            'cate_list' => $cate_list,
            'state' => 200,
        ]);
    }
}
