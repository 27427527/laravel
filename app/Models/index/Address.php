<?php

namespace App\Models\index;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Address extends Model
{
    protected $fillable = [
        'name',
        'phone',
        'detail',
        'province',
        'city',
        'district',
        'id',

    ];

    protected $casts = [

    ];

    // 关联的表名
    public $table = 'address';

    // 主键名
    public $primaryKey = 'address_id';

    public $timestamps = false;

    /**
     * 所属人
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'id');
    }
}
