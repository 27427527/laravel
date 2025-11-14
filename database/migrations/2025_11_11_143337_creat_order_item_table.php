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
        Schema::create('order_item', function (Blueprint $table) {
            $table->id('order_item_id');
            $table->unsignedBigInteger('order_id')->comment('订单ID');
            $table->unsignedBigInteger('good_id')->comment('商品ID');
            $table->string('good_name')->comment('商品名称');
            $table->string('category')->nullable()->comment('商品属性');
            $table->string('image')->comment('商品图片');
            $table->decimal('good_price', 10, 2)->comment('商品单价');
            $table->integer('quantity')->comment('购买数量');
            $table->decimal('total_price', 10, 2)->comment('商品总价');
            $table->timestamps();
            $table->index('order_id');
            $table->index('good_id');
        });
        //
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
