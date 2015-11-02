<?php

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;
use Phalcon\Logger\Adapter\File as FileAdapter;	

class BorrowerController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('借款人信息');
        parent::initialize();
    }

    public function indexAction()
    {
		$numberPage = 1;
		$searchParams = array();
		if($this->request->isPost()){
			$keyword = trim($this->request->getPost("keyword","striptags"));
			
			if(isset($keyword) && $keyword != ''){
				
				if(strlen($keyword) == 18){
					$searchParams = array("number = '".$keyword."'");
				}else{
					$searchParams = array("name = '".$keyword."'");
				}
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
		
		$customer = Borrower::find($parameters);
		if (count($customer) == 0) {
			$this->flash->notice("没有找到对应的借款人");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $customer,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);
	
    }
	
	public function detailAction($id)
	{
		$id = $this->filter->sanitize($id, array("int"));
		if($id){
			$searchParams = array();
			$searchParams = array("id = '".$id."'");
			$borrower = Borrower::findFirst($searchParams);
			$this->view->setVar("borrower", $borrower);
			$loan = loan::find("bid = ".$id);
			if (count($borrower) == 0) {
				$this->flash->notice("没有找到对应的债权信息");
			}
			
			$paginator = new Phalcon\Paginator\Adapter\Model(array(
				"data" => $loan,
				"limit" => 10,
				"page" => $numberPage
			));
			$page = $paginator->getPaginate();
			$this->view->page = $page;
			$cards = Bcards::find("user = ".$id);
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
			$borrower = Borrower::FindFirst("id = ".$id);
			Tag::setDefault("id",$borrower->id);
			Tag::setDefault("name",$borrower->name);
			Tag::setDefault("number",$borrower->number);
			Tag::setDefault("address",$borrower->address);
			Tag::setDefault("cellphone",$borrower->cellphone);
			Tag::setDefault("registered",$borrower->registered);
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
	
	public function uploadAction(){
		
	}
	

	
	public function uploadsaveAction(){
		$this->view->disable();
		if ($this->request->hasFiles() == true) {
			foreach ($this->request->getUploadedFiles() as $file) {
				$getType = explode('.',$file->getName());
				
				$uploadFile = "tests.".$getType[count($getType)-1];
				
                $file->moveTo(APP_PATH.'/public/upload/'.$uploadFile);				
				//fb($getType);exit();
				
			}	
			//$path = $_FILES["file"]["tmp_name"];
			//将临时文件移动当前目录，可自定义存储位置
			 
			//move_uploaded_file($_FILES["file"]["tmp_name"],$_FILES["file"]["name"]);
			//将获取在服务器中的Excel文件，此处为上传文件名
			//$path = $_FILES["file"]["name"];
			$excel = new Excel();
			
			$excel->path = APP_PATH.'/public/upload/'.$uploadFile;
			$excel->type = '03';
			//调用readExcel函数返回一个二维数组
			
			$data = $excel->getData();	
			
			
			//保存借款人信息和债权信息
			foreach($data as $key=>$val){
				if($key != 0){
					$ifExist = Borrower::findFirst("number = '".$val[4]."'");
					if(!$ifExist){
						$borrower = new Borrower();
						$borrower->name  = $val[3];
						$borrower->number  = $val[4];
						$borrower->cellphone  = $val[5];
						$borrower->address  = $val[6];
						$borrower->registered  = $val[7];
						$borrower->time = time();
						if($val[4] != "" && strlen($val[4]) == 18){
							$sexnum = (int)substr($val[4],16,1);
							if($sexnum%2 == 1){
								$borrower->sex = 1;
							}else{
								$borrower->sex = 0;
							}
						}
						if(!$borrower->save()){
						
						}
					}
				}
			}
			
				
			//保存银行卡信息
			foreach($data as $key=>$val){
				if($key != 0){
					if($val[17] == ""){
						
					}else{
						$borrower = Borrower::findFirst("number = '".$val[4]."'");
						$bcards = Bcards::findFirst("number = '".$val[17]."'");
						if(!$bcards){
							$bcards = new Bcards();
							$bcards->number  = $val[17];
							$bcards->address  = $val[18];
							$bcards->bid = $borrower->id;
							$bcards->name  = $val[16];
							if(!$bcards->save()){
								$this->flash->error("保存失败！");
								foreach ($bcards->getMessages() as $message) {
									$this->flash->error((string) $message);
								}								
							}
						}
					}
				}
			}			
			
			
			//保存债权信息
			foreach($data as $key=>$val){
				if($key != 0){
					$borrower = Borrower::findFirst("number = '".$val[4]."'");
					$loan = Loan::findFirst("number = '".$val[1]."'");
					if(!$loan){
						$loan = new Loan();
						$loan->number  = $val[1];
						$loan->name  = $val[3];
						$loan->type  =  $val[9];
						$loan->department  = $val[2];
						$loan->purpose  = $val[10];
						$loan->cycle  = $val[8];
						$loan->month_rate  = $val[11];
						$loan->service_rate  = $val[12];
						$loan->allowed_money  = $val[13];
						$loan->visit_money  = $val[14];
						$loan->fast_money  = $val[15];
						$loan->account_manager  = $val[19];
						$loan->team_manager  = $val[20];
						$loan->d_manager  = $val[21];
						$loan->assign_time  = $val[32];
						$loan->loan_status  = $val[31];
						$loan->verify_time  = $val[36];
						$loan->has_repay  = $val[54];
						$loan->remark  = $val[60];
						$loan->bid  = $borrower->id;
						$loan->card_name  = $val[16];
						$loan->card_address  = $val[18];
						$loan->card_num  = $val[17];
						if(!$loan->save()){
							
						}
					}
				}
			}

				
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
