<?php use phalcon\tag as tag?>
<?php echo $this->getContent() ?>

<div class="page-header">
    <h2>注册中合万邦帐号</h2>
</div>
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("companies/search", "&larr; 返 回") }}
    </li>	
</ul>

{{ form('register/sendemail', 'id': 'registerForm', 'onbeforesubmit': 'return false') }}

    <fieldset>
		<?php echo Tag::hiddenField(array("did","type" => "number")) ?>
        <div class="control-group">
            {{ form.label('email', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('email', ['class': 'form-control']) }}
                <div class="alert alert-warning" id="email_alert">
                    <strong>错误 !</strong> 请输入邮箱
                </div>
            </div>
        </div>
		<div class="clear"></div>
        <div class="form-actions">
            {{ submit_button('发送邮件', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}
            <!-- <p class="help-block">我已阅读并同意<a href="#">《使用协议》</a></p> -->
        </div>

    </fieldset>
</form>
