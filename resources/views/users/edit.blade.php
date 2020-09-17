@extends('users.index')

@section('contents')

    <div class="container-fluid p-4">
        <h2>Edit User</h2>
        <br>
        <a href="/users"><button class="btn btn-primary">Back</button></a>
        <br><br>

        @if($errors->All()))
            <div class="alert alert-danger">
                <ul>
                    @foreach($errors as $e)
                        {{$e}}
                    @endforeach
                </ul>
            </div>
            <br>
        @endif

        <form method="POST" action="/users/{{$user->id}}" class="w-75" enctype="multipart/form-data">
            @method('PATCH')
            @csrf
            <div class="form-group">
                <label>Profile Picture</label>
                <input type="file" name="profile_pic" class="form-control">
            </div>
            <div class="form-group">
                <label>Name <b class="text-danger">*</b></label>
                <input type="text" value="{{$user->name}}" name="name" placeholder="Name" class="form-control {{$errors->has('name') ? 'is-invalid':''}}">
                <div class="invalid-feedback">Name is required.</div>
            </div>

            <div class="form-group">
                <label>Address</label>
                <input type="text" value="{{$user->address}}" name="address" placeholder="Address" class="form-control">
            </div>

            <div class="form-group">
                <label>Email <b class="text-danger">*</b></label>
                <input type="email" name="email" value="{{$user->email}}" placeholder="someone@example.com" class="form-control {{$errors->has('email') ? 'is-invalid':''}}">
                <div class="invalid-feedback"></div>
            </div>
            
            <div class="form-group row">
                <div class="col">
                    <label>Mobile No.</label>
                    <input type="text" value="{{$user->mobileno}}" name="mobileno" placeholder="09xxxxx" class="form-control">
                </div>
                <div class="col">
                    <label>Birthdate</label>
                    <input type="date" value="{{$user->birthday}}" name="bday" class="form-control">
                </div>
            </div>

            

            <div class="float-right">
                <button type="submit" class="btn btn-primary">SAVE CHANGES</button>
                <button type="reset" class="btn btn-danger">RESET</button>
            </div>
        </form>
    </div>

@endsection