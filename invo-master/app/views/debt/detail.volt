<?php use Phalcon\Tag as Tag ?>
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("customer/detail/" ~ debts.customer.id, "&larr; 返回") }}
    </li>
    <li class="pull-right">
        {{ link_to("debt/new/" ~ debts.id, "上传文件","class": "btn btn-primary") }}
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
.fileList{
	list-style-type:none;
}
.fileList li{
	text-align:center;
	float:left;
	margin-right:50px;
	width:100px;
}
.clear{
	clear:both;
}
.title{
	width:150px;
	text-align:right;
	margin-right:30px;
	line-height:25px;
}
.content{
	width:400px;
	line-height:25px;
}
</style>
<script>
	$(function(){		
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
    <h3>债权基本信息</h3>
	<hr />
<!--     <div class="clearfix" style="float:left;">
        <label><b>名 称：</b> {{ customer.name }}</label>
		<label><b>身份证号码：</b> {{ customer.number }}</label>
		<label><b>现居地：</b> {{ customer.address }}</label>
		<label><b>户籍地址：</b> {{ customer.registered }}</label>
		<hr />
		<label><b>是否绑定帐号：</b> {% if hasAccount == 0%}否{% else %}是{% endif %}</label>
		<hr />
    </div> -->
	<ul class="pager">
		<li class="previous pull-left">
			<div class="clearfix" style="float:left;">
				<label><div class="title pull-left"><b>客户姓名：</b></div> <div class="content pull-left">{{ debts.customer.name }}</div><div class="clear"></div></label>
				{% if debts.customer.source is defined %}
				<label><div class="title pull-left"><b>客户来源：</b></div> <div class="content pull-left">{{ debts.customer.source }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>性 别：</b></div> <div class="content pull-left">{% if debts.customer.sex == 1 %}男{% else %}女{% endif %}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>手机号码：</b></div> <div class="content pull-left">{{ debts.customer.cellphone }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>邮 箱：</b></div> <div class="content pull-left">{{ debts.customer.email }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>身份证号码：</b></div> <div class="content pull-left"><?php echo substr($debts->customer->number,0,5)?>********<?php echo substr($debts->customer->number,14,4)?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>邮寄地址：</b></div> <div class="content pull-left">{{ debts.customer.address }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>邮政编码：</b></div> <div class="content pull-left">{{ debts.customer.address_num }}</div><div class="clear"></div></label>
				{% if debts.customer.registered is defined %}
				<label><div class="title pull-left"><b>户籍地址：</b></div> <div class="content pull-left">{{ debts.customer.registered }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>银行卡号：</b></div> <div class="content pull-left">{{ debts.card_num }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>户 名：</b></div> <div class="content pull-left">{{ debts.card_name }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>开 户 行：</b></div> <div class="content pull-left">{{ debts.card_address }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>入账方式：</b></div> <div class="content pull-left">{{ debts.pay_method }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>是否接收债权文件：</b></div> <div class="content pull-left">{{ debts.if_received }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>接收债权文件地址：</b></div> <div class="content pull-left">{{ debts.r_address }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>邮 编：</b></div> <div class="content pull-left">{{ debts.r_num }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>邮寄方式：</b></div> <div class="content pull-left">{{ debts.mail_method }}</div><div class="clear"></div></label>
				{% if debts.mail_time is defined %}
				<label><div class="title pull-left"><b>邮寄日期：</b></div> <div class="content pull-left">{{ debts.mail_time }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.mail_num is defined %}
				<label><div class="title pull-left"><b>快递单号：</b></div> <div class="content pull-left">{{ debts.mail_num }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>申请门店：</b></div> <div class="content pull-left">{{ debts.apply_store }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>营业部：</b></div> <div class="content pull-left">{{ debts.department }}</div><div class="clear"></div></label>
				{% if debts.account_manager is defined %}
				<label><div class="title pull-left"><b>客户经理：</b></div> <div class="content pull-left">{{ debts.account_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.team_manager is defined %}
				<label><div class="title pull-left"><b>团队经理：</b></div> <div class="content pull-left">{{ debts.team_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.d_manager is defined %}
				<label><div class="title pull-left"><b>营业部经理：</b></div> <div class="content pull-left">{{ debts.d_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.d_assistant is defined %}
				<label><div class="title pull-left"><b>营业部副经理：</b></div> <div class="content pull-left">{{ debts.d_assistant }}</div><div class="clear"></div></label>
				{% endif %}
			</div>
		</li>
		<li class="previous pull-left">
			<div class="clearfix" style="float:left;">
				<label><div class="title pull-left"><b>出借编号：</b></div> <div class="content pull-left">{{ debts.number }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>合同编号：</b></div> <div class="content pull-left">{{ debts.contract_num }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>签约日期：</b></div> <div class="content pull-left"><?php echo date("Y年m月d日",$debts->assign_time);?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>划扣日期：</b></div> <div class="content pull-left"><?php if($debts->pay_time == "续签"){ echo $debts->pay_time; }else{ echo date("Y年m月d日",$debts->pay_time); } ?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>出借日期：</b></div> <div class="content pull-left"><?php echo date("Y年m月d日",$debts->invest_time);?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>产品名称：</b></div> <div class="content pull-left">{{ debts.type }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>出借金额：</b></div> <div class="content pull-left">{{ debts.total }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>POS小条流水号：</b></div> <div class="content pull-left">{{ debts.pos_num }}</div><div class="clear"></div></label>
				{% if debts.if_match is defined %}
				<label><div class="title pull-left"><b>是否匹配：</b></div> <div class="content pull-left">{{ debts.if_match }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.if_invest is defined %}
				<label><div class="title pull-left"><b>续投：</b></div> <div class="content pull-left">{{ debts.if_invest }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>反息日：</b></div> <div class="content pull-left">{{ debts.return_day }}天</div><div class="clear"></div></label>
			</div>
		</li>	
	</ul>
	<hr />
	<h3>债权文件列表</h3>
	<hr />	
	<div style="text-align:left;">	
		<ul class="fileList">
		{% for detail in debt %}
			{% if detail.type == 'txt'%}
				<li>
					<a href="{{detail.src}}"><img src="/img/icon/file/txt.png" width="100"/></a><br />
					<a href="{{detail.src}}">{{ detail.title }}</a>
				</li>
			{% elseif detail.type == 'xlsx' or detail.type == 'xls' %}
				<li>
					<a href="{{detail.src}}"><img src="/img/icon/file/excel.png" width="100"/></a><br />
					<a href="{{detail.src}}">{{ detail.title }}</a>
				</li>
			{% elseif detail.type == 'pdf' %}	
				<li>
					<a href="{{detail.src}}"><img src="/img/icon/file/pdf.png" width="100"/></a><br />
					<a href="{{detail.src}}">{{ detail.title }}</a>
				</li>	
			{% elseif detail.type == 'doc' or detail.type == 'docx' %}	
				<li>
					<a href="{{detail.src}}"><img src="/img/icon/file/word.png" width="100"/></a><br />
					<a href="{{detail.src}}">{{ detail.title }}</a>
				</li>				
			{% endif %}
		{% endfor %}
		</ul>
		<div class="clear"></div>
	</div>
	<hr />	
	<div style="text-align:left;">
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>序号</th>
					<th>文件标题</th>
					<th colspan="2"></th>
				</tr>
			</thead>
			<tbody>
				{% for index,detail in debt %}
				<tr>
					<td>{{ index+1 }}</td>
					<td><a href="{{detail.src}}">{{ detail.title }}</a></td>
					<td width="12%">{{ link_to("debt/editfile/" ~ detail.id, '<i class="icon-pencil"></i> 编辑文件标题', "class": "btn") }}</td>
					<td width="8%">{{ link_to("debt/deletechild/" ~ detail.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
				</tr>
				{% endfor %}
			</tbody>	
		</table>
	</div>
	<hr />
	<h3>借款人列表</h3>
	<hr />
	<div style="text-align:left;">
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>序号</th>
					<th>借款编号</th>
					<th>借款人</th>
					<th>出借编号</th>
					<th>出借金额</th>
					<th>此次分配金额</th>
					<th>剩余金额</th>
					<th>目前状态</th>
					<th colspan="2"></th>
				</tr>
			</thead>
			<tbody>
				{% for index,detail in match %}
				<tr>
					<td>{{ index+1 }}</td>
					<td><a target="_blank" href="/loan/detail/{{ detail.loan.id }}">{{ detail.loan_number }}</a></td>
					<td>{{ detail.loan.borrower.name }}</td>
					<td>{{ detail.debt_number }}</td>
					<td>{{ detail.debt_money }}</td>
					<td>{{ detail.debt_borrow }}</td>
					<td>{{ detail.debt_last }}</td>
					<td>{{ detail.status }}</td>
					<td width="8%">{{ link_to("debt//" ~ detail.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}</td>
					<td width="8%">{{ link_to("debt//" ~ detail.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
				</tr>
				{% endfor %}
			</tbody>	
		</table>
	</div>	
</div>

