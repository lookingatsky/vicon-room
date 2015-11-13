<?php use Phalcon\Tag as Tag ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("news/types", "&larr; 返回") ?>
    </li>
	<?php echo Tag::form(array("news/addtype", "autocomplete" => "off")) ?>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("提 交", "class" => "btn btn-success")) ?>
    </li>
</ul>
<div class="left scaffold" style="width:690px;">
    <h3>添加新闻类型</h3>
	<hr />
	
    <div class="clearfix">
        <label for="name">类型名称</label>
        <?php echo Tag::textField(array("name", "size" => 24, "maxlength" => 70)) ?>
    </div>
 
</div>
</form>
