@extends('master')


@section('contend')

<div class="col-md-8">

  <h1 class="page-header">
   MY Blog
   <small>Secondary Text</small>
 </h1>

 @foreach($posts as $post)


 <!-- First Blog Post -->
 <h2>
  <a href="{{url('posts/'.$post->id)}}">{{$post->title}}</a>
</h2>
<p class="lead">
  by <a href="index.php">Start Bootstrap</a>
</p>
<p><span class="glyphicon glyphicon-time"></span>
 Posted on {{$post->created_at->toDayDateTimeString()}} <strong>Cat :</strong>{{$post->Cat->cat}}
</p>
<hr>
@if($post->url)

<img class="img-responsive" src="upload/{{$post->url}}" alt="">

@endif
<hr>
<p> {{$post->body}}</p>
<a class="btn btn-primary" href="#">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
@php
$like_count=0;
$dislike_count=0;
$like_status = "btn-secondry";
$dislike_status = "btn-secondry";

@endphp
@foreach ($post->like as $like)

@php 
if($like->like == 1)
{
  $like_count++;

}
if($like->like == 0)
{
  $dislike_count++;

}
if(Auth::check())
{


 if($like->like == 1 && $like->user_id == Auth::user()->id)
 {
  $like_status = "btn-success";

}
if($like->like == 0 && $like->user_id == Auth::user()->id)
{
  $dislike_status = "btn-danger";

}

}


@endphp
@endforeach


<button  type="button" data-postid="{{$post->id}}_l" data-like="{{$like_status}}" class="like btn {{$like_status}}">Like
  <span class="glyphicon glyphicon-thumbs-up"></span>
  <b><span class="like_count">
    {{$like_count}}
  </span>
</b>
</button>
<button  type="button"  data-postid="{{$post->id}}_d" data-like="{{$dislike_status}}" class="dislike btn {{$dislike_status}}">DisLike
  <span class="glyphicon glyphicon-thumbs-down"></span>
  <b><span class="dislike_count">
  {{$dislike_count}}
</span></b>


</button>


<hr>

@endforeach


@if(Auth::check())
@if(Auth::user()->hasRole('Admin'))
<form method="post" action="posts/store" enctype="multipart/form-data">
  {{ csrf_field() }}
  <div class="form-group">
   <label > title</label>
   <input type="Text" name="title" class="form-control">
 </div>	
 <div class="form-group">
   <label > title</label>
   <textarea name="body" class="form-control"></textarea> 
 </div>	
 <div class="form-group">
   <label > title</label>
   <input type="file" name="url" class="form-control">
 </div>	
 <div class="form-group">
  <button  class="btn btn-primary"> Add Post</button>
</div>


<div>
	@foreach($errors->all() as $error)

  {{$error}} <p>

   @endforeach
 </div>

</form>

@endif
@endif
                <!-- Pager 
                <ul class="pager">
                    <li class="previous">
                        <a href="#">&larr; Older</a>
                    </li>
                    <li class="next">
                        <a href="#">Newer &rarr;</a>
                    </li>
                </ul>
              -->


            </div>
            @stop