<?php

namespace App\Models;

use App\Models\admin\Role;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use HasFactory;
    use Notifiable;

    // 关联的表名
    public $table = 'admins';

    // 主键名
    public $primaryKey = 'id';

    // 是否维护时间戳
    public $timestamps = true;

    // protected $dateFormat = 'U'; // Unix 时间戳

    // 允许批量赋值的字段
    protected $fillable = [
        'username', 'password', 'real_name', 'phone', 'avatar', 'status', 'permissions',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * 获取用户的所有权限
     */
    public function getAllPermissions()
    {
        return $this->roles->flatMap(function ($role) {
            return $role->permissions->pluck('slug');
        })->unique()->values();
    }

    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_admin', 'id', 'role_id');
    }

    /**
     * 检查用户是否有特定角色
     */
    public function hasRole($role)
    {
        return $this->roles()->where('slug', $role)->exists();
    }

    /**
     * 检查用户是否有特定权限
     */
    public function hasPermission($permission)
    {
        return $this->roles()->whereHas('permissions', function ($query) use ($permission) {
            $query->where('slug', $permission);
        })->exists();
    }

    /**
     * 检查用户是否有任意一个权限
     */
    public function hasAnyPermission($permissions)
    {
        if (is_string($permissions)) {
            $permissions = [$permissions];
        }

        return $this->roles()->whereHas('permissions', function ($query) use ($permissions) {
            $query->whereIn('slug', $permissions);
        })->exists();
    }

    /**
     * 检查用户是否有所有权限
     */
    public function hasAllPermissions($permissions)
    {
        if (is_string($permissions)) {
            $permissions = [$permissions];
        }

        $userPermissionCount = $this->roles()
            ->whereHas('permissions', function ($query) use ($permissions) {
                $query->whereIn('slug', $permissions);
            })
            ->count();

        return count($permissions) === $userPermissionCount;
    }

    /**
     * 为用户分配角色
     */
    public function assignRole($role)
    {
        if (is_string($role)) {
            $role = Role::where('slug', $role)->firstOrFail();
        }

        $this->roles()->syncWithoutDetaching([$role->id]);
    }

    /**
     * 移除用户的角色
     */
    public function removeRole($role)
    {
        if (is_string($role)) {
            $role = Role::where('slug', $role)->firstOrFail();
        }

        $this->roles()->detach($role->id);
    }
}
