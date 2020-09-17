<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\MyUsers;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public $storepath = "public/user_images/";
    public function index()
    {
        //
        $users = MyUsers::orderBy('created_at')->paginate(4);
        return view('users.list', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('users.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'profile_pic' => 'image|nullable|max:1999'
        ]);

        $storepath = "public/user_images/";
        if($request->hasFile('profile_pic')){
            $file = $request->file('profile_pic')->getClientOriginalName();
            $filename = pathinfo($file, PATHINFO_FILENAME);
            //$fileext = pathinfo($file, PATHINFO_FILEEXTENSION);
            //$fileext = $request->file('profile_pic')->getClientOrginalExtension();
            $filetostore = time().$file;
            $path = $request->file('profile_pic')->storeAs($storepath, $filetostore);
        }
        else{
            $filetostore = $storepath."default_image.jpg";
        }

        $user = new MyUsers;
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = $request->input('password');
        $user->mobileno = $request->input('mobileno');
        $user->address = $request->input('address');
        $user->profilepic = $filetostore;
        $user-> save();

        return redirect('/users')->with("success", "Successfully added a new user");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //

        $user = MyUsers::findOrFail($id);
        return view('users.show', compact('user'))->with('projects', $user->Project);
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
        $user = MyUsers::findOrFail($id);
        return view('users.edit', compact('user'));
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
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required',
            'profile_pic' => 'image|nullable|max:1999'
        ]);
        
        $storepath = "public/user_images/";
        if($request->hasFile('profile_pic')){
            $file = $request->file('profile_pic')->getClientOriginalName();
            $filename = pathinfo($file, PATHINFO_FILENAME);
            //$fileext = pathinfo($file, PATHINFO_FILEEXTENSION);
            //$fileext = $request->file('profile_pic')->getClientOrginalExtension();
            $filetostore = time().$file;
            $path = $request->file('profile_pic')->storeAs($storepath, $filetostore);
        }
        
        $user = MyUsers::find($id);
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->mobileno = $request->input('mobileno');
        $user->address = $request->input('address');
        if($request->hasFile('profile_pic'))
            $user->profilepic = $filetostore;
        $user-> save();

        return redirect('/users')->with("success", "Successfully updated user");

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
        $user = MyUsers::findOrFail($id);
        $user->delete();
        return redirect('/users')->with("success", "Successfully deleted user");
    }
}
