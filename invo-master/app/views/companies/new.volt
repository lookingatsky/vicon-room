
<form method="post" action="{{ url("companies/create") }}">

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("companies/search", "&larr; 返回") }}
    </li>
    <li class="pull-right">
        {{ submit_button("保存", "class": "btn btn-success") }}
    </li>
</ul>

{{ content() }}

<div class="center scaffold">
    <h2>创建部门</h2>

    <div class="clearfix">
        <label for="name">名称</label>
        {{ form.render("name") }}
    </div>

    <div class="clearfix">
        <label for="telephone">电话</label>
        {{ form.render("telephone") }}
    </div>
	
    <div class="clearfix">
        <label for="city">城市</label>
        {{ form.render("city") }}
    </div>
	
    <div class="clearfix">
        <label for="address">地址</label>
        {{ form.render("address") }}
    </div>

    <div class="clearfix">
        <label for="contacts">联系人</label>
        {{ form.render("contacts") }}
    </div>

</div>
</form>
