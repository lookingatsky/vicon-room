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
<div class="left scaffold" style="width:690px;">
    <h3>编辑管理员</h3>
	<hr />
		<?php echo Tag::HiddenField(array("memberid")) ?>
    <fieldset>
       <div class="control-group">
            {{ form.label('name', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('name', ['class': 'form-control']) }}
                <p class="help-block">(required)</p>
                <div class="alert alert-warning" id="name_alert">
                    <strong>Warning!</strong> Please enter your full name
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('username', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('username', ['class': 'form-control']) }}
                <p class="help-block">(required)</p>
                <div class="alert alert-warning" id="username_alert">
                    <strong>Warning!</strong> Please enter your desired user name
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('email', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('email', ['class': 'form-control']) }}
                <p class="help-block">(required)</p>
                <div class="alert alert-warning" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>
	</fieldset>
 
</div>
</form>
