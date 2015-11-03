
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("borrower/index", "&larr; 返回") }}
    </li>
	{% if hasAccount == 0%}
<!--     <li class="pull-right">
        {{ link_to("borrower/account/"~uid,"class":"btn btn-warning", "绑定邮箱帐号") }}  
    </li> -->
	{% endif %}	
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
.cardsList{
	margin-bottom:25px;
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
						$.post('/borrower/addcard',{
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
				$.post('/borrower/deletecard',{
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
<style type="text/css">
.title{
	width:150px;
	text-align:right;
	margin-right:30px;
	line-height:25px;
}
.content{
	line-height:25px;
}
.clear{
	clear:both;
}
</style>
<div class="center scaffold">
    <h3>借款客户信息</h3>
	<ul class="pager">
		<li class="previous pull-left">
			<div class="clearfix" style="float:left;">
				<label><div class="title pull-left"><b>客户名称：</b></div> <div class="content pull-left">{{ borrower.name }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>性别：</b></div> <div class="content pull-left">{% if borrower.sex == 1 %}男{% else %}女{% endif %}</div><div class="clear"></div></label>
				<label>
					<div class="title pull-left"><b>证件号码：</b></div> <div class="content pull-left">
					<?php if(strlen($borrower->number) > 30){?>
						<?php echo substr($borrower->number,0,18)?>;<?php echo substr($borrower->number,18,19)?>
					<?php }else{ ?>
						<?php echo substr($borrower->number,0,5)?>********<?php echo substr($borrower->number,14,4)?>
					<?php }?>
					</div>
					<div class="clear"></div>
				</label>
				<label><div class="title pull-left"><b>手机号码：</b></div> <div class="content pull-left">{{ borrower.cellphone }}</div><div class="clear"></div></label>
				
				<label><div class="title pull-left"><b>居住地址：</b></div> <div class="content pull-left">{{ borrower.address }}</div><div class="clear"></div></label>
				{% if borrower.registered is defined %}
				<label><div class="title pull-left"><b>户籍地址：</b></div> <div class="content pull-left">{{ borrower.registered }}</div><div class="clear"></div></label>
				{% endif %}
				<hr />
				{% if borrower.source is defined %}
				<label><div class="title pull-left"><b>客户来源：</b></div> <div class="content pull-left">{{ borrower.source }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>是否绑定帐号：</b></div> <div class="content pull-left">{% if hasAccount == 0%}否{% else %}是{% endif %}</div><div class="clear"></div></label>
				<hr />
			</div>
		</li>
		<li class="pull-right">
			 {{ link_to("borrower/edit/"~uid,"class":"btn btn-primary", "编辑信息") }} 
		</li>
	</ul>
	<div style="clear:both;"></div>
	<div class="cardsList">
		<div class="addBankCard">
			<i class="icon-plus" style="margin-top:4px;"></i> 添加银行卡
		</div>
		
		{% for card in cards %}
		<div class='addBankCard_' cid="{{ card.id }}</">
			<div class='addBankCard_number'><?php echo substr($card->number,0,4)?>********<?php echo substr($card->number,strlen($card->number)-4,4)?></div>
			<div class='addBankCard_info'>{{ card.name }} {{ card.address }}</div>
		</div>
		{% endfor %}
		<div style="clear:both;"></div>
	</div>
	<hr style="clear:both;" />
	<div style="text-align:left;">
		<ul class="pager">
			<li class="previous pull-left">
				<h4>借款记录：</h4>
			</li>
			<li class="pull-right">
				{{ link_to("debt/create/" ~ customer.id, "创建新借款", "class": "btn btn-primary") }}
			</li>		
		</ul>
		
		{% for index,debts in page.items %}
		{% if loop.first %}
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>序号</th>
					<th>合同编号</th>
					<th>借款类型</th>
					<th>批款金额</th>
					<th>签约日期</th>
					<th>终审日期</th>
					<th>借款期数</th>
					<th>借款状态</th>
					<th>借款用途</th>
					<th>备注</th>
					<th colspan="2"></th>
				</tr>
			</thead>
		{% endif %}
			<tbody>
				<tr>
					<td style="vertical-align:middle;">{{ index+1+(page.current-1)*10 }}</td>
					<td style="vertical-align:middle;"><a href="/loan/detail/{{ debts.id }}">{{ debts.number }}</a></td>
					<td style="vertical-align:middle;">{{ debts.type }}</td>
					<td style="vertical-align:middle;">{{ debts.allowed_money }}</td>
					<td style="vertical-align:middle;">{{ debts.assign_time }}</td>
					<td style="vertical-align:middle;">{{ debts.verify_time }}</td>
					<td style="vertical-align:middle;">{{ debts.cycle }}</td>
					<td style="vertical-align:middle;">{{ debts.loan_status }}</td>
					<td style="vertical-align:middle;">{{ debts.purpose }}</td>
					<td style="vertical-align:middle;">{{ debts.remark }}</td>
					<td width="8%">{{ link_to("loan/edit/" ~ debts.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}</td>
					<td width="8%">{{ link_to("loan/delete/" ~ debts.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
				</tr>
			</tbody>
		{% if loop.last %}
			<tbody>
				<tr>
					<td colspan="14" align="right">
						<div class="btn-group">
							{{ link_to("borrower/detail/" ~ borrower.id, '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
							{{ link_to("borrower/detail/" ~ borrower.id ~"?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
							{{ link_to("borrower/detail/" ~ borrower.id ~"?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
							{{ link_to("borrower/detail/" ~ borrower.id ~"?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
							<span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
						</div>
					</td>
				</tr>
			<tbody>
		</table>
		{% endif %}
		{% else %}
			没有借款信息
		{% endfor %}
		
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

