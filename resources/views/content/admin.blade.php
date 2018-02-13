@extends('master')


@section('contend')

            <div class="col-md-8">

      <h1>  Admin controlle </h1>

<table class="table table-hover">
	
	<tr>
		<th>#</th>
		<th>Name</th>
		<th>Email</th>
		<th>User</th>
		<th>Editor</th>
		<th>Admin</th>

	</tr>
	@foreach($users as $user)
	<form method="post" action="/add-role">

{{ csrf_field() }}

<input type="hidden" name="email" value="{{$user->email}}">
	<tr>
		<td>{{$user->id}}</td>
		<td>{{$user->name}}</td>
		<td>{{$user->email}}</td>
		<td>
			<input type="checkbox" name="user_role" onChange="this.form.submit()" {{ $user->hasRole('user') ? 'checked' : '' }}>
		</td>
		<td>
			<input type="checkbox" name="editor_role" onChange="this.form.submit()" {{ $user->hasRole('Editor') ? 'checked' : '' }}>

		</td>
		<td>
		<input type="checkbox" name="admin_role" onChange="this.form.submit()"" {{ $user->hasRole('Admin') ? 'checked' : '' }}>

		</td>
	</tr>
	</form>
	@endforeach
</table>
<div>
	<h3>Sttating</h3>
		<form method="post" action="/sttating">

{{ csrf_field() }}
stop_comment::	<input type="checkbox" name="stop_comment" onChange="this.form.submit()"
			 {{ $stop_comment == 1 ? 'checked' : '' }}>

			 stop_regster::	<input type="checkbox" name="stop_regster" onChange="this.form.submit()"
			 {{ $stop_regster == 1 ? 'checked' : '' }}>


</form>
		

</div>

</div>
@stop