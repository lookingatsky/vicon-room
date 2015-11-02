<?php

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;
use Phalcon\Logger\Adapter\File as FileAdapter;	

class CustomerController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('客户信息');
        parent::initialize();
    }

    public function indexAction()
    {
		$numberPage = 1;
		$searchParams = array();
		if($this->request->isPost()){
			//$query = Criteria::fromInput($this->di, "Customer", $_POST);
			$keyword = trim($this->request->getPost("keyword","striptags"));
			
			if(isset($keyword) && $keyword != ''){
				
				if(strlen($keyword) == 18){
					$searchParams = array("number = '".$keyword."'");
				}else{
					$searchParams = array("name = '".$keyword."'");
				}
				//$this->persistent->searchParams = $query->getParams();
			}else{
				$this->flash->notice("请重新输入搜索条件");
			}
			
					
		}else{
			$numberPage = $this->request->getQuery("page", "int");
			if ($numberPage <= 0) {
				$numberPage = 1;
			}					
		}
		
		$parameters = array();
		if ($searchParams) {
			$parameters = $searchParams;
		}	
		
		$customer = Customer::find($parameters);
		if (count($customer) == 0) {
			$this->flash->notice("没有找到对应的客户");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $customer,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);
		//$this->view->setVar("customer", $customer);
	
    }
	
	public function detailAction($id)
	{
		$id = $this->filter->sanitize($id, array("int"));
		if($id){
			$searchParams = array();
			$searchParams = array("id = '".$id."'");
			
			$customer = Customer::findFirst($searchParams);
			$this->view->setVar("customer", $customer);
			
			$debts = Debts::find("cid = ".$id);
			if (count($customer) == 0) {
				$this->flash->notice("没有找到对应的债权信息");
			}
			
			$paginator = new Phalcon\Paginator\Adapter\Model(array(
				"data" => $debts,
				"limit" => 10,
				"page" => $numberPage
			));
			$page = $paginator->getPaginate();
			$this->view->page = $page;
			$cards = Cards::find("user = ".$id);
			$this->view->setVar("cards", $cards);
			$this->view->setVar("uid", $id);
			$account = Account::findFirst("cid = ".$id);
			if(isset($account->id)){
				$this->view->hasAccount = 1;
			}else{
				$this->view->hasAccount = 0;
			}
		}else{
			$this->flash->error("没有找到对应的客户");
			return $this->forward("customer/index");
		}	
	}
	
	public function newAction(){
		
	}
	
	public function editAction($id){
		if($id){
			$Customer = Customer::FindFirst("id = ".$id);
			Tag::setDefault("id",$Customer->id);
			Tag::setDefault("name",$Customer->name);
			Tag::setDefault("number",$Customer->number);
			Tag::setDefault("address",$Customer->address);
			Tag::setDefault("cellphone",$Customer->cellphone);
			Tag::setDefault("registered",$Customer->registered);
			$this->view->id = $id;
		}else{
			$this->flash->error('页面错误');	
			return $this->forward('customer/index');				
		}
	}
	
	public function saveeditAction(){
		if($this->request->isPost()) {
			$request = $this->request->getPost();
			$Customer = Customer::FindFirst("id = ".$request['id']);
			$Customer->name = $request['name'];
			$Customer->number = $request['number'];
			$Customer->address = $request['address'];
			$Customer->cellphone = $request['cellphone'];
			$Customer->registered = $request['registered'];
			if($Customer->save()){
				$this->response->redirect('customer/detail/'.$request['id']);
			}else{
				$this->flash->error("保存失败！");
				foreach ($Customer->getMessages() as $message) {
					$this->flash->error((string) $message);
				}	
				return $this->forward("customer/detail/".$request['id']);
			}			
		}else{
			$this->flash->error('页面错误');	
			return $this->forward('customer/index');
		}
	}
	
	public function saveAction(){
		$Customer = new Customer();
		$request = $this->request->getPost();
		
		$Customer->name = $request['name'];
		$Customer->number = $request['number'];
		$Customer->cellphone = $request['cellphone'];
		$Customer->address = $request['address'];
		$Customer->registered = $request['registered'];
		if($Customer->save()){
			$this->response->redirect('customer/index');
		}else{
			$this->flash->error("保存失败！");
            foreach ($Customer->getMessages() as $message) {
                $this->flash->error((string) $message);
            }	
			return $this->forward("customer/new");
		}	
	}
	
	public function accountAction($id){
		if($id){
			$searchParams = array();
			$searchParams = array("id = '".$id."'");
			
			$customer = Customer::findFirst($searchParams);
			$this->view->customer = $customer;
			$form = new RegisterForm;
			$this->view->form = $form;
			Tag::setDefault('cid', $id);
			Tag::setDefault('username', $customer->name);
		}else{
			$this->flash->error('页面错误');	
			return $this->forward('register/index');			
		}
	}
	
	public function sendemailAction(){
        if ($this->request->isPost()) {
			
            $email = $this->request->getPost('email', 'email');
			$cid = $this->request->getPost('cid');
			$username = $this->request->getPost('username');
			$webname = WEBNAME;
			if(isset($cid)){
				$time = time();		
				$emailContent = "亲爱的".$username."： \r\n";
				$emailContent .= "欢迎您来到中合万邦债权系统！ \r\n";
				$emailContent .= "请马上点击以下链接完成注册 \r\n";
				$emailContent .= $webname."/account/verify/".md5($time."+".$email)."\r\n";
				$emailContent .= "(如果该链接无法点击，请将它完成复制并粘贴至浏览器的地址栏中访问)\r\n\r\n\r\n";
				$emailContent .= "这是一封系统自动发出的邮件，请不要直接回复。\r\n";
				$emailContent .= "如有疑问可发送邮件至tech@zhwbchina.com。\r\n\r\n";
				$emailContent .= "中合万邦\r\n";
				$emailContent .= "http://www.zhwbchina.com";
				$mail = new Mail();
				$result = $mail->smtp($email,'请验证您的邮箱（自：中合万邦——债权系统）',$emailContent);
				//$result = true;
				$this->view->setVar("email", $email);
				
 				/*$results = VerifyEmail::Find("email = '".$email."'");
				foreach($results as $result){
					if($result->delete() == false){
						//存log
						foreach ($result->getMessages() as $message) {
							
						}
					}else{
						//存log
					}
				} */
				
				$verifyEmail = new VerifyEmail();
				$verifyEmail->email = $email;
				$verifyEmail->time = $time;
				$verifyEmail->verifyCode = md5($time."+".$email);	
				$verifyEmail->active = 'Y';
				$verifyEmail->cid = $cid;
				
				if ($verifyEmail->save() == false) {
					foreach ($user->getMessages() as $message) {
						$this->flash->error((string) $message);
					}						
				}else{
					if($result){	
						$arrRs = explode('@',$email);
						$mailLink = 'http://mail.'.$arrRs[1];
						$this->view->setVar("mailLink", $mailLink);
						$this->flash->success('邮件已发送至'.$username.'的邮箱，请查收！');
						
					}else{
						$this->flash->error('发送失败！');	
						return $this->forward('customer/account/'.$cid);
					} 				
				}				
			}else{
				
				
			}

        }else{
			$this->response->redirect("index/index");
		}		
	}
	
