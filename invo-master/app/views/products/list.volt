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
<!-- {{ javascript_include('js/highcharts.js') }}
{{ javascript_include('js/exporting.js') }}
{{ javascript_include('js/data.js') }}
<script>
$(function(){
	Highcharts.setOptions({
		lang:{
		   contextButtonTitle:"图表导出菜单",
		   decimalPoint:".",
		   downloadJPEG:"下载JPEG图片",
		   downloadPDF:"下载PDF文件",
		   downloadPNG:"下载PNG文件",
		   downloadSVG:"下载SVG文件",
		   drillUpText:"返回 {series.name}",
		   loading:"加载中",
		   months:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
		   noData:"没有数据",
		   numericSymbols: [ "千" , "兆" , "G" , "T" , "P" , "E"],
		   printChart:"打印图表",
		   resetZoom:"恢复缩放",
		   resetZoomTitle:"恢复图表",
		   shortMonths: [ "1月" , "2月" , "3月" , "4月" , "5月" , "6月" , "7月" , "8月" , "9月" , "10月" , "11月" , "12月"],
		   thousandsSep:",",
		   weekdays: ["星期一", "星期二", "星期三", "星期三", "星期四", "星期五", "星期六","星期天"]
		}
	}); 	
	$('#highchartsFrame').highcharts({
    
        chart: {                                                          
        },                                                                
        title: {                                                          
            text: 'Combination chart'                                     
        },                                                                
        xAxis: {                                                          
            categories: ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
        },                                                                
        tooltip: {                                                        
            formatter: function() {                                       
                var s;                                                    
                if (this.point.name) { // the pie chart                   
                    s = ''+                                               
                        this.point.name +': '+ this.y +' fruits';         
                } else {                                                  
                    s = ''+                                               
                        this.x  +': '+ this.y;                            
                }                                                         
                return s;                                                 
            }                                                             
        },                                                                
        labels: {                                                         
            items: [{                                                     
                html: 'Total fruit consumption',                          
                style: {                                                  
                    left: '40px',                                         
                    top: '8px',                                           
                    color: 'black'                                        
                }                                                         
            }]                                                            
        },                                                                
        series: [{                                                        
            type: 'column',                                               
            name: 'Jane',                                                 
            data: [3, 2, 1, 3, 4]                                         
        }, {                                                              
            type: 'column',                                               
            name: 'John',                                                 
            data: [2, 3, 5, 7, 6]                                         
        }, {                                                              
            type: 'column',                                               
            name: 'Joe',                                                  
            data: [4, 3, 3, 9, 0]                                         
        }, {                                                              
            type: 'spline',                                               
            name: 'Average',                                              
            data: [3, 2.67, 3, 6.33, 3.33],                               
            marker: {                                                     
            	lineWidth: 2,                                               
            	lineColor: Highcharts.getOptions().colors[3],               
            	fillColor: 'white'                                          
            }                                                             
        }, {                                                              
            type: 'pie',                                                  
            name: 'Total consumption',                                    
            data: [{                                                      
                name: 'Jane',                                             
                y: 13,                                                    
                color: Highcharts.getOptions().colors[0] // Jane's color  
            }, {                                                          
                name: 'John',                                             
                y: 23,                                                    
                color: Highcharts.getOptions().colors[1] // John's color  
            }, {                                                          
                name: 'Joe',                                              
                y: 19,                                                    
                color: Highcharts.getOptions().colors[2] // Joe's color   
            }],                                                           
            center: [100, 80],                                            
            size: 100,                                                    
            showInLegend: false,                                          
            dataLabels: {                                                 
                enabled: false                                            
            }                                                             
        }]   	
	})
}) 
</script>
<div id="highchartsFrame" style="height:500px;width:100%;"></div> -->


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
				<td width="150" class="parent"  children="<?php  echo $key; ?>" ><b><?php echo $key; ?></b></td>
			<?php foreach($val as $k=>$v){?>
				<td width="100" class="<?php  echo $key; ?>"  style="font-size:12px;display:none;"><?php echo $v['name']; ?></td>
			<?php }?>
				
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
				$limit = $limit+$arr['limit'][$v['name']];
				if(isset($arr['cost'][$v['name']]) && $arr['cost'][$v['name']] != ''){
				$flag = $flag+$arr['cost'][$v['name']];
				}} 
				?>
				<td style="background:#ccc;" class="parent" children="<?php echo $key1;?>">
					<b>
					<?php if($flag>$limit){
						echo '<span style="color:red;">'.$flag.'</span>'; 
					}else{
						echo $flag.'<br/>(余额'.($limit-$flag).')'; 
					}?>
					</b>
				</td>					
				<?php
				foreach($val1 as $k=>$v){
				if(isset($arr['cost'][$v['name']]) && $arr['cost'][$v['name']] != ''){
				?>
				<td style="display:none;font-size:12px;" class="<?php  echo $key1; ?> focusShowInfo" alt="<?php if(isset($arr['remark'][$v['name']])){ echo $arr['remark'][$v['name']];}else{ echo "（备注）";}?>" style="font-size:12px;" registrar="<?php echo $val->registrar; ?>" inner="<?php echo $arr['cost'][$v['name']]; ?>" time="<?php echo date('Y年m月d日',$val->time); ?>">
						<?php 
							if($arr['cost'][$v['name']] > $arr['limit'][$v['name']]){
								echo '<span style="color:red;">'.$arr['cost'][$v['name']].'</span>';
							}else{
								if($arr['cost'][$v['name']] == ''){
									echo "暂无数据";
								}else{
									echo $arr['cost'][$v['name']].'<br/>(余额'.($arr['limit'][$v['name']] - $arr['cost'][$v['name']]).')';
								}
							}	
						?>	
				</td>
				<?php }else{
					echo "<td style='display:none;font-size:12px;' class='".$key1."'>暂无数据</td>";
				}}?>
				
				

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
				}}?>
				<td style="background:#ccc;" class="parent" children="<?php echo $key1;?>"><b><?php echo $flag;?></b></td>
				<?php foreach($val1 as $k=>$v){?>
				<?php 
					if(isset($total[$v['name']]) && $total[$v['name']] != ''){
				?>								
						<td style="display:none;" class="<?php  echo $key1; ?>"><?php echo $total[$v['name']]; ?></td>
				<?php }else{ 
					echo "<td style='display:none;' class='".$key1."'>暂无数据</td>";
				}}?>				
				
				
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
