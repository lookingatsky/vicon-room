<?php use Phalcon\Tag as Tag ?>

<!--引入富文本编辑器-->
{{ stylesheet_link('css/simditor/simditor.css') }}

{{ javascript_include('js/simditor/jquery.min.js') }}
{{ javascript_include('js/simditor/module.js') }}
{{ javascript_include('js/simditor/uploader.js') }}
		
{{ javascript_include('js/simditor/hotkeys.js') }}	
{{ javascript_include('js/simditor/simditor.js') }}



<?php echo Tag::form(array("news/verifysave", "autocomplete" => "off","enctype"=>"multipart/form-data")) ?>
<script>
$(function(){
	var toolbar = [ 'title', 'bold', 'italic', 'underline', 'strikethrough', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 'hr', '|', 'indent', 'outdent' ];    
	var editor = new Simditor({
		textarea: $('#content'),
		placeholder:'这里输入内容',
		toolbarFloat:false,
		toolbar:toolbar,
		defaultImage:'/../../img/test.jpg', //编辑器插入图片时使用的默认图片
        upload:{  
            url : '/news/upload', //文件上传的接口地址  
            params: null, //键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交  
			fileKey: 'fileDataFileName', //服务器端获取文件数据的参数名  
            connectionCount: 3,  
            leaveConfirm: '正在上传文件'
        }
		
		
	});
});	
</script>


<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("news/draft", "&larr; 返回") ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("提 交", "class" => "btn btn-success")) ?>
    </li>
</ul>

<style>
.clear{
	clear:both;
}
.container{
	width:1320px;
}
</style>

<div class="left scaffold pull-left" style="width:690px;margin-right:30px;">

	<?php echo Tag::HiddenField(array("draftid")) ?>
	
    <h3>新闻审核</h3>
	<hr />
    <div class="clearfix">
        <label for="typeid">新闻类型</label>
        <?php echo Tag::select(array("typeid", $Newstype, "using" => array("id", "name"), "useDummy" => true)) ?>
    </div>
	
    <div class="clearfix">
        <label for="typeid">缩略图</label>
        <?php echo Tag::fileField(array("thumb")) ?>
    </div>
	
    <div class="clearfix">
        <label for="title">标 题</label>
        <?php echo Tag::textField(array("title", "size" => 24, "maxlength" => 70)) ?>
    </div>
    <div class="clearfix">
        <label for="description">摘 要</label>
        <?php echo Tag::textArea(array("description", "size" => 24, "maxlength" => 270)) ?>
    </div>
    <div class="clearfix">
        <label for="content" >内 容</label>
		<?php echo Tag::textArea(array("content", "size" => 24, "maxlength" => 270)) ?>
    </div>
</div>
<div class="pull-left scaffold left" style="width:600px;">
	<div style="text-align:left;">
		<h3>修改状态</h3>
		<hr />
		
		<div><b>状态</b>&nbsp;&nbsp;<?php echo Tag::selectStatic("status", array("1" => "审核中", "0" => "未审核", "2" => "发布中", "3" => "未通过")) ?></div>	
		<p style="color:red;">(若想保存为新闻必须选择"发布中")</p>
		<div><b>备注</b>&nbsp;&nbsp;<?php echo Tag::textArea(array("remark","type" => "number")) ?></div>
	</div>
	<hr />	
	<h3>审核记录</h3>
	<hr />
	{% if remark is defined %}
	<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
		<thead>
			<tr>
				<th>序号</th>
				<th>处理人</th>
				<th>时间</th>
				<th>操作</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
			{% for detail in remark %}
			<tr>
				<td><?php echo $detail['id'];?></td>
				<td><?php echo $detail['name'];?></td>
				<td><?php echo date('Y年m月d日 H:i:s',$detail['time']);?></td>
				<td><?php echo $detail['operate'];?></td>
				<td><?php echo $detail['remark'];?></td>
			</tr>
			{% endfor %}
		</tbody>	
	</table>
	{% else %}
	暂无审核记录
	{% endif %}

</div>
<div class="clear"></div>
</form>
