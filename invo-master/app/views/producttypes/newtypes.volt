<?php use Phalcon\Tag as Tag ?>

<?php echo Tag::form("producttypes/createtypes") ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo(array("producttypes/search", "&larr; 返回")) ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("保存", "class" => "btn btn-success")) ?>
    </li>
</ul>

<?php echo $this->getContent() ?>

<div class="center scaffold">
    <h2>创建下级类型</h2>
    
<!--     <input type="hidden" name="id" id="id" value="<?php echo $id ?>" />

    <div class="clearfix">
        <label for="name">名称</label>
        <?php echo Tag::textField(array("name", "size" => 24, "maxlength" => 70)) ?>
    </div> -->
		<?php echo Tag::hiddenField(array("fid", "size" => 24, "maxlength" => 70)) ?>

		<div class="clearfix">
			<label for="name">名称</label>
			{{ form.render("name") }}
		</div>

		<div class="clearfix">
			<label for="limit">限额</label>
			{{ form.render("limit") }}
		</div>

		<div class="clearfix">
			<label for="remark">备注</label>
			{{ form.render("remark") }}
		</div>	
		
    </form>
</div>
