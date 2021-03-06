<?php

use Phalcon\Events\Event,
	Phalcon\Mvc\User\Plugin,
	Phalcon\Mvc\Dispatcher,
	Phalcon\Acl;

/**
 * Security
 *
 * This is the security plugin which controls that users only have access to the modules they're assigned to
 */
class Security extends Plugin
{

	public function __construct($dependencyInjector)
	{
		$this->_dependencyInjector = $dependencyInjector;
	}

	public function getAcl()
	{
		if (!isset($this->persistent->acl)) {

			$acl = new Phalcon\Acl\Adapter\Memory();

			$acl->setDefaultAction(Phalcon\Acl::DENY);

			//Register roles
			$roles = array(
				'users' => new Phalcon\Acl\Role('Users'),
				'guests' => new Phalcon\Acl\Role('Guests'),
				'admin' => new Phalcon\Acl\Role('admin'),
				'marketer' => new Phalcon\Acl\Role('marketer'),
				'author' => new Phalcon\Acl\Role('author'),
				'editor' => new Phalcon\Acl\Role('editor')
			);
			foreach ($roles as $role) {
				$acl->addRole($role);
			}
			
			
			//市场 访问权限
			$marketResources = array(
				"customer" => array("index","detail","new","save","account","sendemail","addcard","deletecard","edit","saveedit","upload","uploadsave"),
				"debt" => array("index","add","","detail","new","edit","delete","upload","deletechild","create","save","saveedit","uploadmatch","uploadmatchsave","editfile"),
				"appointment" => array("index","detail","save"),
				"borrower" => array("index","detail","new","save","account","sendemail","addcard","deletecard","edit","saveedit","upload","uploadsave"),
				"loan" => array("index","add","","detail","new","edit","delete","upload","deletechild","create","save","saveedit","editfile"),
			);
			foreach ($marketResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}		
			
			//新闻初稿上传人 权限
			$authorResources = array(
				"news" => array("index","draft","newdraft","editdraft","adddraft","deletedraft"),
			);			
			foreach ($authorResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}

			//新闻稿审核人  权限
			$editorResources = array(
				"news" => array("index","new","edit","delete","add","upload","draft","verifydraft","verifysave","types","newtype","edittype","deletetype","addtype","members","newmember","editmember","addmember","deletemember","product","editproduct","newproduct","addproduct","deleteproduct"),
			);		
			
			foreach ($editorResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}			
			
			//////////
			$privateResources = array(
				'companies' => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete','account','accountsave',"accountdelete"),
				'products' => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete','list'),
				'producttypes' => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete','child','savetypes','edittypes','newtypes','createtypes','deletetypes'),
				'invoices' => array('index', 'profile'),
				'register' => array('index','sendemail','verifyemail','register')
			);
			foreach ($privateResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}
			////////////////
			$userResources = array(
				'invoices' => array('index', 'profile'),
				'products' => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete','list'),
				'register' => array('verifyemail','register')
			);
			foreach ($userResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}			
			//////////////////
			$publicResources = array(
				'index' => array('index'),
				'about' => array('index'),
				'session' => array('index', 'register', 'start', 'end'),
				'contact' => array('index', 'send'),
				'help' => array('index'),
				'register' => array('verifyemail','register'),
				'vote' => array('index')
			);
			foreach ($publicResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}

			//Grant access to public areas to both users and guests
			foreach ($roles as $role) {
				foreach ($publicResources as $resource => $actions) {
					$acl->allow($role->getName(), $resource, '*');
				}
			}

			foreach ($userResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('Users', $resource, $action);
				}
			}			
			
			
			foreach ($privateResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('admin', $resource, $action);
				}
			}
			
			foreach ($marketResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('marketer', $resource, $action);
				}
			}

			foreach ($authorResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('author', $resource, $action);
				}
			}

			foreach ($editorResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('editor', $resource, $action);
				}
			}			
			
			//The acl is stored in session, APC would be useful here too
			$this->persistent->acl = $acl;
		}

		return $this->persistent->acl;
	}


	public function beforeDispatch(Event $event, Dispatcher $dispatcher)
	{
		$auth = $this->session->get('auth');
		
		if (!$auth){
			$role = 'Guests';
		} else {
			if(isset($auth['type']) && $auth['type'] == 'market'){
				$role = 'marketer';
			}elseif(isset($auth['type']) && $auth['type'] == 'author'){
				$role = 'author';
			}elseif(isset($auth['type']) && $auth['type'] == 'editor'){
				$role = 'editor';
			}else{
				if($auth['did'] == 0){
					$role = 'admin';
				}else{
					$role = 'Users';		
				}
			}	
		}
		
		$controller = $dispatcher->getControllerName();
		$action = $dispatcher->getActionName();

		$acl = $this->getAcl();
		
		$allowed = $acl->isAllowed($role, $controller, $action);
		if ($allowed != Acl::ALLOW) {
			$this->flash->error("没有权限");
			$dispatcher->forward(
				array(
					'controller' => 'index',
					'action' => 'index'
				)
			);
			return false;
		}
		
	}

}
