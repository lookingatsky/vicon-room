<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帮助中心</title>
{{ stylesheet_link('new/bootstrap.min.css') }}
{{ javascript_include('new/jquery.min.js') }}
{{ javascript_include('new/bootstrap.min.js') }}

<style type="text/css">
    /* Custom Styles */
    ul.nav-tabs{
        width: 140px;
        margin-top: 20px;
        border-radius: 4px;
        /*border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);*/
    }
    ul.nav-tabs li{
        margin: 0;
        /*border-top: 1px solid #ddd;*/
    }
    ul.nav-tabs li:first-child{
        border-top: none;
    }
    ul.nav-tabs li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
	ul.nav-tabs li a{
		color:#5bb75b;
	
	}
    ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color:#51a351;
		font-weight:bold;
		background-color:#fff;
    }
    ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
</style>
<script type="text/javascript">
$(document).ready(function(){
    $("#myNav").affix({
        offset: { 
            top: 145 
     	}
    });
});
</script>
</head>
<body data-spy="scroll" data-target="#myScrollspy">

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="/index">中合万邦</a>
            <div class="nav-collapse">
				<ul class="nav pull-left">
				<li><a href="/index/index">首 页</a></li>
<!-- 				<li><a href="/invoices/index">系 统</a></li> -->
				<li class="active"><a href="/help/index">帮助中心</a></li>
				</ul>
				<ul class="nav pull-right">
				<!-- <li><a href="/invoices/profile">欢迎您！ 钟某某</a></li> -->
				<li><a href="/session/end">退 出</a></li>
				</ul>
			</div>        
		</div>
    </div>
</div>

<div class="container">
	<div class="jumbotron">
        <h1>帮助中心</h1>
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" id="myNav">
                <li class="active"><a href="#section-1">常见问题1</a></li>
                <li><a href="#section-2">常见问题2</a></li>
                <li><a href="#section-3">常见问题3</a></li>
                <li><a href="#section-4">常见问题4</a></li>
                <li><a href="#section-5">常见问题5</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
            <h2 id="section-1">第一部分</h2>
			<p>这是第一部分</p>
            <hr>
            <h2 id="section-2">第二部分</h2>
			<p>这是第二部分</p>
            <hr>
            <h2 id="section-3">第三部分</h2>
            <p>这是第三部分</p>
			<hr>
            <h2 id="section-4">第四部分</h2>
			<p>这是第四部分</p>
			<hr>
            <h2 id="section-5">第五部分</h2>
			<p>这是第五部分</p>
		</div>
    </div>
	<hr>
    <footer>
        <p>&copy; Company 2012</p>
    </footer>	
</div>
</body>
</html>	