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
        Schema::create('goods', function (Blueprint $table) {
            $table->id('good_id');
            $table->string('name'); // 商品名称
            $table->text('description')->nullable(); // 商品描述
            $table->decimal('price', 10, 2); // 价格
            $table->decimal('original_price', 10, 2)->nullable(); // 原价
            $table->integer('stock')->default(0); // 库存
            $table->string('sku')->unique()->nullable(); // 商品编号
            $table->string('image')->nullable(); // 主图
            $table->json('images')->nullable(); // 多图
            $table->boolean('is_featured')->default(false); // 是否推荐
            $table->boolean('is_active')->default(true); // 是否上架
            $table->integer('sort_order')->default(0); // 排序
            $table->text('specifications')->nullable(); // 规格参数
            $table->foreignId('brand_id')->nullable(); // 品牌
            $table->timestamps();
            $table->softDeletes(); // 软删除

            // 索引
            $table->index(['is_active', 'sort_order']);
            $table->index('brand_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('goods');
    }
};
