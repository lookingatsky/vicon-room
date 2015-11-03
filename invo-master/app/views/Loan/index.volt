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

		{% for index,loan in page.items %}
		{% if loop.first %}
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>序号</th>
					<th>合同编号</th>
					<th>借款客户</th>
					<th>身份证号码</th>
					<th>手机号码</th>
					<th>借款类型</th>
					<th>签约日期</th>
					<th>批款金额</th>
					<th>借款期数</th>
					<th>借款状态</th>
					<th colspan="2"></th>
				</tr>
			</thead>
		{% endif %}
			<tbody>
				<tr>
					<td style="vertical-align:middle;">{{ index+1+(page.current-1)*10 }}</td>
					<td style="vertical-align:middle;"><a href="/loan/detail/{{ loan.id }}">{{ loan.number }}</a></td>
					<td style="vertical-align:middle;">{{ loan.name }}</td>
					<td style="vertical-align:middle;"><?php echo substr($loan->borrower->number,0,5)?>********<?php echo substr($loan->borrower->number,14,4)?></td>	
					<td style="vertical-align:middle;">{{ loan.borrower.cellphone }}</td>
					<td style="vertical-align:middle;">{{ loan.type }}</td>
					<td style="vertical-align:middle;">{{ loan.assign_time }}</td>
					<td style="vertical-align:middle;">{{ loan.allowed_money }}</td>
					<td style="vertical-align:middle;">{{ loan.cycle }}</td>
					<td style="vertical-align:middle;">{{ loan.loan_status }}</td>
					<td width="8%">{{ link_to("loan/edit/" ~ loan.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}</td>
					<td width="8%">{{ link_to("loan/delete/" ~ loan.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
				</tr>
			</tbody>
		{% if loop.last %}
			<tbody>
				<tr>
					<td colspan="11" align="right">
						<div class="btn-group">
							{{ link_to("loan/index/", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
							{{ link_to("loan/index/?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
							{{ link_to("loan/index/?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
							{{ link_to("loan/index/?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
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
