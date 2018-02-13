<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SessionController extends Controller
{
    

		public function create(){

			return view('content.login');



		}


		public function store(){
         $user = request(['email','password']);
       //  dd($user);

			if(!auth()->attempt(request(['email','password']))){
			return back()->withErrors([

				'message' => ' email or password  is not correct'
			]);


			}


			return redirect('/posts');



		}

		public function logout()
		{
			auth()->logout();
			return redirect('/posts');
		}
}
