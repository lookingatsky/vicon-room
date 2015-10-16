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

		{% for debts in page.items %}
		{% if loop.first %}
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>出借编号</th>
					<th>资金出借及回收方式</th>
					<th>初始出借日期</th>
					<th>初始出借金额</th>
					<th>账户管理费</th>
					<th>债权受让人（新债权人）</th>
					<th>身份证（护照）号码</th>
					<th colspan="2"></th>
				</tr>
			</thead>
		{% endif %}
			<tbody>
				<tr>
					<td style="vertical-align:middle;"><a href="/debt/detail/{{ debts.id }}">{{ debts.number }}</a></td>
					<td style="vertical-align:middle;">{{ debts.type }}</td>
					<td style="vertical-align:middle;">{{ debts.time }}</td>
					<td style="vertical-align:middle;">{{ debts.total }}</td>
					<td style="vertical-align:middle;">{{ debts.cost }}</td>
					<td style="vertical-align:middle;">{{ debts.customer.name }}</td>	
					<td style="vertical-align:middle;">{{ debts.customer.number }}</td>	
					<td width="10%">{{ link_to("debt/edit/" ~ debts.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}</td>
					<td width="10%">{{ link_to("debt/delete/" ~ debts.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
				</tr>
			</tbody>
		{% if loop.last %}
			<tbody>
				<tr>
					<td colspan="9" align="right">
						<div class="btn-group">
							{{ link_to("debt/index/", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
							{{ link_to("debt/index/?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
							{{ link_to("debt/index/?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
							{{ link_to("debt/index/?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
							<span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
						</div>
					</td>
				</tr>
			<tbody>
		</table>
		{% endif %}
		{% else %}
			没有债权信息
		{% endfor %}
