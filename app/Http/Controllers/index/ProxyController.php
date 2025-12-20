<?php

namespace App\Http\Controllers\index;

use App\Http\Controllers\Controller;
use App\Providers\ProxyHttpClientServiceProvider as ProxyHttpClient;
use Illuminate\Http\Request;

class ProxyController extends Controller
{
    protected $proxyClient;

    public function __construct(ProxyHttpClient $proxyClient)
    {
        $this->proxyClient = $proxyClient;
    }

    public function fetchData(Request $request)
    {
        // 使用代理请求
        $data = $this->proxyClient->get($request->input('url'));

        return response()->json($data);
    }

    public function postData(Request $request)
    {
        $data = $this->proxyClient->post($request->input('url'), $request->input('data', []));

        return response()->json($data);
    }
}
