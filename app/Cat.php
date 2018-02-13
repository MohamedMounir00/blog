<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cat extends Model
{
    public function post(){


        	return $this->hasMany('App\Posts');
        }
    }
