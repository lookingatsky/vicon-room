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
			$match = Match::find("debt_number  = '".$debts->number ."'");
			$this->view->match = $match;
			
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
			//$this->flash->error("债权暂时无法启用编辑功能，请先删除再创建新的债权");
			//return $this->forward("debt/index");
			$searchParams = array("id = '".$id."'");
			$debts = Debts::findFirst($searchParams);
			Tag::setDefault("id",$debts->id);
			
			Tag::setDefault("number",$debts->number);
			Tag::setDefault("customer",$debts->customer->name);
			
			Tag::setDefault("type",$debts->type);
			Tag::setDefault("cost",$debts->cost);
			Tag::setDefault("time",date("Y年m月d日",$debts->assign_time));
			Tag::setDefault("total",$debts->total);
			//$this->view->setVar("debts", $debts);			
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
			if(!$debts->delete()){
				foreach ($debts->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
				return $this->forward("debt/index");
			}else{
				$this->flash->success("记录已删除");
				return $this->forward("debt/index");				
			}
			
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
			$fid = $debt->fid;
			if(!$debt){
				$this->flash->error("没有找到对应的债权文件");
				return $this->forward("debt/index");				
			}
			
			if(!$debt->delete()){
				foreach ($debt->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
				$this->response->redirect("debt/detail/".$fid);	
			}else{
				$this->flash->success("记录已删除");
				$this->response->redirect("debt/detail/".$fid);				
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
	
	public function saveeditAction($id){
		if($this->request->isPost()){
			$request = $this->request->getPost();
			$debts = Debts::findFirst($searchParams);
			$debts->type = $request['type'];
			$debts->time = $request['time'];
			$debts->cost = $request['cost'];
			$debts->total = $request['total'];
			if($debts->save()){
				$this->flash->notice("保存成功！");
				//$this->forward("debt/index");
				$this->response->redirect("debt/index/");
			}else{
				$this->flash->notice("保存失败！");
				//$this->forward("debt/index");
				$this->response->redirect("debt/index/");				
			}
		}else{
			return $this->forward("debt/index");
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
	
	public function uploadmatchAction(){
		
		
	}
	
	public function uploadmatchsaveAction(){
		$this->view->disable();
		if ($this->request->hasFiles() == true) {
			foreach ($this->request->getUploadedFiles() as $file) {
				$getType = explode('.',$file->getName());
				
				$uploadFile = "tests.".$getType[count($getType)-1];
				
                $file->moveTo(APP_PATH.'/public/upload/'.$uploadFile);				
				
			}	

			$excel = new Excel();
			
			$excel->path = APP_PATH.'/public/upload/'.$uploadFile;
			$excel->type = '03';
			//调用readExcel函数返回一个二维数组
			
			$data = $excel->getData();	
			
			
			//保存债权匹配信息
			foreach($data as $key=>$val){
				if($key != 0){
					$ifExist = Match::findFirst("debt_number = '".$val[0]."' AND loan_number = '".$val[14]."'");
					if(!$ifExist){
						$match = new Match();
						$match->debt_number  = $val[14];
						$match->loan_number  = $val[0];
						$match->debt_money  = $val[17];
						$match->debt_borrow  = $val[18];
						$match->debt_last  = $val[19];
						$match->starttime = $val[21];
						$match->endtime = $val[22];
						$match->status = $val[23];
						if(!$match->save()){
							$this->flash->error("保存失败！");
							foreach ($match->getMessages() as $message) {
								$this->flash->error((string) $message);
							}							
						}else{
							$this->response->redirect("debt/index/");
						}
					}
				}
			}
			$this->response->redirect("debt/index/");
		}
	}
}
