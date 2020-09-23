<?php

Auth::routes();

Route::get('/', function () {
    return view('welcome');
});

Route::get('/projects/{any?}', function() {
    return view('content');
})->where('any', '([A-z\d\-\/_.]+)?');


Route::resource('/project', 'ProjectController');
Route::get('/showAllProjects', 'ProjectController@showAllProjects');