/* 	public function verifyAction($code){
		if($code){
			$results = VerifyEmail::FindFirst("verifyCode = '".$code."'");
		if(!isset($results->cid)){
			return $this->response->redirect("index/index");
		}
			$form = new RegisterForm;
			
			if(isset($results) && $results != ''){
				if($results->active == 'Y'){
					if(md5($results->time.'+'.$results->email) == $code){
						$this->view->form = $form;
						Tag::setDefault('password',null);
						Tag::setDefault('cid',$results->cid);
						Tag::setDefault('email',$results->email);
						$this->view->setVar("email", $results->email);
					}else{
						$this->flash->error('邮箱验证错误！');
						$this->response->redirect("register/index");					
					}					
				}else{
					$this->flash->error('邮箱已经验证通过，请登录！');
					$this->response->redirect("session/index");
				}
			}else{
				$this->flash->error('验证码已过期！');
				$this->response->redirect("index/index"); 
			}
		}else{
			$this->response->redirect("index/index");
		}		
	} */
	
/* 	public function registerAction(){
		if ($this->request->isPost()) {
			
			$request = $this->request->getPost();
			$password = $request['password'];
	        $repeatPassword = $request['repeatPassword'];
			$cid = $request['cid'];
			
			if ($password != $repeatPassword) {
                $this->flash->error('两次密码不一致');
                return false;
            }		
			$customer = Customer::findFirst("id = ".$cid);
			$hasVerified = VerifyEmail::find("email = '".$request['email']."'");
			foreach($hasVerified as $val){
				$val->active = "N";
				$val->save();					
			}

			
			$account = new Account();
			$account->username = $customer->name;
			$account->password = sha1($password);
			$account->email = $request['email'];
			$account->cellphone = $customer->cellphone;
			$account->created_at = new Phalcon\Db\RawValue('now()');
			$account->active = "Y";
			$account->cid = $cid;
			
			if ($account->save() == false) {
				$this->flash->error('保存失败');
				foreach ($account->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			} else {
                return $this->response->redirect('customer/detail/'.$cid);
			}			
			
		}
	} */
	
	public function uploadAction(){
		
	}
	

	
	public function uploadsaveAction(){
		fb(1111);
		$this->view->disable();
		if ($this->request->hasFiles() == true) {
			fb(222);
			foreach ($this->request->getUploadedFiles() as $file) {
				$getType = explode('.',$file->getName());
				
				$uploadFile = "tests.".$getType[count($getType)-1];
				
                $file->moveTo(APP_PATH.'/public/upload/'.$uploadFile);				
				//fb($getType);exit();
				
			}	
			fb(3333);
			//$path = $_FILES["file"]["tmp_name"];
			//将临时文件移动当前目录，可自定义存储位置
			 
			//move_uploaded_file($_FILES["file"]["tmp_name"],$_FILES["file"]["name"]);
			//将获取在服务器中的Excel文件，此处为上传文件名
			//$path = $_FILES["file"]["name"];
			$excel = new Excel();
			
			$excel->path = APP_PATH.'/public/upload/'.$uploadFile;
			$excel->type = '03';
			//调用readExcel函数返回一个二维数组
			fb(4444);
			$data = $excel->getData();	
			//fb($data);exit();
			fb($data);
			//保存客户信息和债权信息
			foreach($data as $key=>$val){
				if($key != 0){
					$ifExist = Customer::findFirst("number = '".$val[3]."'");
					if(!$ifExist){
						$customer = new Customer();
						$customer->name  = $val[2];
						$customer->number  = $val[3];
						$customer->cellphone  = $val[23];
						$customer->email  = $val[28];
						$customer->address  = $val[26];
						$customer->address_num  = $val[27];
						$customer->source  = $val[43];
						$customer->time = time();
						if($val[4] == "男"){
							$customer->sex = 1;
						}else{
							$customer->sex = 0;
						}
						
						if(!$customer->save()){
							$this->flash->error('保存失败');
							foreach ($customer->getMessages() as $message) {
								$this->flash->error((string) $message);
							}							
						}
					}
				}
			}
				
			//保存银行卡信息
			foreach($data as $key=>$val){
				if($key != 0){
					$customer = Customer::findFirst("number = '".$val[3]."'");
					$cards = Cards::findFirst("number = '".$val[19]."'");
					if(!$cards){
						$cards = new Cards();
						$cards->number  = $val[19];
						$cards->address  = $val[20];
						$cards->user  = $customer->id;
						$cards->name  = $val[18];
						if(!$cards->save()){
							$this->flash->error('保存失败');
							foreach ($cards->getMessages() as $message) {
								$this->flash->error((string) $message);
							}								
						}
					}
				}
			}			

			//保存债权信息
			foreach($data as $key=>$val){
				if($key != 0){
					$customer = Customer::findFirst("number = '".$val[3]."'");
					$debts = Debts::findFirst("number = '".$val[1]."'");
					if(!$debts){
						$debts = new Debts();
						$debts->number  = $val[1];
						$debts->type  = $val[10];
						$debts->assign_time  =  strtotime($val[6]);
						if($val[7] == '续签'){
							$debts->pay_time  = $val[7];
						}else{
							$debts->pay_time  = strtotime($val[7]);
						}
						
						$debts->invest_time  =  strtotime($val[8]);
						$debts->cost  = '0.00';
						$debts->cid  = $customer->id;
						$debts->total  = $val[11];
						$debts->if_received  = $val[24];
						$debts->r_address  = $val[26];
						$debts->r_num  = $val[27];
						$debts->email  = $val[28];
						$debts->mail_method  = $val[29];
						$debts->apply_store  = $val[30];
						$debts->mail_time  = $val[36];
						$debts->mail_num  = $val[37];
						$debts->department  = $val[38];
						$debts->account_manager  = $val[39];
						$debts->team_manager  = $val[40];
						$debts->d_manager  = $val[41];
						$debts->d_assistant  = $val[42];
						$debts->if_match  = $val[44];
						$debts->return_day  = $val[46];
						$debts->if_invest  = $val[45];
						$debts->contract_num  = $val[5];
						$debts->card_name  = $val[18];
						$debts->card_address  = $val[20];
						$debts->card_num  = $val[19];
						$debts->pay_method  = $val[21];
						$debts->pos_num  = $val[22];
						$debts->contact_phone  = $val[23];
						if(!$debts->save()){
							$this->flash->error('保存失败');
							foreach ($debts->getMessages() as $message) {
								$this->flash->error((string) $message);
							}							
						}
					}
				}
			}				
			//创建一个读取excel函数
			
		
		/* 	$result = 1;
			$uploadfile = 'D:/viconhouse/vicon-room/invo-master/public/upload/test.xlsx';
			
			if (!file_exists($uploadfile)) {
				exit("文件不存在");
			}
			
		   if($result) //如果上传文件成功，就执行导入excel操作
			{
				include "/upload/PHPExcel.php";
				//include "/upload/PHPExcel/Reader/Excel2007.php";
				include "/upload/PHPExcel/IOFactory.php";
				
				$objReader = PHPExcel_IOFactory::createReader('Excel5');//use excel2007 for 2007 format 
				$objPHPExcel = $objReader->load($uploadfile); 
				$sheet = $objPHPExcel->getSheet(0); 
				$highestRow = $sheet->getHighestRow();           //取得总行数 
				$highestColumn = $sheet->getHighestColumn(); //取得总列数
				
				fb(111);exit();


				// 第二种方法
				$objWorksheet = $objPHPExcel->getActiveSheet();
				$highestRow = $objWorksheet->getHighestRow(); 
				echo 'highestRow='.$highestRow;
				echo "<br>";
				$highestColumn = $objWorksheet->getHighestColumn();
				$highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);//总列数
				echo 'highestColumnIndex='.$highestColumnIndex;
				echo "<br>";
				$headtitle=array(); 
				for ($row = 1;$row <= $highestRow;$row++) 
				{
					$strs=array();
					//注意highestColumnIndex的列数索引从0开始
					for ($col = 0;$col < $highestColumnIndex;$col++)
					{
						$strs[$col] =$objWorksheet->getCellByColumnAndRow($col, $row)->getValue();
					}    
					$sql = "INSERT INTO te(`1`, `2`, `3`, `4`, `5`) VALUES (
					'{$strs[0]}',
					'{$strs[1]}',
					'{$strs[2]}',
					'{$strs[3]}',
					'{$strs[4]}')";
					//die($sql);
					if(!mysql_query($sql))
					{
						return false;
						echo 'sql语句有误';
					}
				} */
				
				/* 第一种方法

				//循环读取excel文件,读取一条,插入一条
				for($j=1;$j<=$highestRow;$j++)                        //从第一行开始读取数据
				{ 
					for($k='A';$k<=$highestColumn;$k++)            //从A列读取数据
					{ 
						//
						这种方法简单，但有不妥，以'\\'合并为数组，再分割\\为字段值插入到数据库
						实测在excel中，如果某单元格的值包含了\\导入的数据会为空        
						//
						$str .=$objPHPExcel->getActiveSheet()->getCell("$k$j")->getValue().'\\';//读取单元格
					} 
					//echo $str; die();
					//explode:函数把字符串分割为数组。
					$strs = explode("\\",$str);
					$sql = "INSERT INTO te(`1`, `2`, `3`, `4`, `5`) VALUES (
					'{$strs[0]}',
					'{$strs[1]}',
					'{$strs[2]}',
					'{$strs[3]}',
					'{$strs[4]}')";
					//die($sql);
					if(!mysql_query($sql))
					{
						return false;
						echo 'sql语句有误';
					}
					$str = "";
				}  
				unlink($uploadfile); //删除上传的excel文件
				$msg = "导入成功！";
							
				}*/	
            
		}	
	}

	
	
	public function addcardAction(){
		$this->view->disable();
		$user = $this->request->getPost('uid');
		$number = $this->request->getPost('number');		
		$name = $this->request->getPost('name');		
		$address = $this->request->getPost('address');		
		$cards = new Cards();
		$cards->user = $user;
		$cards->number = $number;
		$cards->name = $name;
		$cards->address = $address;
		if($cards->save() == false){
			echo false;
		}else{
			echo true;			
		}
	}
	
	public function deletecardAction(){
		$this->view->disable();
		$id = $this->request->getPost('id');
		$cards = Cards::findFirst("id = '".$id."'");
		if($cards->delete() == false){
			echo false;
		}else{
			echo true;			
		}
	}	
}
