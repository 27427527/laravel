<?php

namespace App\Models\admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Permission extends Model
{
    use HasFactory;
    use Notifiable;

    // 关联的表名
    public $table = 'permissions';

    // 主键名
    public $primaryKey = 'permission_id';

    // 是否维护时间戳
    public $timestamps = true;

    // protected $dateFormat = 'U'; // Unix 时间戳

    // 允许批量赋值的字段

    protected $fillable = ['name', 'slug', 'description', 'module'];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'permissions' => 'array',

    ];

    public function roles()
    {
        return $this->belongsToMany(Role::class, 'permission_role');
    }
}
