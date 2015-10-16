<?php use Phalcon\Tag as Tag ?>
<?php echo $this->getContent() ?>

<form method="post" action="{{ url("customer/save") }}">

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("customer/index", "&larr; 返回") }}
    </li>
    <li class="pull-right">
        {{ submit_button("保存", "class": "btn btn-success") }}
    </li>
</ul>

<div class="center scaffold">
    <h2>创建客户</h2>

    <div class="clearfix">
        <label for="name">名 称</label>
        <?php echo Tag::textField(array("name","type" => "str")) ?>
    </div>

    <div class="clearfix">
        <label for="telephone">身份证号码</label>
        <?php echo Tag::textField(array("number","type" => "str")) ?>
    </div>
	
    <div class="clearfix">
        <label for="city">手机号码</label>
        <?php echo Tag::textField(array("cellphone","type" => "str")) ?>
    </div>
	
    <div class="clearfix">
        <label for="address">居住地址</label>
        <?php echo Tag::textArea(array("address","type" => "str")) ?>
    </div>

    <div class="clearfix">
        <label for="contacts">户籍地址</label>
        <?php echo Tag::textArea(array("registered","type" => "str")) ?>
    </div>

</div>
</form>