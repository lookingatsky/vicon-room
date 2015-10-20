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
