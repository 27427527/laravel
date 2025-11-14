<?php

namespace App\Casts;

use Illuminate\Contracts\Database\Eloquent\CastsAttributes;

class OrderedJson implements CastsAttributes
{
    public function get($model, $key, $value, $attributes)
    {
        if (is_null($value)) {
            return [];
        }

        $data = json_decode($value, true);

        // 如果是关联数组，保持原顺序返回
        if ($this->isAssociativeArray($data)) {
            return $data;
        }

        return $data;
    }

    public function set($model, $key, $value, $attributes)
    {
        if (is_null($value)) {
            return null;
        }

        // 确保编码时保持顺序
        return json_encode($value, JSON_FORCE_OBJECT);
    }

    private function isAssociativeArray(array $arr)
    {
        if ([] === $arr) {
            return false;
        }

        return array_keys($arr) !== range(0, count($arr) - 1);
    }
}
