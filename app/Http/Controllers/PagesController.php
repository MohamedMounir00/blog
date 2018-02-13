<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Posts;
use App\Coment;
use App\Cat;
use App\User;
use App\role;
use App\Like;
use DB;
use App\Satting;



class PagesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $posts = Posts::with('cat')->with('like')->get();
        //dd($posts);
        return view('content.posts',compact('posts'));
            }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
//Posts::create($request->all());

    $this->validate($request, [
'title'=>'required',
'body'=>'required',
'url'=>'image|mimes:jpg,jpeg,gif,png|max:2048'
]);
        $img_name = time().'.'.$request->url->getClientOriginalExtension();
        $post = new Posts();
        $post->title=  $request->title;
        $post->body=  $request->body;
        $post->url=  $img_name;
        $post->cat_id=1;

        $post->save();
        $request->url->move(public_path('upload'),$img_name);

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
            }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function post($id)
    {  
                $stop_comment= Satting::where('name','stop_comment')->value('value');

         $posts = Posts::with('Coments')->find($id);
      return view('content.post',compact('posts','stop_comment'));

    }

    public function cat($id)
    {  
         $cat = Cat::findOrFail($id);
         $posts = Posts::where('cat_id',$cat->id)->with('cat')->get();
      return view('content.cat',compact('posts'));

    }

      public function admin()
    {  
        $stop_comment= Satting::where('name','stop_comment')->value('value');
        $stop_regster= Satting::where('name','stop_regster')->value('value');

        $users= User::all();
  
      return view('content.admin',compact('users','stop_comment','stop_regster'));

    }
    public function Addrole(Request $request){

        $user= User::where('email',$request['email'])->first();
        $user->roles()->detach();

        if ($request['user_role']) {
            $user->roles()->attach(role::where('name','user')->first());
        }
         if ($request['editor_role']) {
            $user->roles()->attach(role::where('name','Editor')->first());
        } 
        if ($request['admin_role']) {
            $user->roles()->attach(role::where('name','Admin')->first());
        }
                return redirect()->back();

    }     

    public function like(Request $request)
    {
        $like_s = $request->like_s;
        $post_id = $request->post_id;
        $chang_like = 0;
         $like =DB::table('likes')
         ->where('posts_id',$post_id)
         ->where('user_id',auth()->user()->id)
         ->first();

         if (!$like)
          {
             $new_like = new Like;
             $new_like->posts_id = $post_id;
             $new_like->user_id = auth()->user()->id;
             $new_like->like=1;
             $new_like->save();
             $is_like = 1;
         }
         elseif ($like->like == 1)
          {
             DB::table('likes')
             ->where('posts_id',$post_id)
             ->where('user_id',auth()
             ->user()->id)->delete();
              $is_like = 0;

         }
            elseif ($like->like == 0)
          {
             DB::table('likes')
             ->where('posts_id',$post_id)
             ->where('user_id',auth()->user()->id)
             ->update(['like'=>1]);
                  $is_like = 1;
                                $chang_like = 1;

         }
                      $res = 
                      [
                        'is_like'=>$is_like,
                        'chang_like'=>$chang_like,

                     ];

         return response()->json($res ,200);
    }
     public function dislike(Request $request)
    {
        $like_s = $request->like_s;
        $post_id = $request->post_id;
        $chang_dislike =0;
         $dislike =DB::table('likes')
         ->where('posts_id',$post_id)
         ->where('user_id',auth()->user()->id)
         ->first();

         if (!$dislike)
          {
             $new_like = new Like;
             $new_like->posts_id = $post_id;
             $new_like->user_id = auth()->user()->id;
             $new_like->like=0;
             $new_like->save();
             $disis_like = 1;
         }
         elseif ($dislike->like == 0)
          {
             DB::table('likes')
             ->where('posts_id',$post_id)
             ->where('user_id',auth()
             ->user()->id)->delete();
              $disis_like = 0;

         }
            elseif ($dislike->like == 1)
          {
             DB::table('likes')
             ->where('posts_id',$post_id)
             ->where('user_id',auth()->user()->id)
             ->update(['like'=>0]);
                  $disis_like = 1;
                  $chang_dislike= 1;
         }
                      $res = [
                        'disis_like'=>$disis_like,
                        'chang_dislike'=>$chang_dislike, 

                        ];

         return response()->json($res ,200);
    }

    public function statistics(){
        $users= User::count();
        $posts=Posts::count();
        $coment= Coment::count();
        return view('content.statistics',compact('users','posts','coment'));
    }


    public function sttating(Request $request){
        if ($request->stop_comment) {
            Satting::where('name','stop_comment')->update(['value'=>1]);
        }
        else{
              Satting::where('name','stop_comment')->update(['value'=>0]);

        }
          if ($request->stop_regster) {
            Satting::where('name','stop_regster')->update(['value'=>1]);
        }
        else{
              Satting::where('name','stop_regster')->update(['value'=>0]);

        }
        return redirect()->back();
    }
    
}
