<?php

Auth::routes();

Route::get('/', function () {
    return view('welcome');
});

Route::get('/profile/{any?}', function() {
    return view('content');
})->where('any', '([A-z\d\-\/_.]+)?');

Route::get('/projects/{any?}', function() {
    return view('content');
})->where('any', '([A-z\d\-\/_.]+)?');

Route::get('/showUserData', 'UserController@show');
Route::post('/updateUser', 'UserController@updateUser');
Route::post('/updateUserImage', 'UserController@updateUserImage');

Route::resource('/project', 'ProjectController');
Route::get('/showAllProjects', 'ProjectController@showAllProjects');
