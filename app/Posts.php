<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Posts extends Model
{
        protected $fillable = ['title' ,'body','url'];


        public function Coments(){


        	return $this->hasMany('App\Coment');
        }
         public function cat(){


        	return $this->belongsTo('App\cat');
        }

        public function like(){


        	return $this->hasMany('App\Like');
        }
}

