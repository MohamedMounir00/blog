<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\role;
use App\Satting;

class RegisterController extends Controller
{
    


		public function create(){
                $stop_regster= Satting::where('name','stop_regster')->value('value');

			return view('content.register',compact('stop_regster'));



		}



    public function store(Request $request){

    	 $user= new User;
    	 $user->name = $request->name;
    	 $user->password =bcrypt($request->password);
    	 $user->email = $request->email;

    	 $user->save();

         // add role 
         $user->roles()->attach(role::where('name','user')->first());
    	 auth()->login($user);
    	 return redirect('/posts');



		}
		




    }
