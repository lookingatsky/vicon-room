<?php use phalcon\tag as tag?>
<?php echo $this->getContent() ?>

<div class="page-header">
<ul class="pager pull-left">
    <li class="previous pull-left">
        {{ link_to("customer/detail/" ~ customer.id, "&larr; 返 回") }}
    </li>	
</ul>
    <h3>绑定 <em class="alert-danger">{{ customer.name }}</em> 的邮箱帐号</h3>
</div>


{{ form('customer/sendemail', 'id': 'registerForm', 'onbeforesubmit': 'return false') }}

    <fieldset style="text-align:left;">
		<?php echo Tag::hiddenField(array("cid","type" => "number")) ?>
		<?php echo Tag::hiddenField(array("username","type" => "str")) ?>
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
