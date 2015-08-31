<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>

<div align="right">
    <?php echo Tag::linkTo(array("producttypes/search", "类型列表", "class" => "btn btn-info")) ?>
</div>

<?php echo Tag::form(array("producttypes/search", "autocomplete" => "off")) ?>

<style>
.fLeft{
	float:left;
}	
.fRight{
	float:right;
}
</style>

<div class="center scaffold">

    <h2>搜索</h2>

    <div class="clearfix">
        <label for="id">序号</label>
        <?php echo Tag::textField(array("id", "size" => 10, "maxlength" => 10, "type" => "number")) ?>
    </div>

    <div class="clearfix">
        <label for="name">名称</label>
        <?php echo Tag::textField(array("name", "size" => 24, "maxlength" => 70)) ?>
    </div>

    <div class="clearfix">
        <?php echo Tag::submitButton(array("点击搜索", "class" => "btn btn-primary")) ?></td>
    </div>

</div>

</form>
