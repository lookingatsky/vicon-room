<?php
/**
 * Security
 *
 * This is the security plugin which controls that users only have access to the modules they're assigned to
 */
//引入PHPExcel类库
include APP_PATH.'/public/upload/PHPExcel.php'; 
include APP_PATH.'/public/upload/PHPExcel/IOFactory.php';

class Excel
{
	public $type;
	public $path;

	public function getData()
	{	
		if($this->type == '07'){
			$type = 'Excel2007';
		}else{
			$type = 'Excel5';
			//设置为Excel5代表支持2003或以下版本，Excel2007代表2007版
		}	
		
		$xlsReader = PHPExcel_IOFactory::createReader($type);  
		$xlsReader->setReadDataOnly(true);
		$xlsReader->setLoadSheetsOnly(true);
		$Sheets = $xlsReader->load($this->path);
		//开始读取上传到服务器中的Excel文件，返回一个二维数组
				
		$dataArray = $Sheets->getSheet(0)->toArray();
		return $dataArray;	
	}




}
