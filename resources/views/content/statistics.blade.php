@extends('master')


@section('contend')

<div class="col-md-8">

  <h1 class="page-header">
   MY Blog
   <small>Statistics</small>
 </h1>
 <div>
  <table class="table table-hover">
    <tr>
      <th>Users</th>
      <td>{{$users}}</td> 
    </tr>
    <tr>
      <th>Posts</th>
      <td>{{$posts}}</td>
    </tr>
    <tr>
      <th>Comments</th>
      <td>{{$coment}}</td>
    </tr>
  </table>
</div>

</div>
@stop