<?php

namespace App\Models\index;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AttrVal extends Model
{
    use HasFactory;

    // 关联的表名
    public $table = 'attr_val';

    // 主键名
    public $primaryKey = 'attr_val_id';

    // 是否维护时间戳
    public $timestamps = false;
    // protected $dateFormat = 'U'; // Unix 时间戳

    // 允许批量赋值的字段

    protected $fillable = ['attr_val_id', 'name',  'attr_name_id'];

    public function attrnames(): BelongsTo
    {
        return $this->belongsTo(AttrName::class, 'attr_name_id');
    }
}
