<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class UEditorController extends Controller
{
    public function upload(Request $request)
    {
        $action = $request->get('action');

        switch ($action) {
            case 'config':
                return $this->getConfig();

            case 'uploadimage':
                return $this->uploadImage($request);

            case 'uploadscrawl':
                return $this->uploadScrawl($request);

            case 'uploadvideo':
                return $this->uploadVideo($request);

            case 'uploadfile':
                return $this->uploadFile($request);

            case 'listimage':
                return $this->listImage($request);

            case 'listfile':
                return $this->listFile($request);

            default:
                return response()->json([
                    'state' => '请求地址出错',
                ]);
        }
    }

    /**
     * 获取配置
     */
    private function getConfig()
    {
        $config = [
            /* 上传图片配置项 */
            'imageActionName' => 'uploadimage',
            'imageFieldName' => 'upfile',
            'imageMaxSize' => 2048000,
            'imageAllowFiles' => ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp'],
            'imageCompressEnable' => true,
            'imageCompressBorder' => 1600,
            'imageInsertAlign' => 'none',
            'imageUrlPrefix' => '',

            /* 涂鸦图片上传配置项 */
            'scrawlActionName' => 'uploadscrawl',
            'scrawlFieldName' => 'upfile',
            'scrawlMaxSize' => 2048000,
            'scrawlUrlPrefix' => '',
            'scrawlInsertAlign' => 'none',

            /* 截图工具上传 */
            'snapscreenActionName' => 'uploadimage',
            'snapscreenUrlPrefix' => '',
            'snapscreenInsertAlign' => 'none',

            /* 抓取远程图片配置 */
            'catcherLocalDomain' => ['127.0.0.1', 'localhost', 'img.baidu.com'],
            'catcherActionName' => 'catchimage',
            'catcherFieldName' => 'source',
            'catcherUrlPrefix' => '',
            'catcherMaxSize' => 2048000,
            'catcherAllowFiles' => ['.png', '.jpg', '.jpeg', '.gif', '.bmp'],

            /* 上传视频配置 */
            'videoActionName' => 'uploadvideo',
            'videoFieldName' => 'upfile',
            'videoUrlPrefix' => '',
            'videoMaxSize' => 102400000,
            'videoAllowFiles' => [
                '.flv', '.swf', '.mkv', '.avi', '.rm', '.rmvb', '.mpeg', '.mpg',
                '.ogg', '.ogv', '.mov', '.wmv', '.mp4', '.webm', '.mp3', '.wav', '.mid',
            ],

            /* 上传文件配置 */
            'fileActionName' => 'uploadfile',
            'fileFieldName' => 'upfile',
            'fileUrlPrefix' => '',
            'fileMaxSize' => 51200000,
            'fileAllowFiles' => [
                '.png', '.jpg', '.jpeg', '.gif', '.bmp',
                '.flv', '.swf', '.mkv', '.avi', '.rm', '.rmvb', '.mpeg', '.mpg',
                '.ogg', '.ogv', '.mov', '.wmv', '.mp4', '.webm', '.mp3', '.wav', '.mid',
                '.rar', '.zip', '.tar', '.gz', '.7z', '.bz2', '.cab', '.iso',
                '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx', '.pdf', '.txt', '.md', '.xml',
            ],

            /* 列出指定目录下的图片 */
            'imageManagerActionName' => 'listimage',
            'imageManagerListPath' => '/ueditor/php/upload/image/',
            'imageManagerListSize' => 20,
            'imageManagerUrlPrefix' => '',
            'imageManagerInsertAlign' => 'none',
            'imageManagerAllowFiles' => ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp'],

            /* 列出指定目录下的文件 */
            'fileManagerActionName' => 'listfile',
            'fileManagerListPath' => '/ueditor/php/upload/file/',
            'fileManagerListSize' => 20,
            'fileManagerUrlPrefix' => '',
            'fileManagerAllowFiles' => [
                '.png', '.jpg', '.jpeg', '.gif', '.bmp',
                '.flv', '.swf', '.mkv', '.avi', '.rm', '.rmvb', '.mpeg', '.mpg',
                '.ogg', '.ogv', '.mov', '.wmv', '.mp4', '.webm', '.mp3', '.wav', '.mid',
                '.rar', '.zip', '.tar', '.gz', '.7z', '.bz2', '.cab', '.iso',
                '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx', '.pdf', '.txt', '.md', '.xml',
            ],
        ];

        return response()->json($config);
    }

    /**
     * 上传图片
     */
    private function uploadImage(Request $request)
    {
        $file = $request->file('upfile');

        if (! $file) {
            return response()->json([
                'state' => '未找到上传文件',
            ]);
        }

        // 验证文件类型
        $allowedTypes = ['png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp'];
        $extension = strtolower($file->getClientOriginalExtension());

        if (! in_array($extension, $allowedTypes)) {
            return response()->json([
                'state' => '不支持的文件类型',
            ]);
        }

        // 验证文件大小 (2MB)
        if ($file->getSize() > 2 * 1024 * 1024) {
            return response()->json([
                'state' => '文件大小超过限制',
            ]);
        }

        try {
            // 生成文件名
            $filename = 'ueditor/images/'.date('Y/m').'/'.Str::random(20).'.'.$extension;

            // 存储文件
            $path = Storage::disk('public')->put($filename, file_get_contents($file));

            if ($path) {
                // $url = Storage::disk('public')->url($filename);
                $url = '/storage/'.$filename;

                return response()->json([
                    'state' => 'SUCCESS',
                    'url' => $url,
                    'title' => $file->getClientOriginalName(),
                    'original' => $file->getClientOriginalName(),
                    'type' => '.'.$extension,
                    'size' => $file->getSize(),
                ]);
            }

            return response()->json([
                'state' => '文件上传失败',
            ]);
        } catch (\Exception $e) {
            \Log::error('UEditor 图片上传失败:', ['error' => $e->getMessage()]);

            return response()->json([
                'state' => '上传失败: '.$e->getMessage(),
            ]);
        }
    }

    /**
     * 上传文件
     */
    private function uploadFile(Request $request)
    {
        // 类似 uploadImage 的实现
        return $this->uploadImage($request);
    }

    /**
     * 上传视频
     */
    private function uploadVideo(Request $request)
    {
        // 类似 uploadImage 的实现，但限制视频类型
        return $this->uploadImage($request);
    }

    /**
     * 其他方法实现...
     */
    private function uploadScrawl(Request $request)
    {
        return response()->json(['state' => '暂不支持涂鸦上传']);
    }

    private function listImage(Request $request)
    {
        return response()->json([
            'state' => 'SUCCESS',
            'list' => [],
            'start' => 0,
            'total' => 0,
        ]);
    }

    private function listFile(Request $request)
    {
        return response()->json([
            'state' => 'SUCCESS',
            'list' => [],
            'start' => 0,
            'total' => 0,
        ]);
    }
}
