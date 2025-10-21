<?php

namespace App\Helpers;

class ResponseHelper
{
    public static function success($data = null, $message = '操作成功', $code = 200)
    {
        return response()->json([
            'success' => true,
            'message' => $message,
            'data' => $data,
        ], $code);
    }

    public static function error($message = '操作失败', $errors = null, $code = 422)
    {
        return response()->json([
            'success' => false,
            'message' => $message,
            'errors' => $errors,
        ], $code);
    }

    public static function validationError($validator)
    {
        return self::error('表单验证失败', $validator->errors(), 422);
    }
}
