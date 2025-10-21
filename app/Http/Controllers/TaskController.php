<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index(Request $request){
        $name=$request->input('name');
    	return 'index.controller'.$name;
    }

    public function read($id){
    	return $id;
    }
}
