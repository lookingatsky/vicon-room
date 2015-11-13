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
	width:150px;
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
		<?php echo Phalcon\Tag::select(array("typeid", $Newstype, "using" => array("id", "name"), 'useEmpty' => true,'emptyText'  => '全部','emptyValue' => '','class'=>'submitSearch')) ?>
		<?php echo Phalcon\Tag::select(array("status", array("" => "全部", "1" => "审核中", "0" => "未审核", "2" => "发布中", "3" => "未通过"),'class'=>'submitSearch')) ?>
		<?php echo Phalcon\Tag::submitButton(array('排序','class'=>'submitSearch')); ?>
		</form>
    </li>
    <li class="pull-right">
		{% if auth == 'author' %}
        {{ link_to("news/newdraft", "创建新闻初稿", "class": "btn btn-primary createCustomer") }}
		{% endif %}
    </li>
</ul>

{% for index,news in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
    <thead>
        <tr>
            <th>序号</th>
            <th>新闻类型</th>
			<th>新闻标题</th>
			<th>稿件上传人</th>
			<th>营业部</th>
            <th>上传时间</th>
			<th>状态</th>
			<th></th>
        </tr>
    </thead>
{% endif %}
    <tbody>
        <tr>
            <td style="vertical-align:middle;">{{ index+1+10*(page.current-1) }}</td>
            <td style="vertical-align:middle;">{{ news.newstype.name }}</td>
			<td style="vertical-align:middle;">{{ news.title }}</td>
            <td style="vertical-align:middle;">{{ news.users.name }}</td>
			 <td style="vertical-align:middle;">{{ news.users.department.name }}</td>
			<td style="vertical-align:middle;"><?php echo date("Y-m-d H:i:s",$news->time);?></td>				
			<td style="vertical-align:middle;">
				{% if news.status == 0%}
					<span class="label label-info">未审核</span>
				{% elseif news.status == 1%}
					<span class="label label-warning">审核中</span>
				{% elseif news.status == 2%}
					<span class="label label-success">发布中</span>
				{% else%}
					<span class="label label-important">未通过</span>
				{% endif %}
			</td>
            <td width="10%">
				{% if auth == 'editor' %}
				{{ link_to("news/verifydraft/" ~ news.id, '<i class="icon-pencil"></i> 审 核', "class": "btn") }}
				{% endif %}
				{% if auth == 'author' %}
				{{ link_to("news/editdraft/" ~ news.id, '<i class="icon-pencil"></i> 编 辑', "class": "btn") }}
				{% endif %}
			</td>
			{% if auth == 'author' %}
            <td width="10%">
				{{ link_to("news/deletedraft/" ~ news.id, '<i class="icon-remove"></i> 删 除', "class": "btn btn-danger") }}
			</td>
			{% endif %}
        </tr>
    </tbody>
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="9" align="right">
                <div class="btn-group">
                    {{ link_to("news/draft", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
                    {{ link_to("news/draft?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
                    {{ link_to("news/draft?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
                    {{ link_to("news/draft?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{% endif %}
{% else %}
    没有新闻初稿信息
{% endfor %}
