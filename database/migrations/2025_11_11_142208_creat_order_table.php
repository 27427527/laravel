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
        Schema::create('orders', function (Blueprint $table) {
            $table->id('order_id');
            $table->string('order_no')->unique()->comment('订单号');
            $table->unsignedBigInteger('id')->comment('用户ID');
            $table->decimal('total_amount', 10, 2)->comment('订单总金额');
            $table->decimal('pay_amount', 10, 2)->comment('实际支付金额');
            $table->string('status')->default('pending')->comment('订单状态');
            $table->string('payment_method')->nullable()->comment('支付方式');
            $table->timestamp('paid_at')->nullable()->comment('支付时间');
            $table->text('remark')->nullable()->comment('订单备注');
            $table->string('name')->nullable()->comment('收件人姓名');
            $table->string('phone')->nullable()->comment('收件人电话');
            $table->string('express_no')->nullable()->comment('快递单号');
            $table->text('express_info')->nullable()->comment('快递信息');
            $table->string('express_name')->nullable()->comment('快递名称');
            $table->string('note')->nullable()->comment('后台备注');
            $table->json('address')->nullable()->comment('收货地址');
            $table->timestamps();
            $table->index('order_no');
            $table->index('id');
            $table->index('status');
        });
    }

        /**
         * Reverse the migrations.
         *
         * @return void
         */
        public function down()
        {
            Schema::dropIfExists('orders');
        }
};
