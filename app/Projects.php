<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Projects extends Model
{
    //

    public function User(){
        return $this->belongsTo('App\MyUsers');
    }
}
