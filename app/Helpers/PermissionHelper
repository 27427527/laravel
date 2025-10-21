<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Auth;

if (! function_exists('has_permission')) {
    function has_permission($permission)
    {
        return Auth::check() && Auth::user()->hasPermission($permission);
    }
}

if (! function_exists('has_role')) {
    function has_role($role)
    {
        return Auth::check() && Auth::user()->hasRole($role);
    }
}
