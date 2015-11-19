
{{ content() }}
<div class="hero-unit" style="height:430px;background:url('../img/bootstrap/bg.jpg');background-size:100% auto;">
	
<style>
.hero-unit a{
	position:relative;
	top:350px;
	left:22px;
}
</style>
<?php 
	$auth = $this->session->get('auth');
	if(isset($auth)){
?>	<p>
	<?php if($auth['type'] == 'market'){ ?>
	<a href="/customer/index"><img src="../img/bootstrap/back.png" height="40" /></a>
	<?php }elseif($auth['type'] == 'editor'){ ?>
	<a href="/news/index"><img src="../img/bootstrap/back.png" height="40" /></a>
	<?php }elseif($auth['type'] == 'author'){ ?>
	<a href="/news/draft"><img src="../img/bootstrap/back.png" height="40" /></a>
	<?php }else{ ?>
	<a href="/invoices/index"><img src="../img/bootstrap/back.png" height="40" /></a>
	<?php }?>
<?php }else{ ?>
	<a href="/session/index"><img src="../img/bootstrap/login.png" height="40" /></a>
<?php	
	}
?>
    </p>
</div>


