<?php

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;

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
			$this->flash->notice("没有找到对应的合同");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $customer,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);
		$this->view->setVar("customer", $customer);		
    }
	
	public function detailAction($id)
	{
		$id = $this->filter->sanitize($id, array("int"));
		
		if($id){
			$searchParams = array();
			$searchParams = array("id = '".$id."'");
			
			$customer = Customer::findFirst($searchParams);
			$this->view->setVar("customer", $customer);
			
			$cards = Cards::find("user = '".$id."'");
			$this->view->setVar("cards", $cards);
			$this->view->setVar("uid", $id);
		}else{
			$this->flash->error("没有找到对应的客户");
			return $this->forward("customer/index");
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
