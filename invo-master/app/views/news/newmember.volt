<?php use Phalcon\Tag as Tag ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("news/members", "&larr; 返回") ?>
    </li>
	<?php echo Tag::form(array("news/addmember", "autocomplete" => "off")) ?>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("提 交", "class" => "btn btn-success")) ?>
    </li>
</ul>
<style>
.help-block{
	font-size:11px;
	color:darkred;
}
</style>
<div class="left scaffold" style="width:690px;">
    <h3>添加管理员</h3>
	<hr />
    <fieldset>
       <div class="control-group">
            <label class="control-label" for="type">管理员类型</label>
            <div class="controls">
                <?php echo Phalcon\Tag::select(array("type", array("editor" => "新闻管理员","author" => "初稿管理员"),'class'=>'submitSearch')) ?>
            </div>
        </div>	

       <div class="control-group">
            <label class="control-label" for="deparment">营业部</label>
            <div class="controls">
                <?php echo Tag::select(array("department", $department, "using" => array("id", "name"),'useEmpty' => true,'emptyText'  => '总部','emptyValue' => '0',)) ?>
            </div>
        </div>			
		
       <div class="control-group">
            {{ form.label('name', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('name', ['class': 'form-control']) }}
                <p class="help-block">(必填)</p>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('username', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('username', ['class': 'form-control']) }}
                <p class="help-block">(必填)</p>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('email', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('email', ['class': 'form-control']) }}
                <p class="help-block">(必填)</p>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('password', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('password', ['class': 'form-control']) }}
                <p class="help-block">(至少8个字符)</p>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="repeatPassword">Repeat Password</label>
            <div class="controls">
                {{ password_field('repeatPassword', 'class': 'input-xlarge') }}
            </div>
        </div>	
	</fieldset>
</div>
</form>
