
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("customer/index", "&larr; 返回") }}
    </li>
</ul>
<style>
label{
	text-align:left;
}	
label font{
	height:30px;
	width:150px;
}
.addCard{
	position:fixed;
	top:150px;
	left:500px;
	border-radius:5px;
	width:400px;
	height:350px;
	border:2px solid #0088cc;
	background:#fff;
	font-family:"微软雅黑";
	display:none;
}
.addButton{
	padding-left:20px;
	padding-right:20px;
}
.addTitle{
	margin-top:30px;
	font-weight:bold;
	font-size:16px;
}
.addInfo{
	margin-top:20px;
}
.addSubmit{
	margin-top:30px;
}
.closeAdd{
	position:relative;
	top:10px;
	left:180px;
	transform:matrix(1,1,-1,1,0,0);	
	cursor:pointer;
}
.addBankCard{
	border:2px solid #000;
	width:170px;
	height:106px;
	border-radius:5px;
	line-height:106px;
	font-size:18px;
	cursor:pointer;
	font-weight:bold;
	margin:20px 20px auto auto;
	float:left;
}
.addBankCard_{
	border:2px solid #000;
	width:170px;
	height:106px;
	border-radius:5px;
	font-size:12px;
	cursor:pointer;
	font-weight:bold;
	margin:20px 20px auto auto;
	float:left;
}
.addBankCard_ .addBankCard_number{
	margin-top:20px;
}
.addBankCard_ .addBankCard_info{
	margin-top:10px;
}
</style>
<script>
	$(function(){
		$(".addBankCard").click(function(){
			$(".addCard").show();
		})
		$(".closeAdd").click(function(){
			$(".addCard").hide();
		})	
		$(".addButton").click(function(){
			var number = trim($(".addNumber").val());
			var name = trim($(".addName").val());
			var address = trim($(".addAddress").val());
			var uid = {{ uid }};
			if(number == ''){
				alert("银行帐号不能为空！");
			}else{
				if(name == ''){
					alert("开户名不能为空！");
				}else{
					if(address == ''){
						alert("开户行不能为空！");
					}else{
						$.post('/customer/addcard',{
							name:name,
							number:number,
							address:address,
							uid:uid
						},function(data){
							$(".addCard").hide();
							if(data == true){
								alert("添加成功！");
								var cardHtml = "<div class='addBankCard_'>";
								cardHtml +=  "<div class='addBankCard_number'>"+number+"</div>";
								cardHtml +=  "<div class='addBankCard_info'>"+name+" "+address+"</div>";
								cardHtml +=  "</div>"; 
								$(".addBankCard").parent().append(cardHtml);
							}else{
								alert("添加失败！");							
							}
						})
					}				
				}			
			}
		})
		
		$(".addBankCard_").click(function(){
			var cid = $(this).attr("cid");
			var index = $(this).index();
			if(confirm("是否确定解除绑定该银行卡？")){
				$.post('/customer/deletecard',{
					id:cid,
				},function(data){
					if(data == true){
						$(".cardsList").children().eq(index).remove();
						alert("解除成功！");
					}else{
						alert("解除失败！");
					}
				});
				
			}
		})
		
	　　 function trim(str){ //删除左右两端的空格
	　　     return str.replace(/(^\s*)|(\s*$)/g, "");
	　　 }
	　　 function ltrim(str){ //删除左边的空格
	　　     return str.replace(/(^\s*)/g,"");
	　　 }
	　　 function rtrim(str){ //删除右边的空格
	　　     return str.replace(/(\s*$)/g,"");
	　　 }		
	})
</script>
<div class="center scaffold">
    <h3>客户信息</h3>
    <div class="clearfix" style="float:left;">
        <label><b>名 称：</b> {{ customer.name }}</label>
		<label><b>身份证号码：</b> {{ customer.number }}</label>
		<label><b>现居地：</b> {{ customer.address }}</label>
		<label><b>户籍地址：</b> {{ customer.registered }}</label>
    </div>
	<div style="clear:both;"></div>
	<div class="cardsList">
		<div class="addBankCard">
			<i class="icon-plus" style="margin-top:4px;"></i> 添加银行卡
		</div>
		{% for card in cards %}
		<div class='addBankCard_' cid="{{ card.id }}</">
			<div class='addBankCard_number'>{{ card.number }}</div>
			<div class='addBankCard_info'>{{ card.name }} {{ card.address }}</div>
		</div>
		{% endfor %}
		<div style="clear:both;"></div>
	</div>
	<div class="addCard">
		<div class="closeAdd"><i class="icon-plus" style="margin-top:4px;"></i></div>
		<div class="addTitle">添加银行卡</div>
		<div class="addInfo">银行帐号：&nbsp;<input type="text" name="number" class="addNumber"/></div>
		<div class="addInfo">开 户 名&nbsp;：&nbsp;<input type="text" name="name" class="addName"/></div>
		<div class="addInfo">开 户 行&nbsp;：&nbsp;<input type="text" name="address" class="addAddress"/></div>
		<div class="addSubmit"><input class="addButton" type="button" value="添加"/></div>
	</div>	
 <!--    <div class="clearfix">
        <label for="telephone">电话</label>

    </div>
	
    <div class="clearfix">
        <label for="city">城市</label>

    </div>
	
    <div class="clearfix">
        <label for="address">地址</label>

    </div>

    <div class="clearfix">
        <label for="contacts">联系人</label>

    </div> -->
</div>

