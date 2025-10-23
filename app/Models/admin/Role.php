<?php

namespace App\Models\admin;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    // 关联的表名
    public $table = 'roles';

    // 主键名
    public $primaryKey = 'role_id';

    // 是否维护时间戳
    public $timestamps = true;

    // protected $dateFormat = 'U'; // Unix 时间戳

    // 允许批量赋值的字段

    protected $fillable = ['name', 'slug', 'description'];

    public function users()
    {
        return $this->belongsToMany(User::class, 'role_user', 'role_id', 'id');
    }

    public function permissions()
    {
        return $this->belongsToMany(Permission::class, 'permission_role', 'role_id', 'permission_id');
    }

    /**
     * 检查角色是否有特定权限
     */
    public function hasPermission($permission)
    {
        return $this->permissions()->where('slug', $permission)->exists();
    }

    /**
     * 为角色分配权限
     */
    public function assignPermissions($permissions)
    {
        if (is_string($permissions)) {
            $permissions = Permission::where('slug', $permissions)->pluck('id');
        }

        if (is_array($permissions)) {
            $permissions = Permission::whereIn('slug', $permissions)->pluck('id');
        }

        $this->permissions()->syncWithoutDetaching($permissions);
    }

    /**
     * 移除角色的权限
     */
    public function removePermissions($permissions)
    {
        if (is_string($permissions)) {
            $permissions = Permission::where('slug', $permissions)->pluck('id');
        }

        if (is_array($permissions)) {
            $permissions = Permission::whereIn('slug', $permissions)->pluck('id');
        }

        $this->permissions()->detach($permissions);
    }
}
