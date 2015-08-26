
{{ content() }}

<div align="right">
    {{ link_to("companies/new", "创建部门", "class": "btn btn-primary") }}
</div>

<form method="post" action="{{ url("companies/search") }}">

<div class="center scaffold">

    <h2>搜索部门</h2>

    <div class="clearfix">
        <label for="id">序号</label>
        {{ form.render("id") }}
    </div>

    <div class="clearfix">
        <label for="name">名称</label>
        {{ form.render("name") }}
    </div>

    <div class="clearfix">
        <label for="city">城市</label>
        {{ form.render("city") }}
    </div>
	
    <div class="clearfix">
        <label for="telephone">电话</label>
        {{ form.render("telephone") }}
    </div>

    <div class="clearfix">
        <label for="address">地址</label>
        {{ form.render("address") }}
    </div>

    <div class="clearfix">
        <label for="contacts">联系人</label>
        {{ form.render("contacts") }}
    </div>

    <div class="clearfix">
        {{ submit_button("点击搜索", "class": "btn btn-primary") }}
    </div>

</div>

</form>
