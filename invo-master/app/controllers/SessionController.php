<?php

use Phalcon\Tag as Tag;

class SessionController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('登录/注册');
        parent::initialize();
    }

    public function indexAction()
    {
        if (!$this->request->isPost()) {
            Tag::setDefault('email', 'demo@phalconphp.com');
            Tag::setDefault('password', 'phalcon');
        }	
    }

    public function registerAction()
    {
        $request = $this->request;
        if ($request->isPost()) {
			$did = $request->getPost('did', 'int');
            $name = $request->getPost('name', array('string', 'striptags'));
            $username = $request->getPost('username', 'alphanum');
            $email = $request->getPost('email', 'email');
            $password = $request->getPost('password');
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
			$user->did = $did;
            $user->created_at = new Phalcon\Db\RawValue('now()');
            $user->active = 'Y';

			if ($user->save() == false) {
				$this->flash->error('保存失败');
				foreach ($user->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			} else {
                return $this->response->redirect('companies/search');
			}		
        }
    }

    private function _registerSession($user)
    {
        $this->session->set('auth', array(
            'id' => $user->id,
            'name' => $user->name,
			'did' => $user->did
        ));
    }

    public function startAction()
    {
        if ($this->request->isPost()) {
            $email = $this->request->getPost('email', 'email');

            $password = $this->request->getPost('password');
            $password = sha1($password);

            $user = Users::findFirst("email='$email' AND password='$password' AND active='Y'");
            if ($user != false) {
                $this->_registerSession($user);
                $this->flash->success('Welcome ' . $user->name);
                return $this->forward('invoices/index');
            }

            $username = $this->request->getPost('email', 'alphanum');
            $user = Users::findFirst("username='$username' AND password='$password' AND active='Y'");
            if ($user != false) {
                $this->_registerSession($user);
                $this->flash->success('Welcome ' . $user->name);
                return $this->forward('invoices/index');
            }
			
            $this->flash->error('帐号密码错误');
        }

        return $this->forward('session/index');
    }

    public function endAction()
    {
        $this->session->remove('auth');
		$this->session->destroy();
        $this->flash->success('拜拜!');
        return $this->forward('index/index');
    }
}
