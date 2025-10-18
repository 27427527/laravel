<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index(){
    	return '111';
    }

    public function read($id){
    	return $id;
    }
}
