<?php

namespace App\Models\admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PermissionCate extends Model
{
    use HasFactory;

    // 关联的表名
    public $table = 'permission_cate';

    // 主键名
    public $primaryKey = 'permission_cate_id';

    // 是否维护时间戳
    public $timestamps = true;

    // protected $dateFormat = 'U'; // Unix 时间戳

    // 允许批量赋值的字段

    protected $fillable = ['cate_name'];

    protected $casts = [
        'permissions' => 'array',

    ];
}
