<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Auth;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function show()
    {
        return response()->json(Auth::user());
    }

    public function updateUser(Request $request){
        $user = Auth::user();
        $user->name = $request->input('name');
        $user->address = $request->input('address');
        $user->mobileno = $request->input('mobileno');
        $user->birthday = $request->input('birthday');

        if($request->input('filename')!='0')
            $user->profilepic = $request->input('filename');

        $user->save();

        return response()->json(['msg'=>'Successfully updated user.']);
    }

    public function updateUserImage(Request $request){
        if($request->file('file')){
            $fileName = time().'-'.$request->file('file')->getClientOriginalName();
            $request->file('file')->move(public_path('storage/user_images'), $fileName);
            return response()->json(['filename' => $fileName]);
        }
        else{
            return response()->json(['msg' => $request->file('file')]);
        }
    }
}
