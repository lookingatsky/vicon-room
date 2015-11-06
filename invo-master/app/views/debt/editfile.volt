<?php use Phalcon\Tag as Tag ?>
<?php echo $this->getContent() ?>

<form method="post" action="{{ url("debt/upload") }}">

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("debt/detail/" ~ fid, "&larr; 返回") }}
    </li>
    <li class="pull-right">
        {{ submit_button("保存", "class": "btn btn-success") }}
    </li>
</ul>

<div class="center scaffold">
    <h2>编辑债权文件</h2>
	
	<?php echo Tag::hiddenField(array("fileid","type" => "str")) ?>
	
    <div class="clearfix">
        <label for="name">文件标题</label>
        <?php echo Tag::textField(array("title","type" => "str")) ?>
    </div>


</div>
</form>