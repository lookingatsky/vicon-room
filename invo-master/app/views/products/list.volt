<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>

<!--引入时间选择器-->

		
{{ stylesheet_link('css/bootstrap-datetimepicker.min.css') }}	
{{ stylesheet_link('css/bootstrap.min.css') }}

{{ javascript_include('js/jquery.min.js') }}	

{{ javascript_include('js/bootstrap.min.js') }}

{{ javascript_include('js/bootstrap-datetimepicker.js') }}	

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo(array("products", "&larr; 返 回")) ?>
    </li>
</ul>

<div class="showInfoFrame">
	<div></div>
	<div></div>
	<div></div>
	<div></div>
</div>

<?php echo Tag::form(array("products/list", "autocomplete" => "off","method"=>"post")) ?>
	<?php if($did == 0 ){?>
	<div class="clearfix" style="float:left;">
		<?php echo Tag::select(array("company[]", $departments, "using" => array("id", "name"), "useDummy" => true,"multiple" => "multiple","size"=>"10")) ?>
	</div>
	<?php }?>
	<div style="clear:both;"></div>
	<div style="float:left;width:300px;">
		<div class="input-group date form_date col-md-5" style="float:left;margin:20px 0;" data-date="{{ timeNow }}" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
			<input class="form-control" size="16" type="text" value="<?php if(isset($sTime) && $sTime != ''){ echo $sTime; } ?>" readonly>
			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		</div>

		<div class="input-group date form_date col-md-5" style="float:left;" data-date="{{ timeNow }}" data-date-format="yyyy MM dd" data-link-field="dtp_input3" data-link-format="yyyy-mm-dd">
			<input class="form-control" size="16" type="text" value="<?php if(isset($eTime) && $eTime != ''){ echo $eTime; } ?>" readonly>
			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		</div>
		
		<div style="float:left;margin:20px 0;">
			<?php echo Tag::submitButton(array("点击搜索", "class" => "btn btn-primary")) ?>
		</div>	
		
		<input type="hidden" id="dtp_input2" name="sTime" value="<?php if(isset($sTime) && $sTime != ''){ echo $sTime; } ?>" /><br/>
		<input type="hidden" id="dtp_input3" name="eTime" value="<?php if(isset($eTime) && $eTime != ''){ echo $eTime; } ?>" /><br/>

		<script>
			$('.form_date').datetimepicker({
				language:  'zh-CN',
				weekStart: 1,
				todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0
			});
			$(function(){
				var actions;
				
				$(".focusShowInfo").stop(true).hover(function(){
						var pLeft = $(this).offset().left;
						var pTop = $(this).offset().top;

						var priceHtml;
						if($(this).attr("inner") != ""){
							priceHtml = "金额：￥"+$(this).attr("inner");
						var timeHtml;
						if($(this).attr("time") != ""){
							timeHtml = "时间："+$(this).attr("time");
						}else{
							timeHtml = "时间：无";
						}							
						
						var remarkHtml;
						if($(this).attr("alt") != "（备注）"){
							remarkHtml = "备注："+$(this).attr("alt");
						}else{
							remarkHtml = "暂无备注";
						}						
						
						var registrarHtml;
						if($(this).attr("registrar") != ""){
							registrarHtml = "记录人："+$(this).attr("registrar");
						}else{
							registrarHtml = "记录人：无";
						}	

						
						actions = setTimeout(function(){
							$('.showInfoFrame').show();
							$('.showInfoFrame').css('top',pTop+40);
							$('.showInfoFrame').css('left',pLeft+40);
							
							$('.showInfoFrame').find('div').eq(0).html(priceHtml);
							$('.showInfoFrame').find('div').eq(1).html(timeHtml);							
							$('.showInfoFrame').find('div').eq(2).html(registrarHtml);
							$('.showInfoFrame').find('div').eq(3).html(remarkHtml);
						},1300);								
							
							
						}else{
							
						}	
									
				},function(){
					clearTimeout(actions);
					$('.showInfoFrame').hide();
				})
				
				$(".parent").click(function(){
					var childrenClass = $(this).attr("children");
					if($("."+childrenClass).css('display') == 'none'){
						$("."+childrenClass).show();
					}else{
						$("."+childrenClass).hide();
					}
				})
			})
		</script>	
	</div>
	<div style="clear:both;"></div>
