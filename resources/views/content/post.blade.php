@extends('master')


@section('contend')

            <div class="col-md-8">

                <h1 class="page-header">
                    MY Blog
                    <small>Secondary Text</small>
                </h1>



                <!-- First Blog Post -->
                <h2>
                    <a href="">{{$posts->title}}</a>
                </h2>
                <p class="lead">
                    by <a href="index.php">Start Bootstrap</a>
                </p>
                                Posted on {{$posts->created_at->toDayDateTimeString()}}
                <img class="img-responsive" src="upload/{{$posts->url}}" alt="">
                <hr>
                  <p> {{$posts->body}}</p>



                <hr>
                <br>

                @foreach($posts->Coments as $comment)
                <div class="comments" >

                <p>
                    {{$comment->body}}
                </p>
                 </div>
                <br>

                @endforeach
                <br>


@if($stop_comment== 1)

<h2> The Comment Not Aviable Now !! </h2>
@else
<form method="post" action="/posts/{{$posts->id}}/store" >
{{ csrf_field() }}
 
<div class="form-group">
    <label > Writ Some Thing ...... </label>
    <textarea name="body" class="form-control"></textarea> 
</div>  
 
    <div class="form-group">
        <button  class="btn btn-primary"> Add Comment</button>
</div>




</form>
      @endif

                <!-- Pager -->
                <ul class="pager">
                    <li class="previous">
                        <a href="#">&larr; Older</a>
                    </li>
                    <li class="next">
                        <a href="#">Newer &rarr;</a>
                    </li>
                </ul>



</div>
@stop