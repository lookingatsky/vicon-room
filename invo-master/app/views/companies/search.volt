{{ content() }}

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("companies/index", "&larr; 返回") }}
    </li>
    <li class="pull-right">
        {{ link_to("companies/new", "创建部门", "class": "btn btn-primary") }}
    </li>
</ul>

{% for company in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>序号</th>
            <th>名称</th>
            <th>电话</th>
			<th>城市</th>
            <th>地址</th>
            <th>联系人</th>
			<th>帐号列表</th>
        </tr>
    </thead>
{% endif %}
    <tbody>
        <tr>
            <td>{{ company.id }}</td>
            <td>{{ company.name }}</td>
            <td>{{ company.telephone }}</td>
			<td>{{ company.city }}</td>
            <td>{{ company.address }}</td>
            <td>{{ company.contacts }}</td>
            <td width="10%">{{ link_to("companies/edit/" ~ company.id, '<i class="icon-list"></i> 帐号', "class": "btn") }}</td>			
            <td width="10%">{{ link_to("companies/edit/" ~ company.id, '<i class="icon-pencil"></i> 编辑', "class": "btn") }}</td>
            <td width="10%">{{ link_to("companies/delete/" ~ company.id, '<i class="icon-remove"></i> 删除', "class": "btn") }}</td>
        </tr>
    </tbody>
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="8" align="right">
                <div class="btn-group">
                    {{ link_to("companies/search", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
                    {{ link_to("companies/search?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
                    {{ link_to("companies/search?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
                    {{ link_to("companies/search?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{% endif %}
{% else %}
    No companies are recorded
{% endfor %}
