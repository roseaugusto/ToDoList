@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header"><h3>Sweep Track - A Todo List Web Application</h3></div>
                <div class="card-body">
                    <h3>Overview</h3>
                    <p>
                        A todo list App where users can create their own projects. Each project can have one or 
                        muptiple task. The author of the project can assign other users to a task. The assignee
                        can add text and can upload files in the comment section of each task. Also, the assignee
                        can modify the status and hours spent in the task field.
                    </p>
                    <br/>
                    <h3>Technologies Used</h3>
                    <p>
                        -Laravel 5.7<br/>
                        -Vuejs 2.0<br/>
                            <b class="ml-3">Libraries Used</b>
                            <ul>
                                <li>Vue-Router</li>
                                <li>Vee-Validate</li>
                                <li>Axios</li>
                                <li>laravel-vue-pagination</li>
                            </ul>
                    </p>
                    <br/>
                    <h3>Links</h3>
                    <p>
                        Github Repo: <a href="https://github.com/roseaugusto/ToDoList.git">https://github.com/roseaugusto/ToDoList.git</a>
                        <br>
                        Online Demo: -
                    </p>
                    <br/>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
