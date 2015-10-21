{{ content() }}
<style>
.submitSearch{
	padding-left:15px;
	padding-right:15px;
}
.keywords{
	margin-top:15px;
	margin-bottom: 0px;
}
.submitSearch{
	margin-top:15px;
	margin-bottom: 0px;
}
.createCustomer{
	margin-top:15px;
	margin-bottom: 0px;
}
</style>
<ul class="pager">
    <li class="previous pull-left">
		{{ form('', 'method': 'post') }}
        <?php echo Phalcon\Tag::textField(array('keyword', 'size' => 32,'class'=>'keywords')); ?>
		<?php echo Phalcon\Tag::submitButton(array('搜索','class'=>'submitSearch')); ?>
		</form>
    </li>
</ul>

		{% for index,infos in page.items %}
		{% if loop.first %}
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>序号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>手机号码</th>
					<th>邮箱</th>
					<th>联系电话</th>
					<th>邮编</th>
					<th>通信地址</th>
					<th>预约时间</th>
					<th>状态</th>
					<th></th>
				</tr>
			</thead>
		{% endif %}
			<tbody>
				<tr>
					<td style="vertical-align:middle;"><a href="/appointment/detail/{{ infos.id }}">{{ index+1+10*(page.current-1) }}</a></td>
					<td style="vertical-align:middle;">{{ infos.custName }}</td>
					<td style="vertical-align:middle;">{% if infos.custsex is defined %}{% if infos.custsex == 1%}男{% else %}女{% endif %}{% else %}不明{% endif %}</td>
					<td style="vertical-align:middle;">{{ infos.mobile }}</td>
					<td style="vertical-align:middle;">{{ infos.email }}</td>
					<td style="vertical-align:middle;">{{ infos.telephone }}</td>
					<td style="vertical-align:middle;">{{ infos.postcode }}</td>
					<td style="vertical-align:middle;">{{ infos.address }}</td>
					<td style="vertical-align:middle;">{% if infos.time is defined %}<?php echo date("Y年m月d日 H:i:s",$infos->time)?>{% else %}时间不明{% endif %}</td>
					<td style="vertical-align:middle;">{% if infos.type is defined %}{% if infos.type == 0%}<span class="label label-important">未处理</span>{% elseif infos.type == 1%}<span class="label label-warning">处理中</span>{% elseif infos.type == 2%}<span class="label label-success">已处理</span>{% else %}<span class="label label-info">状态不明</span>{% endif %}{% else %}<span class="label label-info">状态不明</span>{% endif %}</td>
					<td width="10%">{{ link_to("appointment/detail/" ~ infos.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}</td>
				</tr>
			</tbody>
		{% if loop.last %}
			<tbody>
				<tr>
					<td colspan="10" align="right">
						<div class="btn-group">
							{{ link_to("appointment/index/", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
							{{ link_to("appointment/index/?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
							{{ link_to("appointment/index/?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
							{{ link_to("appointment/index/?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
							<span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
						</div>
					</td>
				</tr>
			<tbody>
		</table>
		{% endif %}
		{% else %}
			没有预约信息
		{% endfor %}
