<?php

namespace Database\Seeders;

use App\Models\admin\Permission;
use App\Models\admin\Role;
use Illuminate\Database\Seeder;

class RBACSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // 创建权限
        $permissions = [
            ['name' => '查看用户', 'slug' => 'user.view', 'module' => '用户管理'],
            ['name' => '创建用户', 'slug' => 'user.create', 'module' => '用户管理'],
            ['name' => '编辑用户', 'slug' => 'user.edit', 'module' => '用户管理'],
            ['name' => '删除用户', 'slug' => 'user.delete', 'module' => '用户管理'],
            ['name' => '查看角色', 'slug' => 'role.view', 'module' => '角色管理'],
            ['name' => '创建角色', 'slug' => 'role.create', 'module' => '角色管理'],
            ['name' => '编辑角色', 'slug' => 'role.edit', 'module' => '角色管理'],
            ['name' => '删除角色', 'slug' => 'role.delete', 'module' => '角色管理'],
        ];

        foreach ($permissions as $permission) {
            Permission::create($permission);
        }

        // 创建角色
        $adminRole = Role::create([
            'name' => '超级管理员',
            'slug' => 'admin',
            'description' => '拥有系统所有权限',
        ]);

        $userRole = Role::create([
            'name' => '普通用户',
            'slug' => 'user',
            'description' => '普通用户权限',
        ]);
    }
}
