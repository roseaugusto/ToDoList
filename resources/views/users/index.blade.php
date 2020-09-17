<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>To do list</title>

        <link rel="stylesheet" type="text/css" href= "{{ asset('css/bootstrap.min.css') }}" >
        <link rel="stylesheet" type="text/css" href= "{{ asset('css/app.css') }}" >
    </head>
    <body class="bg-light">
        @yield('contents')
    </body>
</html>
