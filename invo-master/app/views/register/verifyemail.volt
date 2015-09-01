<?php use phalcon\tag as tag?>
{{ content() }}

<div class="page-header">
    <h4>Email验证成功，设置帐号的登录密码，完成注册。</h4>
</div>
{{ form('register/register', 'id': 'registerForm', 'onbeforesubmit': 'return false') }}
<style>
.controls_title{
	width:200px;
	margin:15px 15px 15px auto;
	text-align:right;
}
.controls{
	width:300px;
	margin:15px auto;	
}
.f_left{
	float:left;
}
.f_right{
	float:right;
}
.clear{
	clear:both;
}
.form-actions{
	margin:auto auto 15px 215px;
}
.form-actions .confirmProtocol{
	margin:7px 7px auto auto;
}


/* 协议 */
.protocol_out{
	position:absolute;
	background:rgba(255, 255, 255, 0.6) none repeat scroll 0 0;
	border-radius:3px;
	box-shadow:0 0 6px rgba(0, 0, 0, 0.5);
	padding:5px;
	left:510px;
	top:80px;
	width:auto;
	z-index:2000;
	display:none;
}
.protocol_in{
	background:#fafafa none repeat scroll 0 0;
	border:1px solid #fff;
	border-radius:3px;
}
.protocol_body{
	background:white none repeat scroll 0 0;
}
.alt{
	position:relative;
	width:540px;
}
.alt_close{
    background: rgba(0, 0, 0, 0) url("/img/bootstrap/bg2.png");
	background-position:121px -467px;
    height:33px;
    position:absolute;
    right:8px;
    top:13px;
    width:33px;
	cursor:pointer;
}
.alt_tit{
    border-bottom: 1px dotted #d1d1d1;
    font-size: 16px;
    line-height: 22px;
    margin: 0 30px;
    padding: 30px 0 10px;
	color:#333;
	font-weight:bold;
}
.alt_c{
	padding: 10px 30px 20px;
}
.protocol .alt_in{
	height:400px;
}
.alt_in{
    overflow: auto;
    width: 100%;
}
.clearfix::after{
    clear: both;
    content: ".";
    display: block;
    font-size: 0;
    height: 0;
    line-height: 0;
    overflow: hidden;
    visibility: hidden;
}
.alt_b{
    padding: 0 30px 20px;
    text-align: center;
}
.protocol p{
	color:#aaa;
	line-height: 1.6;
}
.protocol h4{
	color:#000;
	font-weight:bold;
}
.fs14 {
    font-size: 14px;
}
.mb5 {
    margin-bottom: 5px;
}
.mt10 {
    margin-top: 10px;
}
.shadows{
	position:absolute;
	z-index:1000;
	top:0;
	left:0;
	width:100%;
	height:719px;
	background:#000;
	filter:alpha(opacity=40);
	opacity:0.4;
	display:none;
}
</style>

    <fieldset>
		<div class="control-group">
			<div class="controls_title f_left">
            {{ form.label('email', ['class': 'control-label']) }}
            </div>
			<div class="controls f_left">
				{{ email }}
				<input type="hidden" name="email" value="{{ email }}" />
            </div>
			<div class="clear"></div>
        </div>	

		<div class="control-group">
			<div class="controls_title f_left">
            <label class="control-label">所属部门</label>
            </div>
			<div class="controls f_left">
				{{ deparment }}
				<?php echo Tag::hiddenField(array("did","type" => "number")) ?>
            </div>
			<div class="clear"></div>
        </div>			
		
        <div class="control-group">
			<div class="controls_title f_left">
            {{ form.label('username', ['class': 'control-label']) }}
            </div>		       
            <div class="controls f_left">
                {{ form.render('username', ['class': 'form-control']) }}
                <div class="alert alert-warning" id="username_alert">
                    <strong>错误 !</strong> 请输入用户名
                </div>
            </div>
			<div class="clear"></div>
        </div> 
		
        <div class="control-group">
			<div class="controls_title f_left">
            {{ form.label('name', ['class': 'control-label']) }}
            </div>		       
            <div class="controls f_left">
                {{ form.render('name', ['class': 'form-control']) }}
                <div class="alert alert-warning" id="username_alert">
                    <strong>错误 !</strong> 请输入使用者的名称
                </div>
            </div>
			<div class="clear"></div>
        </div> 
		
         <div class="control-group">
			<div class="controls_title f_left">
            {{ form.label('password', ['class': 'control-label']) }}
            </div>				 
            <div class="controls f_left">
                {{ form.render('password', ['class': 'form-control']) }}
                <div class="alert alert-warning" id="password_alert">
                    <strong>错误 !</strong> 请输入密码
                </div>
            </div>
			<div class="clear"></div>
        </div>

        <div class="control-group">
			<div class="controls_title f_left">
				<label class="control-label">确认密码</label>
            </div>			
            <div class="controls f_left">
                {{ password_field('repeatPassword', 'class': 'form-control') }}
                <div class="alert" id="repeatPassword_alert">
                    <strong>错误 !</strong> 两次密码不一样
                </div>
            </div>
			<div class="clear"></div>
        </div> 

        <div class="form-actions">
<!-- 			<p class="help-block">
				<input type="checkbox" class="confirm_protocol" />
				我已阅读并同意<a class="show_protocol" href="javascript:;">《使用协议》</a>
			</p> -->
			
            {{ submit_button('完 成', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}
        </div>	
    </fieldset>
</form>
