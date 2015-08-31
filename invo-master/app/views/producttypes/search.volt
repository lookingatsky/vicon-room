<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("producttypes/index", "&larr; 返 回") ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::linkTo(array("producttypes/new", "创建新类型", "class" => "btn btn-primary")) ?>
    </li>
</ul>

<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
    <thead>
        <tr>
            <th>序号</th>
            <th>名称</th>
        </tr>
    </thead>
    <tbody>
    <?php
        if(isset($page->items)){
            foreach($page->items as $productType){ ?>
        <tr>
            <td width="80"><?php echo $productType->id ?></td>
            <td><?php echo $productType->name ?></td>
			<td width="12%"><?php echo Tag::linkTo(array("producttypes/child/".$productType->id, '<i class="icon-list"></i> 下级列表', "class" => "btn")) ?></td></td>
            <td width="10%"><?php echo Tag::linkTo(array("producttypes/edit/".$productType->id, '<i class="icon-pencil"></i> 编辑', "class" => "btn")) ?></td>
            <td width="10%"><?php echo Tag::linkTo(array("producttypes/delete/".$productType->id, '<i class="icon-remove"></i> 删除', "class" => "btn")) ?></td>
        </tr>
    <?php }
        } ?>
    </tbody>
    <tbody>
        <tr>
            <td colspan="5" align="right">
                <div class="btn-group">
                    <?php echo Tag::linkTo(array("producttypes/search", '<i class="icon-fast-backward"></i> 首页', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("producttypes/search?page=".$page->before, '<i class="icon-step-backward"></i> 上一页', "class" => "btn ")) ?>
                    <?php echo Tag::linkTo(array("producttypes/search?page=".$page->next, '<i class="icon-step-forward"></i> 下一页', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("producttypes/search?page=".$page->last, '<i class="icon-fast-forward"></i> 尾页', "class" => "btn")) ?>
                    <span class="help-inline" style="line-height:35px;"><?php echo $page->current, "/", $page->total_pages ?></span>
                </div>
            </td>
        </tr>
    <tbody>
</table>