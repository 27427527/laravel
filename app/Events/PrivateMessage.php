<?php

namespace App\Events;

use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class PrivateMessage implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $fromUser;

    public $toUserId;

    public $message;

    public $timestamp;

    public function __construct($fromUser, $toUserId, $message)
    {
        $this->fromUser = $fromUser;
        $this->toUserId = $toUserId;
        $this->message = $message;
        $this->timestamp = now()->toDateTimeString();
    }

    public function broadcastOn()
    {
        return new PrivateChannel('user.'.$this->toUserId);
    }

    public function broadcastAs()
    {
        return 'PrivateMessage';
    }
}
