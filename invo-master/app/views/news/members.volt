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
    <li class="previous pull-left">
		{{ form('', 'method': 'post') }}
        <?php echo Phalcon\Tag::select(array("type", array("" => "全部", "author" => "初稿管理员", "editor" => "新闻管理员"),'class'=>'submitSearch')) ?>
		<?php echo Phalcon\Tag::submitButton(array('排序','class'=>'submitSearch')); ?>
		</form>
    </li>
    <li class="pull-right">
        {{ link_to("news/newmember", "创建管理员", "class": "btn btn-primary createCustomer") }}
    </li>
</ul>

{% for index,member in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
    <thead>
        <tr>
            <th>序号</th>
            <th>姓名</th>
			<th>邮箱</th>
			<th>帐号类型</th>
			<th>营业部</th>
            <th>创建时间</th>
			<th></th>
        </tr>
    </thead>
{% endif %}
    <tbody>
        <tr>
            <td style="vertical-align:middle;">{{ index+1+10*(page.current-1) }}</td>
            <td style="vertical-align:middle;">{{ member.name }}</td>
			<td style="vertical-align:middle;">{{ member.email }}</td>
            <td style="vertical-align:middle;">{% if member.type == 'author' %}初稿管理员{% elseif member.type == 'editor' %}新闻管理员{% else %}超级管理员{% endif %}</td>
			<td style="vertical-align:middle;">{% if member.did == 0 %}总部{% else %}{{ member.department.name }}{% endif %}</td>
			<td style="vertical-align:middle;">{{ member.created_at }}</td>	
            <td width="10%">{{ link_to("news/deletemember/" ~ member.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}</td>
        </tr>
    </tbody>
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="8" align="right">
                <div class="btn-group">
                    {{ link_to("news/members", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
                    {{ link_to("news/members?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
                    {{ link_to("news/members?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
                    {{ link_to("news/members?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{% endif %}
{% else %}
    没有管理员信息
{% endfor %}
