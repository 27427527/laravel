<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('attr_price', function (Blueprint $table) {
            $table->id('attr_price_id');
            $table->decimal('price', 10, 2); // 价格
            $table->foreignId('good_id');
            $table->json('attr')->nullable(); // 规格属性
            $table->integer('stock')->default(0); // 库存
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
};
