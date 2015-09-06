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
/* 		foreach($types as $k=>$val){
			fb($k);
			fb($val);	
		}
		$types = $types->toArray();
		fb($types); */
			
        if (!$this->request->isPost()) {
			$auth = $this->session->get("auth");
			if(isset($auth)){
					
			}else{
				$this->flash->notice('欢迎来到中合万邦费控系统！');
			}
        }
/* 		else{
			$keywords = $this->request->getPost('keywords', 'keywords');
		} */
    }
}
