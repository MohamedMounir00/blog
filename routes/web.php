<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/posts','PagesController@index');

Route::get('/posts/{id}','PagesController@post');

//Route::post('/posts/store','PagesController@store');

Route::post('/posts/{id}/store','CommentController@store');

Route::get('/cat/{id}','PagesController@cat');

//Auth
Route::get('/register','RegisterController@create');
Route::post('/register','RegisterController@store');

Route::get('/login','SessionController@create');
Route::post('/login','SessionController@store');

Route::get('/logout','SessionController@logout');

Route::get('/statistics','PagesController@statistics');


Route::group(['middleware'=>'roles','roles'=>['Admin']],function(){
Route::get('/admin','PagesController@admin');
Route::post('/add-role','PagesController@Addrole');
Route::post('/posts/store','PagesController@store');
Route::post('/sttating','PagesController@sttating');


});

Route::group(['middleware'=>'roles','roles'=>['User','Admin','Editor']],function(){

Route::post('/like','PagesController@like')->name('like');
Route::post('/dislike','PagesController@dislike')->name('dislike');


});


