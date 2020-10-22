<?php

namespace App;

use App\User;
use Illuminate\Database\Eloquent\Model;

class UserGeolocation extends Model
{
	protected $guarded = [];
	
    public function user()
    {
        return $this->hasOne(User::class);
    }
}
