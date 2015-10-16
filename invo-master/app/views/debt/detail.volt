
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

	<div style="text-align:left;">
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>出借编号</th>
					<th>资金出借及回收方式</th>
					<th>初始出借日期</th>
					<th>初始出借金额</th>
					<th>下一个报告日</th>
					<th>账户管理费</th>
					<th>债权受让人（新债权人）</th>
					<th>身份证（护照）号码</th>
					<th>预计下一个报告日您的收益总额</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="vertical-align:middle;">{{ debts.number }}</td>
					<td style="vertical-align:middle;">{{ debts.type }}</td>
					<td style="vertical-align:middle;">{{ debts.time }}</td>
					<td style="vertical-align:middle;">{{ debts.total }}</td>
					<td style="vertical-align:middle;"></td>
					<td style="vertical-align:middle;">{{ debts.cost }}</td>
					<td style="vertical-align:middle;">{{ debts.customer.name }}</td>	
					<td style="vertical-align:middle;">{{ debts.customer.number }}</td>	
					<td style="vertical-align:middle;"></td>
				</tr>
			</tbody>
		</table>
	</div>
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
					<td width="10%">{{ link_to("debt/edit/" ~ detail.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}</td>
					<td width="10%">{{ link_to("debt/deletechild/" ~ detail.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
				</tr>
				{% endfor %}
			</tbody>	
		</table>
	</div>
</div>

