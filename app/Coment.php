<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coment extends Model
{
     public function post(){


        	return $this->belongsTo('App\Posts');
        }

    }
