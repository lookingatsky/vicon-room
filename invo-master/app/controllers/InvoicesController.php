<?php

use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
use Phalcon\Session as Session;

class InvoicesController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('账户管理');
        parent::initialize();
    }

    public function indexAction()
    {
		$auth = $this->session->get('auth');
		$user = Users::findFirst($auth['id']);
		if ($user == false) {
            $this->forward('index/index');
        }
		
		if($auth['did'] != '' && $auth['did'] != 0){
			$department = Department::findFirst($auth['did']);
		}else{
			$department->name = '中合万邦总部';
		}
		
		$this->view->setVar("user",$user);
		$this->view->setVar("department",$department);
    }

    public function profileAction()
    {
        $auth = $this->session->get('auth');

        $user = Users::findFirst($auth['id']);
        if ($user == false) {
            $this->_forward('index/index');
        }

        $request = $this->request;

        if (!$request->isPost()) {
            Tag::setDefault('name', $user->name);
            Tag::setDefault('email', $user->email);
        } else {

            $name = $request->getPost('name', 'string');
            $email = $request->getPost('email', 'email');

            $name = strip_tags($name);

            $user->name = $name;
            $user->email = $email;
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->flash->success('更新成功');
            }
        }
    }
}
