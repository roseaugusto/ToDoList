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

Route::get('/getIP', function(){
	$ipinfo = geoip()->getLocation('49.147.192.252')->toArray();
	return $ipinfo;
});

Route::get('/cleareverything', function () {
    $clearcache = Artisan::call('cache:clear');
    echo "Cache cleared<br>";

    $clearview = Artisan::call('view:clear');
    echo "View cleared<br>";

    $clearconfig = Artisan::call('config:cache');
    echo "Config cleared<br>";
});
