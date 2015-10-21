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
    <li class="pull-right">
        {{ link_to("customer/new", "创建客户", "class": "btn btn-primary createCustomer") }}
    </li>
</ul>

{% for index,customer in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
    <thead>
        <tr>
            <th>序号</th>
            <th>姓名</th>
            <th>手机号码</th>
			<th>身份证号码</th>
            <th>现住址</th>
            <th>户籍地址</th>
			<th></th>
        </tr>
    </thead>
{% endif %}
    <tbody>
        <tr>
            <td style="vertical-align:middle;">{{ index+1+10*(page.current-1) }}</td>
            <td style="vertical-align:middle;">{{ customer.name }}</td>
            <td style="vertical-align:middle;">{{ customer.cellphone }}</td>
			<td style="vertical-align:middle;"><?php echo substr($customer->number,0,5)?>********<?php echo substr($customer->number,14,4)?></td>
            <td style="vertical-align:middle;">{{ customer.address }}</td>
            <td style="vertical-align:middle;">{{ customer.registered }}</td>		
            <td width="10%">{{ link_to("customer/detail/" ~ customer.id, '<i class="icon-pencil"></i> 查看详情', "class": "btn") }}</td>
            <td width="10%">{{ link_to("customer/delete/" ~ customer.id, '<i class="icon-remove"></i> 删除', "class": "btn btn-danger") }}</td>
        </tr>
    </tbody>
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="8" align="right">
                <div class="btn-group">
                    {{ link_to("customer/index", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
                    {{ link_to("customer/index?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
                    {{ link_to("customer/index?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
                    {{ link_to("customer/index?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{% endif %}
{% else %}
    没有客户信息
{% endfor %}
