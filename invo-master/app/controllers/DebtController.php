<?php

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;
use Phalcon\Logger\Adapter\File as FileAdapter;	

class DebtController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('债权信息');
        parent::initialize();
    }

    public function indexAction(){
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
		
		$debts = Debts::find($parameters);
		if (count($debts) == 0) {
			$this->flash->notice("没有任何债权信息");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $debts,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);
    }
	
	public function addAction($cid){
		$customer = Customer::findFirst("id = ".$cid);
		tag::setDefault("",$customer->name);
	}
	
	public function detailAction($id)
	{
		$id = $this->filter->sanitize($id, array("int"));
		
		if($id){
			$searchParams = array("id = '".$id."'");
			
			$debts = Debts::findFirst($searchParams);
			$this->view->setVar("debts", $debts);
			
			$debt = Debt::find("fid = ".$id);
			$this->view->debt = $debt;
		}else{
			$this->flash->error("没有找到对应的债权");
			return $this->forward("debt/index");
		}	
	}
	
	public function newAction($id){
		if($id){
			$searchParams = array("id = '".$id."'");
			$debts = Debts::findFirst($searchParams);
			$this->view->setVar("debts", $debts);			
		}else{
			$this->flash->error("没有找到对应的债权");
			return $this->forward("debt/index");
		}
	}

	public function editAction($id){
		if($id){
			$this->flash->error("债权暂时无法启用编辑功能，请先删除再创建新的债权");
			return $this->forward("debt/index");
			$searchParams = array("id = '".$id."'");
			$debts = Debts::findFirst($searchParams);
			$this->view->setVar("debts", $debts);			
		}else{
			$this->flash->error("没有找到对应的债权文件");
			return $this->forward("debt/index");
		}
	}

	public function deleteAction($id){
		if($id){
			$searchParams = array("id = '".$id."'");
			$debts = Debts::findFirst($searchParams);
			$this->view->setVar("debts", $debts);			
		}else{
			$this->flash->error("没有找到对应的债权文件");
			return $this->forward("debt/index");
		}
	}	

	
	public function uploadAction(){
        if ($this->request->hasFiles('fileDataFileName') == true) {
			$fileName = $this->request->getPost("fileName");
			$title = $this->request->getPost("title");
			$fid = $this->request->getPost("fid");
			
 			if (!file_exists(APP_PATH.'/public/files/'.$fileName.'/')){ 
				mkdir(APP_PATH.'/public/files/'.$fileName.'/'); 
			}	 		
			
            foreach ($this->request->getUploadedFiles() as $file) {
				$getType = explode('.',$file->getName());
				$uploadFile = date('YmdHis').rand(10000,99999).".".$getType[count($getType)-1];
                $file->moveTo(APP_PATH.'/public/files/'.$fileName.'/'.$uploadFile);
            }
			
			$debt = new Debt();
			$debt->fid = $fid;
			$debt->src = '/files/'.$fileName.'/'.$uploadFile;
			$debt->title = $title;
			$debt->type = $getType[count($getType)-1];
			
			if($debt->save()){
				$this->response->redirect('debt/new/'.$fid);
			}else{
				$this->flash->error("保存失败！");
				foreach ($debt->getMessages() as $message) {
					$this->flash->error((string) $message);
				}	
				return $this->forward("debt/index");
			}				
        }	
	}
	
	public function deletechildAction($id){
		if($id){
			$debt = Debt::findFirst("id = ".$id);
			if(!$debt){
				$this->flash->error("没有找到对应的债权文件");
				return $this->forward("debt/index");				
			}
			
			if(!$debt->delete()){
				foreach ($debt->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
				return $this->forward("debt/detail".$debt->fid);	
			}else{
				$this->flash->success("记录已删除");
				return $this->forward("debt/detail".$debt->fid);				
			}
		}else{
			$this->flash->error("没有找到对应的债权文件");
			return $this->forward("debt/index");
		}
	}
	
	public function createAction($id){
		if($id){
			tag::setDefault("cid",$id);
		}else{
			$this->flash->error("没有找到对应的客户");
			return $this->forward("customer/index");
		}		
	}
	
	public function saveAction(){
		if($this->request->isPost()){
			$request = $this->request->getPost();
			$debts = new Debts();
			$debts->number = $request['number'];
			$debts->type = $request['type'];
			$debts->time = $request['time'];
			$debts->cost = $request['cost'];
			$debts->cid = $request['cid'];
			$debts->total = $request['total'];
			if($finance->save()){
				$this->flash->notice("保存成功！");
				return $this->forward("customer/detail".$cid);
			}else{
				$this->flash->error("保存失败！");
				return $this->forward("customer/detail".$cid);
			}			
		}else{
			return $this->forward("customer/index");
		}	
	}
	
}
