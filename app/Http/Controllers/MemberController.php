<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MemberController extends Controller
{
    public function index(){
    	return 'member';
    }

    public function read($id){
    	return $id;
    }
}
