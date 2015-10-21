<?php use Phalcon\Tag as Tag ?>
{{ form('/appointment/save/', 'method': 'post') }}
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("appointment/index/", "&larr; 返 回") }}
    </li>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("保 存", "class" => "btn btn-success")) ?>
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
    <h3>预约信息</h3>
	<hr />

	<div style="text-align:left;line-height:25px;">
		<div><b>姓名</b>&nbsp;&nbsp;{{ infos.custName }}</div>
		<div><b>性别</b>&nbsp;&nbsp;{% if infos.custsex is defined %}{% if infos.custsex == 1%}男{% else %}女{% endif %}{% else %}不明{% endif %}</div>
		<div><b>手机号码</b>&nbsp;&nbsp;{{ infos.mobile }}</div>
		<div><b>邮箱</b>&nbsp;&nbsp;{{ infos.email }}</div>
		<div><b>联系电话</b>&nbsp;&nbsp;{{ infos.telephone }}</div>
		<div><b>邮编</b>&nbsp;&nbsp;{{ infos.postcode }}</div>
		<div><b>通信地址</b>&nbsp;&nbsp;{{ infos.address }}</div>
		<div><b>预约时间</b>&nbsp;&nbsp;{{ infos.time }}</div>
	</div>
	<hr />
	<div style="text-align:left;">
		<?php echo Tag::hiddenField(array("id","value"=>$infos->id,"type" => "number")) ?>
		<div><b>状态</b>&nbsp;&nbsp;<?php echo Tag::selectStatic("type", array("1" => "处理中", "0" => "未处理", "2" => "已处理", "3" => "状态不明")) ?></div>	
		<div><b>备注</b>&nbsp;&nbsp;<?php echo Tag::textArea(array("remark","type" => "number")) ?></div>
	</div>
</form>	
	<hr />
	<h3>预约处理记录</h3>
	<hr />	
	<div style="text-align:left;">
		{% if remark is defined %}
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>序号</th>
					<th>处理人</th>
					<th>时间</th>
					<th>操作</th>
					<th>备注</th>
					<!-- <th colspan="2"></th> -->
				</tr>
			</thead>
			<tbody>
				{% for detail in remark %}
				<tr>
					<td><?php echo $detail['id'];?></td>
					<td><?php echo $detail['name'];?></td>
					<td><?php echo date('Y年m月d日 H:i:s',$detail['time']);?></td>
					<td><?php echo $detail['operate'];?></td>
					<td><?php echo $detail['remark'];?></td>
					<!-- <td width="10%">{{ link_to("debt/edit/" ~ detail.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}</td>
					<td width="10%">{{ link_to("debt/deletechild/" ~ detail.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td> -->
				</tr>
				{% endfor %}
			</tbody>	
		</table>
		{% else %}
		暂无处理记录
		{% endif %}
	</div>
</div>

