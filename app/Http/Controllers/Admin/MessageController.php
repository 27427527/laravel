<?php

namespace App\Http\Controllers\Admin;

use App\Events\ChatMessage;
use App\Events\PrivateMessage;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MessageController extends Controller
{
    public function public()
    {
        return view('admin.channel.public');
    }

    // 后台管理员发送消息
     public function adminSendMessage(Request $request)
     {
         $request->validate([
             'message' => 'required|string|max:1000',
             'channel' => 'sometimes|string',
             'to_user_id' => 'sometimes|integer',
         ]);

         $user = Auth::guard('admin')->user();
         $message = $request->message;

         // 发送到公共频道
         if ($request->channel === 'public') {
             broadcast(new ChatMessage($user, $message));

             return response()->json(['status' => 'success', 'success' => true, 'message' => '消息已发送到公共频道']);
         }

         // 发送私有消息
         if ($request->to_user_id) {
             broadcast(new PrivateMessage($user, $request->to_user_id, $message));

             return response()->json(['status' => 'success', 'success' => true, 'message' => '私有消息已发送', 'user' => $user]);
         }

         // 默认发送到公共聊天室
         broadcast(new ChatMessage($user, $message));

         return response()->json(['status' => 'success', 'success' => true, 'message' => '消息发送成功']);
     }

    // 前端用户发送消息
    public function sendMessage(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:1000',
            'channel' => 'sometimes|string',
            'to_user_id' => 'sometimes|integer',
        ]);

        $user = Auth::user();
        $message = $request->message;

        // 发送到公共频道
        if ($request->channel === 'public') {
            broadcast(new ChatMessage($user, $message));

            return response()->json(['status' => 'success', 'message' => '消息已发送到公共频道']);
        }

        // 发送私有消息
        if ($request->to_user_id) {
            broadcast(new PrivateMessage($user, $request->to_user_id, $message));

            return response()->json(['status' => 'success', 'message' => '私有消息已发送', 'user' => $user]);
        }

        // 默认发送到公共聊天室
        broadcast(new ChatMessage($user, $message));

        return response()->json(['status' => 'success', 'message' => '消息发送成功']);
    }
}
