<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        {{ stylesheet_link('bootstrap/css/bootstrap.css') }}
        {{ stylesheet_link('bootstrap/css/bootstrap-responsive.css') }}
        {{ stylesheet_link('css/style.css') }}
		{{ javascript_include('js/jquery.min.js') }}
		{{ javascript_include('bootstrap/js/bootstrap.js') }}
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="中合万邦">
        <meta name="author" content="zhwbchina">
    </head>
    <body>
        {{ content() }}	
        {{ javascript_include('js/utils.js') }}
    </body>
</html>