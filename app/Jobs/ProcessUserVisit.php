<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ProcessUserVisit implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $post_id;

    public $tries = 3; // 重试次数

    public $timeout = 60; // 超时时间

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($post_id)
    {
        $this->post_id = $post_id;
        // $this->onQueue('visits'); // 指定队列
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        try {
            DB::transaction(function () {
                $this->updateStats();
            });
        } catch (\Exception $e) {
            Log::error('处理用户访问记录失败: '.$e->getMessage());
            throw $e; // 让队列重试
        }
    }

    /**
     * 更新统计信息
     */
    private function updateStats()
    {
        // 更新用户总访问数（如果用户已登录）
        DB::table('posts')
               ->where('post_id', $this->post_id)
               ->increment('view_count');
    }
}
