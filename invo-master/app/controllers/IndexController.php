<?php
use Phalcon\Mvc\Model\Criteria;

class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Phalcon\Tag::setTitle('欢迎');
        parent::initialize();
    }
	
    public function indexAction()
    {
			
        if (!$this->request->isPost()) {
			$auth = $this->session->get("auth");
			if(isset($auth)){
					
			}else{
				$this->flash->notice('欢迎来到中合万邦内部工作系统！');
			}
        }
/* 		else{
			$keywords = $this->request->getPost('keywords', 'keywords');
		} */
    }
}
