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
	margin-left:30px;
}
</style>
<ul class="pager">
    <li class="pull-right">
        {{ link_to("news/newproduct", "创建产品", "class": "btn btn-primary createCustomer") }}
    </li>
</ul>

{% for index,product in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
    <thead>
        <tr>
            <th>序号</th>
			<th>产品名称</th>
			<th>产品类型</th>
			<th>发行机构</th>
			<th>产品状态</th>
			<th>产品期限</th>
			<th>投资起点</th>
			<th>预期收益</th>
			<th>发行时间</th>
			<th></th>
        </tr>
    </thead>
{% endif %}
    <tbody>
        <tr>
            <td width="10%" style="vertical-align:middle;">{{ index+1+10*(page.current-1) }}</td>
            <td style="vertical-align:middle;">{{ product.name }}</td>
			<td style="vertical-align:middle;">{{ product.FproductTypes.name }}</td>
			<td style="vertical-align:middle;">{{ product.issuer}}</td>
			<td style="vertical-align:middle;">{{ product.status}}</td>
			<td style="vertical-align:middle;">{{ product.cycle}}</td>
			<td style="vertical-align:middle;">{{ product.min}}</td>
			<td style="vertical-align:middle;">{{ product.expected}}</td>
			<td style="vertical-align:middle;">{{ product.issuetime}}</td>
            <td width="10%">{{ link_to("news/editproduct/" ~ product.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}</td>
            <td width="10%">{{ link_to("news/deleteproduct/" ~ product.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
        </tr>
    </tbody>
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="11" align="right">
                <div class="btn-group">
                    {{ link_to("news/product", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
                    {{ link_to("news/product?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
                    {{ link_to("news/product?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
                    {{ link_to("news/product?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{% endif %}
{% else %}
    没有产品信息
{% endfor %}
