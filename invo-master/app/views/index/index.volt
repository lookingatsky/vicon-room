
{{ content() }}
<div class="hero-unit">
	<p><img src="../img/bootstrap/index_2.jpg" /></p>
	<br />
    <p>中合万邦行政费控系统是自用系统，如果没有账号，请先联系系统管理员。</p>

<?php 
	$auth = $this->session->get('auth');
	if(isset($auth)){
?>	
	<?php if($auth['type'] == 'market'){ ?>
	<p>{{ link_to('customer/index', '回到系统 &raquo;', 'class': 'btn btn-primary btn-large') }}</p>
	<?php }else{ ?>
	<p>{{ link_to('invoices/index', '回到系统 &raquo;', 'class': 'btn btn-primary btn-large') }}</p>
	<?php }?>
<?php }else{ ?>
	<p>{{ link_to('session/index', '登陆 &raquo;', 'class': 'btn btn-primary btn-large btn-success') }}</p>
<?php	
	}
?>
    
</div>

<!-- <div class="row">
    <div class="span4">
        <h2>Manage Invoices Online</h2>
        <p>Create, track and export your invoices online. Automate recurring invoices and design your own invoice using our invoice template and brand it with your business logo. </p>
    </div>
    <div class="span4">
        <h2>Dashboards And Reports</h2>
        <p>Gain critical insights into how your business is doing. See what sells most, who are your top paying customers and the average time your customers take to pay.</p>
    </div>
    <div class="span4">
        <h2>Invite, Share And Collaborate</h2>
        <p>Invite users and share your workload as invoice supports multiple users with different permissions. It helps your business to be more productive and efficient. </p>
    </div>
</div> -->
