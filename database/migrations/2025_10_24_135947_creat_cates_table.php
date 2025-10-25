<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('cates', function (Blueprint $table) {
            $table->id('cate_id');
            $table->string('name');
            $table->string('slug')->nullable();
            $table->string('level')->default('1');
            $table->text('description')->nullable();
            $table->unsignedBigInteger('parent_id')->default(0);
            $table->integer('order')->default(1);
            $table->boolean('is_active')->default(true);
            $table->string('image')->nullable();
            $table->string('meta_title')->nullable();
            $table->text('meta_description')->nullable();
            $table->timestamps();

            // 索引
            $table->index('parent_id');
            $table->index('order');
            $table->index('is_active');
        });
    }

    public function down()
    {
        Schema::dropIfExists('cates');
    }
};
