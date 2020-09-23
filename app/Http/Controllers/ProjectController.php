<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use App\Project;
use App\User;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('project');
    }

    public function showAllProjects(){
        $projects = User::find(Auth::user()->id)->project()->paginate(2);
        return response()->json($projects);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //return view('create-project');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'budget' => 'required',
            'desc' => 'required|min:20'
        ]);      
        
        $p = new Project();
        $p->name=$request->input('name');
        $p->budget=$request->input('budget');
        $p->description=$request->input('desc');
        $p->user_id= Auth::user()->id;
        $p->save();

        return response()->json([
            'msg' => 'Successfully added project'
        ]);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $project = Project::findOrFail($id);
        return response()->json($project);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('edit-project');
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

        $request->validate([
            'name' => 'required',
            'budget' => 'required',
            'desc' => 'required|min:20'
        ]);
        
        $p = Project::find($id);
        $p->name = $request->input('name');
        $p->budget = $request->input('budget');
        $p->description = $request->input('desc');
        $p->save();

        return response()->json(['msg'=>'Project updated successfully']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $p = Project::findOrFail($id);
        $p->delete();
        return response()->json(['msg'=>'Succesfully deleted project']);
    }
}
