<?php use Phalcon\Tag as Tag ?>
<?php echo $this->getContent() ?>

<form method="post" action="{{ url("debt/uploadmatchsave") }}" enctype="multipart/form-data">

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("debt/index", "&larr; 返回") }}
    </li>
    <li class="pull-right">
        {{ submit_button("保存", "class": "btn btn-success") }}
    </li>
</ul>

<div class="center scaffold">
    <h2>上传债权匹配列表</h2>
    <div class="clearfix">
        <?php echo Tag::fileField(array("file","type" => "str")) ?>
    </div>

</div>
</form>