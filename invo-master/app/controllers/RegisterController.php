<?php

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;
/**
 * SessionController
 *
 * Allows to register new users
 */
class RegisterController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('注册');
        parent::initialize();
    }

    /**
     * 注册新用户
     */
    public function indexAction($id)
    {
		if($id){
			$form = new RegisterForm;
			$this->view->form = $form;
			Tag::setDefault('did', $id);
		}else{
			$this->flash->error('页面错误');	
			$this->forward('register/index');			
		}
    }
		
	public function sendemailAction(){
        if ($this->request->isPost()) {
            $email = $this->request->getPost('email', 'email');
			$did = $this->request->getPost('did');
			if(isset($did)){
				$time = time();		
				$emailContent = "亲爱的".$email."： \r\n";
				$emailContent .= "欢迎您来到中合万邦费控系统！ \r\n";
				$emailContent .= "请马上点击以下链接完成注册 \r\n";
				$emailContent .= "http://wap.zhwbchina.com/register/verifyemail/".md5($time."+".$email)."\r\n";
				$emailContent .= "(如果该链接无法点击，请将它完成复制并粘贴至浏览器的地址栏中访问)\r\n\r\n\r\n";
				$emailContent .= "这是一封系统自动发出的邮件，请不要直接回复。\r\n";
				$emailContent .= "如有疑问可发送邮件至tech@zhwbchina.com。\r\n\r\n";
				$emailContent .= "中合万邦\r\n";
				$emailContent .= "http://www.zhwbchina.com";
				$mail = new Mail();
				$result = $mail->smtp($email,'请验证您的邮箱（自：中合万邦——费控系统）',$emailContent);
				//$result = true;
				$this->view->setVar("email", $email);
				$results = VerifyEmail::Find("email = '".$email."'");
				foreach($results as $result){
					if($result->delete() == false){
						//存log
						foreach ($result->getMessages() as $message) {
							
						}
					}else{
						//存log
					}
				}
				
				$verifyEmail = new VerifyEmail();
				$verifyEmail->email = $email;
				$verifyEmail->time = $time;
				$verifyEmail->verifyCode = md5($time."+".$email);	
				$verifyEmail->active = 'Y';
				$verifyEmail->did = $did;
				if ($verifyEmail->save() == false) {
					foreach ($user->getMessages() as $message) {
						$this->flash->error((string) $message);
					}						
				}else{
					if($result){	
						$arrRs = explode('@',$email);
						$mailLink = 'http://mail.'.$arrRs[1];
						$this->view->setVar("mailLink", $mailLink);
						$this->flash->success('邮件已发送至您的邮箱，请查收！');
					}else{
						$this->flash->error('发送失败！');	
						$this->forward('register/index');
					} 				
				}				
			}else{
				
				
			}

        }else{
			$this->response->redirect("index/index");
		}
		
	}
	
	public function verifyemailAction($code){
		
		if($code){
			$results = VerifyEmail::FindFirst("verifyCode = '".$code."'");
		if(!isset($results->did)){
			return $this->response->redirect("index/index");
		}
				
			$form = new RegisterForm;
			if(isset($results) && $results != ''){
				if($results->active == 'Y'){
					if(md5($results->time.'+'.$results->email) == $code){
						$this->view->form = $form;
						Tag::setDefault('username',' ');
						Tag::setDefault('name',' ');
						Tag::setDefault('password','');
						$department = Department::FindFirst("id = ".$results->did);
						Tag::setDefault('did',$results->did);
						$this->view->setVar("deparment", $department->name);
						$this->view->setVar("email", $results->email);
					}else{
						$this->flash->error('邮箱验证错误！');
						$this->response->redirect("register/index");					
					}					
				}else{
					$this->flash->error('邮箱已经验证通过，请登录！');
					$this->response->redirect("session/index");
				}
			}else{
				$this->flash->error('验证码已过期！');
				$this->response->redirect("index/index"); 
			}
		}else{
			$this->response->redirect("index/index");
		}
	}

 	public function registerAction(){
		if ($this->request->isPost()) {
			$email = $this->request->getPost('email');	
			$username = $this->request->getPost('username');
			$password = $this->request->getPost('password');
			$name = $this->request->getPost('name');
			$user = new Users();
            $user->username = trim($username);
			$user->name = trim($name);
            $user->password = sha1($password);
            $user->email = trim($email);
            $user->created_at = new Phalcon\Db\RawValue('now()');
			$user->did = $this->request->getPost('did');
            $user->active = 'Y';			
			
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
				$verifyEmail = VerifyEmail::FindFirst("email = '".$email."'");
				$verifyEmail->active = 'N';
				$verifyEmail->save();
				
                $this->tag->setDefault('email', ' ');
                $this->tag->setDefault('password', '');
                $this->flash->success('注册成功，登录即可进入系统!');
                return $this->forward('session/index');
            } 
		}		
	}	 
}
