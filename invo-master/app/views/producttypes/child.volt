<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo("producttypes/search", "&larr; 返 回") ?>
    </li>
    <li class="pull-right">	
        <?php echo Tag::linkTo(array("producttypes/newtypes/".$id, "创建新的下级类型", "class" => "btn btn-primary")) ?>
    </li>
</ul>

<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
    <thead>
        <tr>
            <th>序号</th>
            <th>上级类型</th>
			<th>名称</th>
			<th>限额</th>
			<th>备注</th>
			<th></th>
        </tr>
    </thead>
    <tbody>
    <?php
        if(isset($page->items)){
            foreach($page->items as $productType){ ?>
        <tr>
            <td width="80"><?php echo $productType->id ?></td>
			<td width="10%"><?php echo $productType->type->name ?></td>
            <td width="10%"><?php echo $productType->name ?></td>
			<td width="10%"><?php echo $productType->limit ?></td>
            <td><?php echo $productType->remark ?></td>
            <td width="15%">
				<?php echo Tag::linkTo(array("producttypes/edittypes/".$productType->id, '<i class="icon-pencil"></i> 编辑', "class" => "btn")) ?>
				<?php echo Tag::linkTo(array("producttypes/deletetypes/".$productType->id, '<i class="icon-remove"></i> 删除', "class" => "btn")) ?>
			</td>
        </tr>
    <?php }
        } ?>
    </tbody>
    <tbody>
        <tr>
            <td colspan="6" align="right">
                <div class="btn-group">
                    <?php echo Tag::linkTo(array("producttypes/child/".$id, '<i class="icon-fast-backward"></i> 首页', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("producttypes/child/".$id."?page=".$page->before, '<i class="icon-step-backward"></i> 上一页', "class" => "btn ")) ?>
                    <?php echo Tag::linkTo(array("producttypes/child/".$id."?page=".$page->next, '<i class="icon-step-forward"></i> 下一页', "class" => "btn")) ?>
                    <?php echo Tag::linkTo(array("producttypes/child/".$id."?page=".$page->last, '<i class="icon-fast-forward"></i> 尾页', "class" => "btn")) ?>
                    <span class="help-inline" style="line-height:35px;"><?php echo $page->current, "/", $page->total_pages ?></span>
                </div>
            </td>
        </tr>
    <tbody>
</table>