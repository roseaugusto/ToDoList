<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MyUsers extends Model
{
    //
    protected $table = "users";

    public function Project(){
        return $this->hasMany('App\Projects');
    }
}
