<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckRole
{
    public function handle(Request $request, Closure $next, $role)
    {
        if (! $request->user('admin') || ! $request->user('admin')->hasRole($role)) {
            abort(403, '无权访问');
        }

        return $next($request);
    }
}
