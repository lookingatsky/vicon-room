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
{{ stylesheet_link('css/calculator.css') }}
{{ javascript_include('js/calculator.js') }}
<script type="text/javascript">
$(function(){
	$("#counter").click(function(){
		$(this).animate({"right":"200px"},500);
	})
	$(".close_calculator").click(function(){
		$("#counter").animate({"right":"-350px"},500);
		//event.stopPropagation();
		return false;
	})
})
</script>
<div id="counter">
	<div style="text-align:center;clear:both;">
<!-- <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script> -->
</div>
	
	<div id="counter_content">
		<i class="close_calculator icon-remove" style="position:absolute;top:-10px;right:-10px;"></i>
		<h3><input id="input1" type="text" value="0" /></h3>
		<ul class="calculator">
			<li>7</li>
			<li>8</li>
			<li>9</li>
			<li>+</li>
			<li>4</li>
			<li>5</li>
			<li>6</li>
			<li>-</li>
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>×</li>
			<li>0</li>
			<li>C</li>
			<li>=</li>
			<li>÷</li>
		</ul>
	</div>
	<div id="counter_bg"></div>
</div>				
    </body>
</html>