<?php

namespace App\Models\index;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class AttrName extends Model
{
    use HasFactory;

    // 关联的表名
    public $table = 'attr_name';

    // 主键名
    public $primaryKey = 'attr_name_id';

    // 是否维护时间戳
    public $timestamps = false;
    // protected $dateFormat = 'U'; // Unix 时间戳

    // 允许批量赋值的字段

    protected $fillable = ['attr_name_id', 'name',  'good_id'];

    public function goods(): BelongsTo
    {
        return $this->belongsTo(Good::class, 'good_id');
    }

    public function attr_vals(): HasMany
    {
        return $this->hasMany(AttrVal::class, 'attr_name_id');
    }
}
