<?php

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;

class CompaniesController extends ControllerBase
{
	public function initialize()
	{
		$this->view->setTemplateAfter('main');
		Tag::setTitle('部门管理');
		parent::initialize();
	}

	protected function getForm($entity=null, $edit=false)
	{
		$form = new Form($entity);

		if (!$edit) {
			$form->add(new Text("id", array(
				"size" => 10,
				"maxlength" => 10,
			)));
		} else {
			$form->add(new Hidden("id"));
		}

		$form->add(new Text("name", array(
			"size" => 24,
			"maxlength" => 50
		)));

		$form->add(new Text("telephone", array(
			"size" => 10,
			"maxlength" => 50
		)));
		
		$form->add(new Text("city", array(
			"size" => 14,
			"maxlength" => 250		
		)));
		
		$form->add(new Textarea("address", array(
			"cols" => 14,
			"rows" => 5,
			"maxlength" => 50
		)));

		$form->add(new Text("contacts", array(
			"size" => 14,
			"maxlength" => 50
		)));

		return $form;
	}

	public function indexAction()
	{
		$this->session->conditions = null;
		$this->view->form = $this->getForm();
	}

	public function searchAction()
	{
		$numberPage = 1;
		
		if ($this->request->isPost()) {
			$query = Criteria::fromInput($this->di, "Companies", $_POST);
			$this->persistent->searchParams = $query->getParams();
		} else {
			$numberPage = $this->request->getQuery("page", "int");
			if ($numberPage <= 0) {
				$numberPage = 1;
			}
		}
		
		$parameters = array();
		if ($this->persistent->searchParams) {
			$parameters = $this->persistent->searchParams;
		}

		$companies = Department::find($parameters);
		if (count($companies) == 0) {
			$this->flash->notice("没有找到对应的部门");
			return $this->forward("companies/index");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $companies,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);
		$this->view->setVar("companies", $companies);
	}

	public function newAction()
	{
		$this->view->form = $this->getForm();
	}

	public function editAction($id)
	{
		$request = $this->request;
		if (!$request->isPost()) {

			$company = Department::findFirstById($id);
			if (!$company) {
				$this->flash->error("没有找到对应的部门");
				return $this->forward("companies/index");
			}

			$this->view->form = $this->getForm($company, true);
		}
	}

	public function createAction()
	{
		if (!$this->request->isPost()) {
			return $this->forward("companies/index");
		}

		$companies = new Department();
		$companies->name = $this->request->getPost("name", "striptags");
		if($companies->name == ''){
			$this->flash->error("名称不能为空");
			return $this->forward("companies/new");
		}else{
			$companies->telephone = $this->request->getPost("telephone", "striptags");
			$companies->city = $this->request->getPost("city", "striptags");
			$companies->address = $this->request->getPost("address", "striptags");
			$companies->contacts = $this->request->getPost("contacts", "striptags");

			if (!$companies->save()) {
				foreach ($companies->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
				return $this->forward("companies/new");
			}
			
			/* 
			$this->flash->success("部门信息保存成功");
			return $this->forward("companies/search"); */
			$this->response->redirect("companies/search");			
			
		}
	}

	public function saveAction()
	{
		if (!$this->request->isPost()) {
			return $this->forward("companies/index");
		}

		$id = $this->request->getPost("id", "int");

		$companies = Department::findFirstById($id);
		if ($companies == false) {
			$this->flash->error("没有找到对应的部门".$id);
			return $this->forward("companies/index");
		}

		$companies->id = $this->request->getPost("id", "int");
		$companies->name = $this->request->getPost("name", "striptags");
		$companies->telephone = $this->request->getPost("telephone", "striptags");
		$companies->city = $this->request->getPost("city", "striptags");
		$companies->address = $this->request->getPost("address", "striptags");
		$companies->contacts = $this->request->getPost("contacts", "striptags");

		if (!$companies->save()) {
			foreach ($companies->getMessages() as $message) {
				$this->flash->error((string) $message);
			}
			return $this->forward("companies/edit/".$companies->id);
		}
		
		/* 
		$this->flash->success("部门信息更新成功");
		$this->forward("companies/search"); */
		$this->response->redirect("companies/search");
	}

	public function deleteAction($id)
	{

		$companies = Department::findFirstById($id);
		if (!$companies) {
			$this->flash->error("没有找到对应部门");
			return $this->forward("companies/index");
		}

		if (!$companies->delete()) {
			foreach ($companies->getMessages() as $message) {
				$this->flash->error((string) $message);
			}
			return $this->forward("companies/search");
		}
		
		/*
		$this->flash->success("部门已删除");
		return $this->forward("companies/index");
		*/
		$this->response->redirect("companies/search");
	}
	
	public function accountAction($id){
		$id = $this->filter->sanitize($id, array("int"));
		
		$userInfo = Users::findFirst('did = "'.$id.'"');
		
		if(!$userInfo){
			$this->flash->notice("还木有帐号，请创建并保存");
			Tag::displayTo("did", $id);
			$this->view->pick("session/register");
		}else{
			Tag::displayTo("id", $userInfo->id);
			Tag::displayTo("username", $userInfo->username);
            Tag::displayTo("name", $userInfo->name);
            Tag::displayTo("email", $userInfo->email);
		}
	}
	
	public function accountsaveAction(){
		
		
		$request = $this->request;
		
		$id = $request->getPost("id", "int");
		
		if (!$request->isPost()) {

		}else{
			$userInfo = Users::findFirstById($id);
		
			if (!$userInfo) {
				$this->flash->error("没有找到对应的帐号");
				return $this->forward("companies/index");
			}

			$userInfo->username = $request->getPost("username", "striptags");
			$userInfo->email = $request->getPost("email", "striptags");
			$userInfo->name = $request->getPost("name", "striptags");
			
			if (!$userInfo->save()) {
				foreach ($userInfo->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
				return $this->forward("companies/account/".$id);
			}
			$this->response->redirect("companies/search");			
			
		}		
	}
}