</form>
<div style="clear:both;"></div>
<style>
.table th,
.table td{
	text-align:center;
}
.showInfoFrame{
	width:200px;
	min-height:100px;
	border:1px solid #428bca;
	background:#fff;
	position:absolute;
	z-index:999;
	border-radius:4px;
	display:none;
}
.showInfoFrame div:nth-child(1){
	width:80%;
	text-align:left;
	margin:10px auto 5px auto;
	line-height:25px;
}	
.showInfoFrame div:nth-child(2){
	width:80%;
	text-align:left;
	margin:5px auto;
	line-height:25px;
}	
.showInfoFrame div:nth-child(3){
	width:80%;
	text-align:left;
	margin:5px auto;
	line-height:25px;
}
.showInfoFrame div:nth-child(4){
	width:80%;
	text-align:left;
	margin:5px auto 15px auto;
	line-height:20px;
}		
</style>
<div style="min-height:500px;position:relative;width:5000px;">
	<table class="table table-bordered table-striped" align="center"  border="1" style="float:left;">
		<?php $listInfosArr = $listInfos->toArray();
		if(!empty($listInfosArr)){	
		?>
		<tr align="center">
				<td width="200"><b>营业部名称</b></td>
				<td width="200"><b>时间</b></td>
				<td width="230"><b>操作</b></td>
			<?php foreach($typeArr as $key=>$val){?>
				
			<?php foreach($val as $k=>$v){?>
				<td width="100" class="<?php  echo $key; ?>"  style="font-size:12px;display:none;"><?php echo $v['name']; ?></td>
			<?php }?>
				<td width="150" class="parent"  children="<?php  echo $key; ?>" ><b><?php echo $key; ?></b></td>
			<?php }?>
				<td width="150" width="100"><b>总计</b></td>			
		</tr>
		<?php $total = array();  ?>	
		<?php foreach($listInfos as $key=>$val){?>
		<?php $arr=json_decode($val->data,true); ?>
		<tr valign="middle">
			
				<td><?php echo $val->department->name;?></td>
				<td><?php echo date('Y年m月d日',$val->time); ?></td>
				<td>
					<?php echo Tag::linkTo(array("products/edit/".$val->id, '<i class="icon-pencil"></i> 编辑', "class" => "btn")) ?>
					<?php echo Tag::linkTo(array("products/delete/".$val->id, '<i class="icon-remove"></i> 删除', "class" => "btn")) ?>
				</td>
			<?php 
				$flagTotal = 0;
			foreach($typeArr as $key1=>$val1){
				$flag = 0; 
				$limit = 0;
			?>	
			
				<?php foreach($val1 as $k=>$v){?>
				
				<?php if(isset($total[$v['name']])  && $total[$v['name']] != ''){
						$total[$v['name']] = $total[$v['name']]+$arr['cost'][$v['name']];
					}else{
						if(isset($arr['cost'][$v['name']]) && $arr['cost'][$v['name']] != ''){
							$total[$v['name']] = $arr['cost'][$v['name']];
						}else{
							$total[$v['name']] = 0;
						}
						
					}
				?>
				
				<?php 
				if(isset($arr['cost'][$v['name']]) && $arr['cost'][$v['name']] != ''){
				$flag = $flag+$arr['cost'][$v['name']];
				$limit = $limit+$v['limit'];?>
				<td style="display:none;font-size:12px;" class="<?php  echo $key1; ?> focusShowInfo" alt="<?php if(isset($arr['remark'][$v['name']])){ echo $arr['remark'][$v['name']];}else{ echo "（备注）";}?>" style="font-size:12px;" registrar="<?php echo $val->registrar; ?>" inner="<?php echo $arr['cost'][$v['name']]; ?>" time="<?php echo date('Y年m月d日',$val->time); ?>">
						<?php 
							if($arr['cost'][$v['name']] > $v['limit']){
								echo '<span style="color:red;">'.$arr['cost'][$v['name']].'</span>';
							}else{
								if($arr['cost'][$v['name']] == ''){
									echo "暂无数据";
								}else{
									echo $arr['cost'][$v['name']];
								}
							}	
						?>	
				</td>
				<?php }else{
					echo "<td style='display:none;font-size:12px;' class='".$key1."'>暂无数据</td>";
				}}?>
				
				<td class="parent" children="<?php echo $key1;?>">
					<b>
					<?php if($flag>$limit){
						echo '<span style="color:red;">'.$flag.'</span>'; 
					}else{
						echo $flag; 
					}?>
					</b>
				</td>	
			<?php $flagTotal += $flag; }?>			
				<td class="">
					<b>
						<?php echo $flagTotal; ?>
					</b>
				</td>
		</tr>
		<?php }?>
		<tr align="center">
			<td>总计</td>
			<td><?php if(isset($sTime) && $sTime != ''){ echo $sTime; } ?>~<?php if(isset($eTime) && $eTime != ''){ echo $eTime; }else{ echo "至今";} ?></td>
			<td>无</td>
			
			
			<?php $flagTotal = 0;
			foreach($typeArr as $key1=>$val1){
				$flag = 0;
				$limit = 0;?>	
				<?php foreach($val1 as $k=>$v){?>
				<?php 
					if(isset($total[$v['name']]) && $total[$v['name']] != ''){
					$flag = $flag+$total[$v['name']];
					$limit = $limit+$v['limit'];
				?>								
						<td style="display:none;" class="<?php  echo $key1; ?>"><?php echo $total[$v['name']]; ?></td>
				<?php }else{ 
					echo "<td style='display:none;' class='".$key1."'>暂无数据</td>";
				}}?>
				<td class="parent" children="<?php echo $key1;?>"><b><?php echo $flag;?></b></td>
				
			<?php 
				$flagTotal += $flag;
			}
			?>		
				<td><b><?php echo $flagTotal;?></b></td>
		<tr>
		<?php
		}else{
			echo "暂无数据!";
		}
		?>
	</table>
	
<!-- 	<?php foreach($listInfos as $key=>$val){?>
		<div><?php echo $val->id;?><?php echo $val->department->name;?>
			<?php $arr=json_decode($val->data,true);  
				foreach($arr['cost'] as $k=>$v){
				echo $k.'++++'.$v.'<br />';
				}
			?>
		</div>
	<?php } ?> -->
</div>
