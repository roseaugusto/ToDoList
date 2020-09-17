@extends('users.index')

@section('contents')

    <div class="container-fluid p-4">
        <h2>Users</h2>
        
        <div>
            <a href="/users/create"><button class="btn btn-primary float-right m-2">ADD USER</button></a>
            <form class="float-right m-2">
                <input type="text" placeholder="search" class="form-control">
            </form>
        </div>
        <br/>

        @if(session('success') !=null)
        <br> <br>
            <div class="alert alert-dismissible alert-success">
                <span class="close"></span>
                {{session('success') ?? ''}}
            </div>
        @endif

        @if(count($users) > 0)
            <div class="flex-container mt-5">
                @foreach($users as $u)
                    <div class="card">
                        <div class="card-header"> 
                            <center>   
                                <img src="storage/user_images/{{ !($u->profilepic) ? 'default.jpg':$u->profilepic}}" class="card-img-top user_img" alt="card-image">
                            </center>
                        </div>
                        <div class="card-body bg-white">
                            <h4 class="card-title text-center">{{ $u->name }}</h4>
                            <p>
                                {{ $u->birthday }}
                                <br>
                                {{ $u->mobileno }}
                                <br/>
                                {{ $u->email }}
                            </p>

                            <div class="row text-center">
                                <div class="col-md-4 col-xs-12">
                                    <a href="users/{{$u->id}}/edit" class="btn btn-success btn-sm">EDIT</a>
                                </div>
                                <div class="col-md-4 col-xs-12">
                                    <a href="users/{{$u->id}}" class="btn btn-primary btn-sm">ASSIGN</a>
                                </div>
                                <div class="col-md-4 col-xs-12">
                                    <form method="POST" action="users/{{$u->id}}">
                                        @method('DELETE')
                                        @csrf
                                        <button type="submit" class="btn btn-danger btn-sm">DELETE</button>
                                    </form>
                                </div>
                            </div>  
                        </div>
                    </div>
                @endforeach
                
            </div>
            <div style="margin:10px;">{{$users->links()}}</div>
        @endif
    </div>

@endsection