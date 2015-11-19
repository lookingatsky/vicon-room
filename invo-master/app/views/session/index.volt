
{{ content() }}

<div class="login-or-signup" style="height:520px;background:url('../img/bootstrap/bgLogin.jpg');background-size:100% auto;">
    <div class="row" style="margin-top:100px;">

        <div class="span6">
            <div class="page-header">
                <h2>登 陆</h2>
            </div>
            {{ form('session/start', 'class': 'form-inline') }}
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="email">用户名/邮箱</label>
                        <div class="controls">
                            {{ text_field('email', 'size': "30", 'class': "input-xlarge") }}
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">密码</label>
                        <div class="controls">
                            {{ password_field('password', 'size': "30", 'class': "input-xlarge") }}
                        </div>
                    </div>
                    <div class="form-actions">
                        {{ submit_button('登 陆', 'class': 'btn btn-primary btn-large') }}
                    </div>
                </fieldset>
            </form>
        </div>

    </div>
</div>
