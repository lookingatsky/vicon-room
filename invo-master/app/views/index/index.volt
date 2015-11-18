
{{ content() }}
<div class="hero-unit">
	<p><img height="300" src="../img/bootstrap/index_3.jpg" /></p>
	<br />
    <p style="line-height:30px;">中合万邦内部工作系统是自用系统<br />如果没有账号，请先联系系统管理员。</p>

<?php 
	$auth = $this->session->get('auth');
	if(isset($auth)){
?>	
	<?php if($auth['type'] == 'market'){ ?>
	<p>{{ link_to('customer/index', '回到系统 &raquo;', 'class': 'btn btn-primary btn-large') }}</p>
	<?php }elseif($auth['type'] == 'editor'){ ?>
	<p>{{ link_to('news/index', '回到系统 &raquo;', 'class': 'btn btn-primary btn-large') }}</p>
	<?php }elseif($auth['type'] == 'author'){ ?>
	<p>{{ link_to('news/draft', '回到系统 &raquo;', 'class': 'btn btn-primary btn-large') }}</p>
	<?php }else{ ?>
	<p>{{ link_to('invoices/index', '回到系统 &raquo;', 'class': 'btn btn-primary btn-large') }}</p>
	<?php }?>
<?php }else{ ?>
	<p>{{ link_to('session/index', '登陆 &raquo;', 'class': 'btn btn-primary btn-large btn-success') }}</p>
<?php	
	}
?>
    
</div>


