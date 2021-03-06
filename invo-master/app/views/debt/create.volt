<?php use Phalcon\Tag as Tag ?>
<?php echo $this->getContent() ?>

<form method="post" action="{{ url("debt/save") }}">

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("debt/index", "&larr; 返回") }}
    </li>
    <li class="pull-right">
        {{ submit_button("保存", "class": "btn btn-success") }}
    </li>
</ul>

<div class="center scaffold">
    <h2>创建新债权</h2>
	
	<?php echo Tag::hiddenField(array("cid","type" => "str")) ?>
	
    <div class="clearfix">
        <label for="name">出借编号</label>
        <?php echo Tag::textField(array("number","type" => "str")) ?>
    </div>

    <div class="clearfix">
        <label for="telephone">资金出借及回收方式</label>
		<?php echo Tag::selectStatic(array("type",array("一年赢"=>"一年赢","一年宝"=>"一年宝","单季赢"=>"单季赢","双季赢"=>"双季赢"))) ?>
    </div>
	
    <div class="clearfix">
        <label for="city">初始出借日期</label>		
         <?php echo Tag::textField(array("time","type" => "str")) ?>
    </div>
	
    <div class="clearfix">
        <label for="address">初始出借金额</label>
        <?php echo Tag::textField(array("total","type" => "str")) ?>
    </div>

    <div class="clearfix">
        <label for="contacts">账户管理费</label>
        <?php echo Tag::textField(array("cost","type" => "str")) ?>
    </div>

</div>
</form>