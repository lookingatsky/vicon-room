<?php
use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;

class SearchController extends ControllerBase
{
    public function initialize()
    {
        //$this->view->setTemplateAfter('main');
        Tag::setTitle('业务查询系统');
        parent::initialize();
    }

    public function indexAction()
    {
        if (!$this->request->isPost()) {
            Tag::setDefault('email', ' ');
            Tag::setDefault('password', '');
        }else{
			$name = trim($this->request->getPost('name', array('string', 'striptags')));			
            $password = trim($this->request->getPost('password'));
			$password = sha1($password);
			$detail = Customer::find("name = ".$name);
			if($password == sha1($detail->num)){
				return $this->forward("search/jump");
			}else{
				$this->flash->error("错误");
			}
		}							
    }
	public function jumpAction(){
		
		
	}
	
	
	public function getdataAction(){
		$this->view->disable();
		echo true;
	}
	
}
