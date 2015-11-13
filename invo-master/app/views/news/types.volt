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
        {{ link_to("news/newtype", "创建新闻类型", "class": "btn btn-primary createCustomer") }}
    </li>
</ul>

{% for index,newstype in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
    <thead>
        <tr>
            <th>序号</th>
            <th>新闻类型</th>
			<th></th>
        </tr>
    </thead>
{% endif %}
    <tbody>
        <tr>
            <td width="10%" style="vertical-align:middle;">{{ index+1+10*(page.current-1) }}</td>
            <td style="vertical-align:middle;">{{ newstype.name }}</td>
            <td width="10%">{{ link_to("news/edittype/" ~ newstype.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}</td>
            <td width="10%">{{ link_to("news/deletetype/" ~ newstype.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
        </tr>
    </tbody>
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("news/types", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
                    {{ link_to("news/types?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
                    {{ link_to("news/types?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
                    {{ link_to("news/types?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{% endif %}
{% else %}
    没有新闻信息
{% endfor %}
