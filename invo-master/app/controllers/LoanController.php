<?php

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;
use Phalcon\Logger\Adapter\File as FileAdapter;	

class LoanController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('借款信息');
        parent::initialize();
    }

    public function indexAction(){
		$numberPage = 1;
		$searchParams = array();
		if($this->request->isPost()){
			$keyword = trim($this->request->getPost("keyword","striptags"));
			
			if(isset($keyword) && $keyword != ''){
					$searchParams = array("number = '".$keyword."'");
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
		
		$loan = Loan::find($parameters);
		if (count($loan) == 0) {
			$this->flash->notice("没有任何借款信息");
		}
	
		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $loan,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);
    }
	
	public function addAction($cid){
		$borrower = Borrower::findFirst("id = ".$cid);
		tag::setDefault("",$borrower->name);
	}
	
	public function detailAction($id)
	{
		$id = $this->filter->sanitize($id, array("int"));
		
		if($id){
			$searchParams = array("id = '".$id."'");
			
			$loan = Loan::findFirst($searchParams);
			$this->view->setVar("loan", $loan);
			
			$pawn = Pawn::find("bid = ".$id);
			$this->view->pawn = $pawn;
		}else{
			$this->flash->error("没有找到对应的借款");
			return $this->forward("loan/index");
		}	
	}
	
	public function newAction($id){
		if($id){
			$searchParams = array("id = '".$id."'");
			$loan = Loan::findFirst($searchParams);
			$this->view->setVar("loan", $loan);			
		}else{
			$this->flash->error("没有找到对应的债权");
			return $this->forward("loan/index");
		}
	}

	public function editAction($id){
		if($id){
			
			$searchParams = array("id = '".$id."'");
			$loan = Loan::findFirst($searchParams);
			Tag::setDefault("id",$loan->id);
			
			Tag::setDefault("number",$loan->number);
			Tag::setDefault("customer",$loan->customer->name);
			
			Tag::setDefault("type",$loan->type);
			Tag::setDefault("cost",$loan->cost);
			Tag::setDefault("time",date("Y年m月d日",$loan->assign_time));
			Tag::setDefault("total",$loan->total);
			//$this->view->setVar("debts", $debts);			
		}else{
			$this->flash->error("没有找到对应的债权文件");
			return $this->forward("loan/index");
		}
	}

	public function deleteAction($id){
		if($id){
			$searchParams = array("id = '".$id."'");
			$loan = Loan::findFirst($searchParams);
			$this->view->setVar("loan", $loan);
			if(!$loan->delete()){
				foreach ($loan->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
				return $this->forward("loan/index");
			}else{
				$this->flash->success("记录已删除");
				return $this->forward("loan/index");				
			}
			
		}else{
			$this->flash->error("没有找到对应的债权文件");
			return $this->forward("loan/index");
		}
	}	

	
	public function uploadAction(){
        if ($this->request->hasFiles('fileDataFileName') == true) {
			$fileName = $this->request->getPost("fileName");
			$title = $this->request->getPost("title");
			$fid = $this->request->getPost("fid");
		
 			if (!file_exists(APP_PATH.'/public/pawn/'.$fileName.'/')){ 
				mkdir(APP_PATH.'/public/pawn/'.$fileName.'/'); 
			}	 		
            foreach ($this->request->getUploadedFiles() as $file) {
				$getType = explode('.',$file->getName());
				$uploadFile = date('YmdHis').rand(10000,99999).".".$getType[count($getType)-1];
                $file->moveTo(APP_PATH.'/public/pawn/'.$fileName.'/'.$uploadFile);
            }
			$pawn = new Pawn();
			$pawn->bid = $fid;
			$pawn->src = '/pawn/'.$fileName.'/'.$uploadFile;
			$pawn->title = $title;
			$pawn->type = $getType[count($getType)-1];
			
			if($pawn->save()){
				$this->response->redirect('loan/new/'.$fid);
			}else{
				$this->flash->error("保存失败！");
				foreach ($pawn->getMessages() as $message) {
					$this->flash->error((string) $message);
				}	
				return $this->forward("loan/index");
			}				
        }	
	}
	
	public function deletechildAction($id){
		if($id){
			$pawn = Pawn::findFirst("id = ".$id);
			$fid = $pawn->fid;
			if(!$pawn){
				$this->flash->error("没有找到对应的债权文件");
				return $this->forward("loan/index");				
			}
			
			if(!$pawn->delete()){
				foreach ($pawn->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
				$this->response->redirect("loan/detail/".$fid);	
			}else{
				$this->flash->success("记录已删除");
				$this->response->redirect("loan/detail/".$fid);				
			}
		}else{
			$this->flash->error("没有找到对应的债权文件");
			return $this->forward("loan/index");
		}
	}
	
	public function createAction($id){
		if($id){
			tag::setDefault("cid",$id);
		}else{
			$this->flash->error("没有找到对应的客户");
			return $this->forward("borrower/index");
		}		
	}
	
	public function saveeditAction($id){
		if($this->request->isPost()){
			$request = $this->request->getPost();
			$loan = Loan::findFirst($searchParams);
			$loan->type = $request['type'];
			$loan->time = $request['time'];
			$loan->cost = $request['cost'];
			$loan->total = $request['total'];
			if($loan->save()){
				$this->flash->notice("保存成功！");
				//$this->forward("debt/index");
				$this->response->redirect("loan/index/");
			}else{
				$this->flash->notice("保存失败！");
				//$this->forward("debt/index");
				$this->response->redirect("loan/index/");				
			}
		}else{
			return $this->forward("loan/index");
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
			if($debts->save()){
				$this->flash->notice("保存成功！");
				$this->response->redirect("customer/detail/".$request['cid']);
			}else{
				$this->flash->error("保存失败！");
				$this->response->redirect("customer/detail/".$request['cid']);
			}			
		}else{
			return $this->forward("customer/index");
		}	
	}
	
}
