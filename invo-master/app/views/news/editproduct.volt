<?php use Phalcon\Tag as Tag ?>

<?php echo Tag::form(array("news/addproduct", "autocomplete" => "off")) ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo(array("news/product", "&larr; 返 回")) ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("保 存", "class" => "btn btn-success")) ?>
    </li>
</ul>

<?php echo $this->getContent() ?>

<div class="scaffold">
    <h2>创建产品</h2>
		<?php echo Tag::hiddenField(array("pid","type" => "number")) ?>
		
    <div class="clearfix">
        <label for="product_types_id">产品类型</label>
        <?php echo Tag::select(array("product_types_id", $productTypes, "using" => array("id", "name"), "useDummy" => true)) ?>
    </div>

    <div class="clearfix">
        <label for="name">产品名称</label>
        <?php echo Tag::textField(array("name", "size" => 24, "maxlength" => 70)) ?>
    </div>
	
    <div class="clearfix">
        <label for="status">产品状态</label>
        <?php echo Tag::selectStatic("status", array("1" => "发行中", "0" => "未发行", "2" => "审核中", "3" => "已过期")) ?>
    </div>

    <div class="clearfix">
        <label for="issuer">发行机构</label>
        <?php echo Tag::selectStatic("issuer", array("万邦家族财富" => "万邦家族财富", "万邦普惠" => "万邦普惠")) ?>
    </div>

    <div class="clearfix">
        <label for="cycle">产品期限</label>
        <?php echo Tag::textField(array("cycle","maxlength" => 70)) ?>
    </div>
	
    <div class="clearfix">
        <label for="min">最小投资金额</label>
        <?php echo Tag::textField(array("min","maxlength" => 70)) ?>
    </div>

    <div class="clearfix">
        <label for="expected">预期收益</label>
        <?php echo Tag::textField(array("expected","maxlength" => 70)) ?>
    </div>
	
    <div class="clearfix">
        <label for="issuetime">发行时间</label>
        <?php echo Tag::textField(array("issuetime","maxlength" => 70)) ?>
    </div>	

    <div class="clearfix">
        <label for="telephone">预约电话</label>
        <?php echo Tag::textField(array("telephone","maxlength" => 70)) ?>
    </div>

    <div class="clearfix">
        <label for="control">风控方式</label>
        <?php echo Tag::textArea(array("control","maxlength" => 500)) ?>
    </div>

    <div class="clearfix">
        <label for="description">详细描述</label>
        <?php echo Tag::textArea(array("description","maxlength" => 500)) ?>
    </div>	
	
</div>
</form>
