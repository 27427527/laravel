<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('admins')->insert([
            'username' => 'max',
            'real_name' => '开发人员',
            'phone' => '16612341234',
            'created_at' => now(),
            'password' => Hash::make('666888'),
        ]);
    }
}
