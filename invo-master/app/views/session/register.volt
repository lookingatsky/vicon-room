<?php use phalcon\tag as tag?>
{{ content() }}

{{ form('session/register', 'id': 'registerForm', 'class': 'form-horizontal', 'onbeforesubmit': 'return false') }}
 
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("companies/search", "&larr; 返 回") }}
    </li>
    <li class="pull-right">
          {{ submit_button('保 存', 'class': 'btn btn-success', 'onclick': 'return SignUp.validate();') }}
    </li>	
</ul>
	<fieldset>
	
		<?php echo Tag::hiddenField(array("did","type" => "number")) ?>
	
        <div class="control-group">
            <label class="control-label" for="name">使用者名称</label>
            <div class="controls">
                {{ text_field('name', 'class': 'input-xlarge') }}
                <div class="alert" id="name_alert">
                    <strong>警告!</strong> 请输入名称
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="username">帐号</label>
            <div class="controls">
                {{ text_field('username', 'class': 'input-xlarge') }}
                <div class="alert" id="username_alert">
                    <strong>警告!</strong> 请输入帐号
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="email">邮箱</label>
            <div class="controls">
                {{ text_field('email', 'class': 'input-xlarge') }}
                <div class="alert" id="email_alert">
                    <strong>警告!</strong> 请输入邮箱
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="password">密码</label>
            <div class="controls">
                {{ password_field('password', 'class': 'input-xlarge') }}
                <p class="help-block">(至少8个字符)</p>
                <div class="alert" id="password_alert">
                    <strong>警告!</strong> 请输入有效的密码
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="repeatPassword">确认密码</label>
            <div class="controls">
                {{ password_field('repeatPassword', 'class': 'input-xlarge') }}
                <div class="alert" id="repeatPassword_alert">
                    <strong>警告!</strong> 两次输入密码不一致
                </div>
            </div>
        </div>
    </fieldset>
</form>
