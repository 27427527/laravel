<?php

namespace Database\Seeders;

use App\Models\admin\Cate;
use Illuminate\Database\Seeder;

class CateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $category = Cate::create([
            'name' => '商品分类',
        ]);
    }
}
