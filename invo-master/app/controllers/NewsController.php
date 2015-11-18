<?php

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;
use Phalcon\Logger\Adapter\File as FileAdapter;	

class NewsController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('新闻列表页');
        parent::initialize();
    }

    public function indexAction()
    {
		$numberPage = 1;
		//$searchParams = array();
		if($this->request->isPost()){
			$keyword = trim($this->request->getPost("typeid","int"));
			
			if(isset($keyword) && $keyword != ''){		
				$searchParams = "typeid = '".$keyword."'";
			}else{
				$this->flash->notice("请重新输入搜索条件");
			}
			
					
		}else{
			$numberPage = $this->request->getQuery("page", "int");
			if ($numberPage <= 0) {
				$numberPage = 1;
			}					
		}
		$Newstype = Newstype::find();
		$this->view->setVar("Newstype",$Newstype);
		$auth = $this->session->get("auth");
		$this->view->auth = $auth['type'];
		
		$parameters = array();
		if ($searchParams) {
			$parameters = $searchParams;
		}	
		
		$news = News::find(array(
			$parameters,
			"order" => "id desc"
		));
		if (count($news) == 0) {
			$this->flash->notice("没有找到新闻");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $news,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);
    }
	
	public function newAction(){
		$Newstype = Newstype::find();
		$this->view->setVar("Newstype",$Newstype);		
	}
	
	public function addAction(){
		$request = $this->request;
		if (!$request->isPost()) {
			
		}
		//判断是编辑还是添加
		if($request->getPost("newsid") != ''){
			$news = News::findFirst("id =".$request->getPost("newsid"));
			if ($this->request->hasFiles('fileDataFileName') == true) {
				$fileName = date('Ymd');
				
				if (!file_exists(APP_PATH.'/public/files/'.$fileName)){ 
					mkdir(APP_PATH.'/public/files/'.$fileName); 
				}	 		
				
				foreach ($this->request->getUploadedFiles() as $file) {

					$getType = explode('.',$file->getName());
					$imageName = date('YmdHis').".".$getType[count($getType)-1];
					
					if($getType[count($getType)-1] != ''){
						$file->moveTo(APP_PATH.'/public/files/'.$fileName.'/'.$imageName);
						$news->thumb = ThisUrl .'/files/'.$fileName.'/'.$imageName;
					}
				}
				
			}
			$news->typeid = $request->getPost("typeid");
			$news->title = $request->getPost("title");
			$news->description = $request->getPost("description");
			$news->content = $request->getPost("content");
			if($news->save()){
				$this->flash->success("保存成功！");
			}else{
				foreach ($news->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			}				
		}else{
			$news = new News();
			if ($this->request->hasFiles('fileDataFileName') == true) {
				$fileName = date('Ymd');
				if (!file_exists(APP_PATH.'/public/files/'.$fileName)){ 
					mkdir(APP_PATH.'/public/files/'.$fileName); 
				}	 		
				
				foreach ($this->request->getUploadedFiles() as $file) {

					$getType = explode('.',$file->getName());
					$imageName = date('YmdHis').".".$getType[count($getType)-1];
					if($getType[count($getType)-1] != ''){
						$file->moveTo(APP_PATH.'/public/files/'.$fileName.'/'.$imageName);
						$news->thumb = ThisUrl .'/files/'.$fileName.'/'.$imageName;
					}else{
						$news->thumb = ThisUrl .'/img/test.jpg';
					}
				}
			}
			
			$news->typeid = $request->getPost("typeid");
			$news->title = $request->getPost("title");
			$news->description = $request->getPost("description");
			$news->content = $request->getPost("content");
			$auth = $this->session->get("auth");
			$news->username = $auth['name'];
			$news->inputtime = time();
			$news->updatetime = time();
			$news->status = 0;
			if($news->save()){
				$this->flash->success("保存成功！");
			}else{
				foreach ($news->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			}			
		}
	}
	
	public function uploadAction(){
		$this->view->disable();
		if ($this->request->hasFiles() == true) {

            foreach ($this->request->getUploadedFiles() as $file) {

                $file->moveTo(APP_PATH.'/public/files/' . $file->getName());
				
				$data['success'] = true;
				$data['msg'] = '上传成功';
				$data['file_path'] = ThisUrl .'/files/'.$file->getName();
				$msg = json_encode($data);
            }
			echo $msg;
        }		
	}
	
	public function editAction($id){
		$id = $this->filter->sanitize($id, array("int"));	
		if($id){
			$Newstype = Newstype::find();
			$this->view->setVar("Newstype",$Newstype);
			
			$news = News::findFirst("id =".$id);
			if($news){
				Tag::setDefault("newsid",$news->id);
				Tag::setDefault("typeid",$news->typeid);	
				Tag::setDefault("title",$news->title);	
				Tag::setDefault("description",$news->description);	
				Tag::setDefault("content",$news->content);	
				if($news->thumb){
					$this->view->thumb = $news->thumb;
				}
			}else{
				$this->response->redirect("index/index");
			}
		}else{
			$this->response->redirect("index/index");
		}
	}
	
    public function deleteAction($id)
    {
        $id = $this->filter->sanitize($id, array("int"));

        $news = News::findFirst('id="' . $id . '"');
        if (!$news) {
            $this->flash->error("没有找到对应的新闻");
            return $this->forward("news/index");
        }
			
        if (!$news->delete()) {
            foreach ($news->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
        } else {
            $this->flash->success("新闻已删除");
            return $this->forward("news/index");
        }
    }	
	
	////////////////////////////////////////////////////////////////////////////////
	//初稿
	////////////////////////////////////////////////////////////////////
	
	public function draftAction(){
		
		$numberPage = 1;
		//$searchParams = array();
		if($this->request->isPost()){
			$keyword = trim($this->request->getPost("typeid","int"));
			$status = trim($this->request->getPost("status","int"));
			
			if(isset($keyword) && $keyword != ''){		
				$searchParams = "typeid = '".$keyword."'";
				if(isset($status) && $status != ''){
					$searchParams .= " AND status = '".$status."'";
				}
			}else{
				if(isset($status) && $status != ''){
					$searchParams = "status = '".$status."'";
				}
			}
			
			
		}else{
			$numberPage = $this->request->getQuery("page", "int");
			if ($numberPage <= 0) {
				$numberPage = 1;
			}					
		}

		$auth = $this->session->get("auth");
		$this->view->auth = $auth['type'];
		
		//若为author  只显示自己提交的初稿
		if($auth['type'] == 'author'){
			if($searchParams == ''){
				$searchParams = "author = '".$auth['id']."'";
			}else{
				$searchParams .= " AND author = '".$auth['id']."'";
			}
		}
		
		$Newstype = Newstype::find();
		$this->view->setVar("Newstype",$Newstype);
		
		$parameters = array();
		if ($searchParams) {
			$parameters = $searchParams;
		}	
		
		$news = Draft::find(array(
			$parameters,
			"order" => "id desc"
		));
		if (count($news) == 0) {
			$this->flash->notice("没有找到新闻初稿");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $news,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);		
	}
	
	public function newdraftAction(){
		$Newstype = Newstype::find();
		$this->view->setVar("Newstype",$Newstype);			
	}
	
	public function editdraftAction($id){
		$id = $this->filter->sanitize($id, array("int"));	
		if($id){
			$Newstype = Newstype::find();
			$this->view->setVar("Newstype",$Newstype);
			
			$draft = Draft::findFirst("id =".$id);
			if($draft){
				Tag::setDefault("draftid",$draft->id);
				Tag::setDefault("typeid",$draft->typeid);	
				Tag::setDefault("title",$draft->title);	
				Tag::setDefault("content",$draft->content);	
				$remark = json_decode($draft->remark,true);
				$this->view->remark = $remark;					
			}else{
				$this->response->redirect("index/index");
			}
		}else{
			$this->response->redirect("index/index");
		}			
	}
	
	public function deletedraftAction($id){
        $id = $this->filter->sanitize($id, array("int"));

        $draft = Draft::findFirst('id="' . $id . '"');
        if (!$draft) {
            $this->flash->error("没有找到对应的新闻初稿");
            return $this->forward("news/draft");
        }
			
        if (!$draft->delete()) {
            foreach ($draft->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
        } else {
            $this->flash->success("新闻初稿已删除");
            return $this->forward("news/draft");
        }
	}
	
	public function adddraftAction(){
		$request = $this->request;
		if (!$request->isPost()) {
			
		}
		//判断是编辑还是添加
		if($request->getPost("draftid") != ''){
			$draft = Draft::findFirst("id =".$request->getPost("draftid"));
			$draft->typeid = $request->getPost("typeid");
			$draft->title = $request->getPost("title");
			$draft->content = $request->getPost("content");
			if($draft->save()){
				$this->flash->success("保存成功！");
			}else{
				foreach ($draft->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			}				
		}else{
			$draft = new Draft();
			
			$draft->typeid = $request->getPost("typeid");
			$draft->title = $request->getPost("title");
			$draft->content = $request->getPost("content");
			$auth = $this->session->get("auth");
			$draft->author = $auth['id'];
			$draft->time = time();
			$draft->status = 0;
			
			if($draft->save()){
				$this->flash->success("保存成功！");
			}else{
				foreach ($draft->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			}			
		}		
	}

	public function verifydraftAction($id){	
		$id = $this->filter->sanitize($id, array("int"));	
		if($id){
			$Newstype = Newstype::find();
			$this->view->setVar("Newstype",$Newstype);
			
			$draft = Draft::findFirst("id =".$id);
			if($draft){
				Tag::setDefault("status",$draft->status);
				Tag::setDefault("draftid",$draft->id);
				Tag::setDefault("typeid",$draft->typeid);	
				Tag::setDefault("title",$draft->title);	
				Tag::setDefault("content",$draft->content);
				$remark = json_decode($draft->remark,true);
				$this->view->remark = $remark;				
			}else{
				$this->response->redirect("index/index");
			}
		}else{
			$this->response->redirect("index/index");
		}			
	}

	public function verifysaveAction(){
		$userInfo = $this->session->get('auth');
		if($this->request->isPost()){
			$request = $this->request->getPost();
			$infos = Draft::findFirst("id =".$request['draftid']);
			$remark = json_decode($infos->remark,true);
			$insertInfo = array();
			$insertInfo['id'] = count($remark)+1;
			if($infos->status != $request['status']){
				if($infos->status == 0){
					$last = '<span class="label label-info">'."未审核".'</span>';
				}elseif($infos->status == 1){
					$last = '<span class="label label-warning">'."审核中".'</span>';
				}elseif($infos->status == 2){
					$last = '<span class="label label-success">'."发布中".'</span>';
				}else{
					$last = '<span class="label label-important">'."未通过".'</span>';
				}
				if($request['status'] == 0){
					$now = '<span class="label label-info">'."未审核".'</span>';
				}elseif($request['status'] == 1){
					$now = '<span class="label label-warning">'."审核中".'</span>';
				}elseif($request['status'] == 2){
					$now = '<span class="label label-success">'."发布中".'</span>';
				}else{
					$now = '<span class="label label-important">'."未通过".'</span>';
				}
				$insertInfo['operate'] =  $userInfo['name']."将状态由".$last."改为".$now;
			}

			if($infos->status == $request['status'] && $request['remark'] == ''){
				$this->response->redirect('news/draft');
			}else{
				$insertInfo['time'] = time();
				$insertInfo['operater'] = $userInfo['id'];
				$insertInfo['name'] =	$userInfo['name'];		
				$insertInfo['remark'] = $request['remark'];
				$remark[] = $insertInfo;
				$infos->status = $request['status'];
				$infos->remark = json_encode($remark);	
				
				if($infos->save()){
					if($request['status'] == 2){
						$news = new News();
						
						if ($this->request->hasFiles('fileDataFileName') == true) {
							$fileName = date('Ymd');
							if (!file_exists(APP_PATH.'/public/files/'.$fileName)){ 
								mkdir(APP_PATH.'/public/files/'.$fileName); 
							}	 		
							
							foreach ($this->request->getUploadedFiles() as $file) {

								$getType = explode('.',$file->getName());
								$imageName = date('YmdHis').".".$getType[count($getType)-1];
								if($getType[count($getType)-1] != ''){
									$file->moveTo(APP_PATH.'/public/files/'.$fileName.'/'.$imageName);
									$news->thumb = ThisUrl .'/files/'.$fileName.'/'.$imageName;
								}else{
									$news->thumb = ThisUrl .'/img/test.jpg';
								}
							}
						}
						
						$news->typeid = $request->getPost("typeid");
						$news->title = $request->getPost("title");
						$news->description = $request->getPost("description");
						$news->content = $request->getPost("content");
						$news->username = $userInfo['name'];
						$news->inputtime = time();
						$news->updatetime = time();
						$news->status = 0;
						if($news->save()){
							$this->response->redirect('news/draft');
						}else{
							$this->flash->error("新闻保存失败！");
							foreach ($news->getMessages() as $message) {
								$this->flash->error((string) $message);
							}
							$this->forward('news/draft');
						}					
					}else{
						$this->response->redirect('news/draft');					
					}								
				}else{			
					$this->flash->error("状态保存失败！");
					foreach ($infos->getMessages() as $message) {
							$this->flash->error((string) $message);
					}
					$this->forward('news/draft');									
				}					
			}				
		}else{
			
		}		
	}

	/////////////////////////////////////////////////////////////////////////////////////
	//新闻类型
	/////////////////////////////////////////////////////////////
	
	public function typesAction(){
		$numberPage = 1;
		$numberPage = $this->request->getQuery("page", "int");
		if ($numberPage <= 0) {
			$numberPage = 1;
		}

		$newstype = Newstype::find();
		
		if (count($newstype) == 0) {
			$this->flash->notice("没有找到新闻");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $newstype,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);	
	}
	
	public function newtypeAction(){
		
		
	}
	
	public function edittypeAction($id){
		$id = $this->filter->sanitize($id, array("int"));	
		if($id){
			$newstype = Newstype::findFirst("id = ".$id);
			Tag::setDefault("typeid",$newstype->id);
			Tag::setDefault("name",$newstype->name);
		}else{
			$this->flash->error("错误操作");
			$this->forward("news/types");
		}
	}
	
	public function deletetypeAction($id){
		$id = $this->filter->sanitize($id, array("int"));	
		if($id){	
			$newstype = Newstype::findFirst("id = ".$id);
			if (!$newstype->delete()) {
				foreach ($newstype->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			} else {
				$this->flash->success("新闻类型已删除");
				return $this->forward("news/types");
			}
		}else{
			$this->flash->error("错误操作");
			$this->forward("news/types");
		}		
	}
	
	public function addtypeAction(){
		$request = $this->request;
		if (!$request->isPost()) {
			
		}
		//判断是编辑还是添加
		if($request->getPost("typeid") != ''){
			$newstype = Newstype::findFirst("id = ".$request->getPost("typeid"));
			if($newstype){
				$newstype->name = $request->getPost("name");
				if($newstype->save()){
					$this->flash->success("新闻类型修改成功");
					return $this->forward('news/types');
				}else{
					foreach ($newstype->getMessages() as $message) {
						$this->flash->error((string) $message);
					}
				}	
			}else{
				$this->flash->error("找不到该新闻类型");
				return $this->forward('news/types');
			}
		}else{
			$newstype = new Newstype();
			$newstype->name = $request->getPost("name");
			if($newstype->save()){
				$this->flash->success("新闻类型保存成功");
				return $this->forward('news/types');
			}else{
				foreach ($newstype->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			}			
		}		
	}
	
	/////////////////////////////////////////////////////////////////////////////////////
	//新闻管理员
	/////////////////////////////////////////////////////////////
	public function membersAction(){
		$numberPage = 1;
		//$searchParams = array();
		if($this->request->isPost()){
			$keyword = trim($this->request->getPost("type"));
			if(isset($keyword) && $keyword != ''){		
				if($keyword == 'author'){
					$searchParams = "type = 'author'";	
				}elseif($keyword == 'editor'){
					$searchParams = "type = 'editor'";	
				}else{
					$searchParams = "type = 'author' OR type = 'editor'";
				}
			}else{
				$searchParams = "type = 'author' OR type = 'editor'";
			}	
		}else{
			$searchParams = "type = 'author' OR type = 'editor'";
			$numberPage = $this->request->getQuery("page", "int");
			if ($numberPage <= 0) {
				$numberPage = 1;
			}					
		}
	
		$parameters = array();
		if ($searchParams) {
			$parameters = $searchParams;
		}	
		
		$users = Users::find(array(
			$parameters,
			"order" => "id desc"
		));
		
		if (count($users) == 0) {
			$this->flash->error("没有找到管理人员");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $users,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);		
	}

	public function newmemberAction(){	
		$form = new RegisterForm();
		$this->view->form = $form;
		$department = Department::find();
		$this->view->department = $department;
		$this->tag->setDefault('email',' ');
		$this->tag->setDefault('password', '');		
	}
	
	public function editmemberAction($id){
		if($id){
			$form = new RegisterForm();
			$this->view->form = $form;				
		}else{
			$this->flash->error("没有找到管理人员");
			$this->forward('news/members');
		}
	}

	public function addmemberAction(){
        if ($this->request->isPost()) {
			$type = $this->request->getPost('type', array('string', 'striptags'));
			$department = $this->request->getPost('department');
            $name = $this->request->getPost('name', array('string', 'striptags'));
            $username = $this->request->getPost('username', 'alphanum');
            $email = trim($this->request->getPost('email', 'email'));
            $password = $this->request->getPost('password');
            $repeatPassword = $this->request->getPost('repeatPassword');
			
            if ($password != $repeatPassword) {
                $this->flash->error('两次密码不一致');
                return false;
            }

            $user = new Users();
            $user->username = $username;
            $user->password = sha1($password);
            $user->name = $name;
            $user->email = $email;
			$user->did = $department;
            $user->type = $type;
            $user->created_at = new Phalcon\Db\RawValue('now()');
            $user->active = 'Y';
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->tag->setDefault('email', '');
                $this->tag->setDefault('password', '');
                $this->flash->success('注册成功');
                return $this->forward('news/members');
            }
        }else{
			$this->flash->error("错误操作");
			$this->forward("news/members");
		}		
	}
		
	public function deletememberAction($id){
		if($id){
			$users = Users::findFirst("id = ".$id);
			if (!$users->delete()) {
				foreach ($users->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			} else {
				$this->flash->success("管理员已删除");
				return $this->forward("news/members");
			}			
		}else{
			$this->flash->error("没有找到管理人员");
			$this->forward('news/members');			
		}	
	}	
}
