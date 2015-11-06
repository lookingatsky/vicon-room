<?php use Phalcon\Tag as Tag ?>
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("loan/index/", "&larr; 返回") }}
    </li>
    <li class="pull-right">
        {{ link_to("loan/new/" ~ loan.id, "上传文件","class": "btn btn-primary") }}
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
    <h3>借款基本信息</h3>
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
				<label><div class="title pull-left"><b>客户姓名：</b></div> <div class="content pull-left">{{ loan.borrower.name }}</div><div class="clear"></div></label>
				{% if loan.borrower.source is defined %}
				<label><div class="title pull-left"><b>客户来源：</b></div> <div class="content pull-left">{{ loan.borrower.source }}</div><div class="clear"></div></label>
				{% endif %}
				{% if borrower.sex != null %}
				<label><div class="title pull-left"><b>性 别：</b></div> <div class="content pull-left">{% if loan.borrower.sex == 1 %}男{% else %}女{% endif %}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>手机号码：</b></div> <div class="content pull-left">{{ loan.borrower.cellphone }}</div><div class="clear"></div></label>
				{% if loan.borrower.email is defined %}
				<label><div class="title pull-left"><b>邮 箱：</b></div> <div class="content pull-left">{{ loan.borrower.email }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>身份证号码：</b></div> <div class="content pull-left"><?php echo substr($loan->borrower->number,0,5)?>********<?php echo substr($loan->borrower->number,14,4)?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>居住地址：</b></div> <div class="content pull-left">{{ loan.borrower.address }}</div><div class="clear"></div></label>
				{% if loan.borrower.address_num is defined %}
				<label><div class="title pull-left"><b>邮政编码：</b></div> <div class="content pull-left">{{ loan.borrower.address_num }}</div><div class="clear"></div></label>
				{% endif %}
				{% if loan.borrower.registered is defined %}
				<label><div class="title pull-left"><b>户籍地址：</b></div> <div class="content pull-left">{{ loan.borrower.registered }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>银行卡号：</b></div> <div class="content pull-left"><?php echo substr($loan->card_num,0,5)?>********<?php echo substr($loan->card_num,14,4)?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>户 名：</b></div> <div class="content pull-left">{{ loan.card_name }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>开 户 行：</b></div> <div class="content pull-left">{{ loan.card_address }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>营业部：</b></div> <div class="content pull-left">{{ loan.department }}</div><div class="clear"></div></label>
				{% if loan.account_manager is defined %}
				<label><div class="title pull-left"><b>客户经理：</b></div> <div class="content pull-left">{{ loan.account_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if loan.team_manager is defined %}
				<label><div class="title pull-left"><b>团队经理：</b></div> <div class="content pull-left">{{ loan.team_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if loan.d_manager is defined %}
				<label><div class="title pull-left"><b>营业部经理：</b></div> <div class="content pull-left">{{ loan.d_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if loan.d_assistant is defined %}
				<label><div class="title pull-left"><b>营业部副经理：</b></div> <div class="content pull-left">{{ loan.d_assistant }}</div><div class="clear"></div></label>
				{% endif %}
			</div>
		</li>
		<li class="previous pull-left">
			<div class="clearfix" style="float:left;">
				<label><div class="title pull-left"><b>合同编号：</b></div> <div class="content pull-left">{{ loan.number }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>产品类型：</b></div> <div class="content pull-left">{{ loan.type }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>借款期数：</b></div> <div class="content pull-left">{{ loan.cycle }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>借款用途：</b></div> <div class="content pull-left">{{ loan.purpose }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>月利率：</b></div> <div class="content pull-left">{{ loan.month_rate*100 }}%</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>服务费率：</b></div> <div class="content pull-left">{{ loan.service_rate*100 }}%</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>批款金额：</b></div> <div class="content pull-left">{{ loan.allowed_money }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>外访费：</b></div> <div class="content pull-left">{{ loan.visit_money }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>加急费：</b></div> <div class="content pull-left">{{ loan.fast_money }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>签约日期：</b></div> <div class="content pull-left">{{ loan.assign_time }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>借款状态：</b></div> <div class="content pull-left">{{ loan.loan_status }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>终审日期：</b></div> <div class="content pull-left">{{ loan.verify_time }}</div><div class="clear"></div></label>
				{% if loan.remark is defined %}
				<label><div class="title pull-left"><b>备注：</b></div> <div class="content pull-left">{{ loan.remark }}</div><div class="clear"></div></label>
				{% endif %}
			</div>
		</li>	
	</ul>
	<hr />
	<h3>抵押物文件列表</h3>
	<hr />	
	<div style="text-align:left;">	
		<ul class="fileList">
		{% for detail in pawn %}
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
				{% for index,detail in pawn %}
				<tr>
					<td>{{ index+1 }}</td>
					<td><a href="{{detail.src}}">{{ detail.title }}</a></td>
					<td width="12%">{{ link_to("loan/editfile/" ~ detail.id, '<i class="icon-pencil"></i> 编辑文件标题', "class": "btn") }}</td>
					<td width="8%">{{ link_to("loan/deletechild/" ~ detail.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
				</tr>
				{% endfor %}
			</tbody>	
		</table>
	</div>
</div>

