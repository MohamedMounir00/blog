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

                <img class="img-responsive" src="../upload/{{$post->url}}" alt="">
                <hr>
                  <p> {{$post->body}}</p>
                <a class="btn btn-primary" href="#">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>

                <hr>

@endforeach



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