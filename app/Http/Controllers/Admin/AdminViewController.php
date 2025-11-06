<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\admin\Cate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AdminViewController extends Controller
{
    public function index(Request $request)
    {
        $admin = auth()->guard('admin')->user();

        $cate_list = Cate::where('level', 1)->get();

        return view('admin.index', [
            'admin' => $admin,
            'cate_list' => $cate_list,
        ]);
    }

// 图片删除
      public function delete_img(Request $request)
      {
          $input = $request->input();
          if (! empty($input['image'])) {
              // 删除旧图片
              Storage::disk('public')->delete($input['image']);
          }

          return response()->json([
              'success' => true,
              'message' => '删除成功',

          ], 200);
      }

       /**
        * 处理文件上传
        */
       public function upfile(Request $request)
       {
           $validator = Validator::make($request->all(), [
               'file' => [
                   'required',
                   'file',
                   'max:102400',
                   function ($attribute, $value, $fail) {
                       $allowedExtensions = ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png', 'mp4', 'mp3'];
                       $extension = strtolower($value->getClientOriginalExtension());

                       if (! in_array($extension, $allowedExtensions)) {
                           $fail('不支持的文件类型。');
                       }

                       // 检查 MIME 类型
                    //    $allowedMimes = [
                    //        'audio/mpeg',
                    //        'video/mp4',
                    //        'application/pdf',
                    //        'application/msword',
                    //        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                    //        'image/jpeg',
                    //        'image/png',
                    //    ];

                    //    if (! in_array($value->getMimeType(), $allowedMimes)) {
                    //        $fail('不支持的文件格式。');
                    //    }
                   },
               ],
           ]);

           if ($validator->fails()) {
               return response()->json([
                   'success' => false,
                   'message' => $validator->errors()->first(),
               ], 200);
           }

           $dir = $request->input('dir');

           $file = $request->file('file');

           // 生成唯一文件名
           $fileName = Str::random(20).'.'.$file->getClientOriginalExtension();
           $path = $dir.'/'.date('Y/m/d');

           // 存储文件
           $filePath = $file->storeAs($path, $fileName, 'public');

           // 保存到数据库
           $filedata = [
               'name' => $fileName,
               'original_name' => $file->getClientOriginalName(),
               'path' => $filePath,
               'size' => $file->getSize(),
               'mime_type' => $file->getMimeType(),
               'extension' => $file->getClientOriginalExtension(),
               'disk' => 'public',

           ];

           if ($filePath) {
               return response()->json([
                   'success' => true,
                   'message' => '添加成功',
                   'filedata' => $filedata,
               ], 200);
           } else {
               return response()->json([
                   'success' => false,
                   'message' => '添加失败',

               ], 200);
           }
       }

    public function welcom(Request $request)
    {
        return view('admin.welcom');
    }
}
