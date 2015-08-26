<?php

use Phalcon\Tag;
use Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;
	
class ProductTypesController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('类型管理');
        parent::initialize();
    }

	protected function getForm($entity=null, $edit=false)
	{
		$form = new Form($entity);

		if (!$edit) {
			$form->add(new Text("id", array(
				"size" => 10,
				"maxlength" => 10,
			)));
		} else {
			$form->add(new Hidden("id"));
		}

		$form->add(new Text("name", array(
			"size" => 24,
			"maxlength" => 50
		)));

		$form->add(new Text("limit", array(
			"size" => 10,
			"maxlength" => 50
		)));
		
		$form->add(new Textarea("remark", array(
			"cols" => 14,
			"rows" => 5,
			"maxlength" => 250
		)));
		
		return $form;
	}	
	
    public function indexAction()
    {
        $this->session->conditions = null;
    }

    public function searchAction()
    {		
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "ProductTypes", $_POST);
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
            if ($numberPage <= 0) {
                $numberPage = 1;
            }
        }

        $parameters = array();
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }

        $productTypes = Type::find($parameters);
        if (count($productTypes) == 0) {
            $this->flash->notice("The search did not find any product types");
            return $this->forward("producttypes/index");
        }

        $paginator = new Phalcon\Paginator\Adapter\Model(array(
            "data" => $productTypes,
            "limit" => 10,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("productTypes", $productTypes);
    }

	public function childAction($id){
	    $numberPage = 1;

        $numberPage = $this->request->getQuery("page", "int");
        if ($numberPage <= 0) {
			$numberPage = 1;
        }
       
        $parameters = array();
        if ($id) {
			$parameters = array(
				"fid =".$id  
			);
        }

        $productTypes = Types::find($parameters);
		
        if (count($productTypes) == 0) {
            $this->flash->notice("没有对应下级类型");
            return $this->forward("producttypes/index");
        }

        $paginator = new Phalcon\Paginator\Adapter\Model(array(
            "data" => $productTypes,
            "limit" => 10,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("productTypes", $productTypes);	
		
	}
	
    public function newAction()
    {
    }

    public function editAction($id)
    {
        $request = $this->request;
        if (!$request->isPost()) {

            $producttypes = Type::findFirst(array('id=:id:', 'bind' => array('id' => $id)));
            if (!$producttypes) {
                $this->flash->error("Product type to edit was not found");
                return $this->forward("producttypes/index");
            }
            $this->view->setVar("id", $producttypes->id);

            Tag::displayTo("id", $producttypes->id);
            Tag::displayTo("name", $producttypes->name);
        }
    }

    public function createAction()
    {
        if (!$this->request->isPost()) {
            return $this->forward("producttypes/index");
        }

        $producttypes = new ProductTypes();
        $producttypes->id = $this->request->getPost("id", "int");
        $producttypes->name = $this->request->getPost("name");

        $producttypes->name = strip_tags($producttypes->name);

        if (!$producttypes->save()) {
            foreach ($producttypes->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("producttypes/new");
        } else {
            $this->flash->success("Product type was created successfully");
            return $this->forward("producttypes/index");
        }
    }

    public function saveAction()
    {
        if (!$this->request->isPost()) {
            return $this->forward("producttypes/index");
        }

        $id = $this->request->getPost("id", "int");
        $producttypes = ProductTypes::findFirst("id='$id'");
        if ($producttypes == false) {
            $this->flash->error("product types does not exist " . $id);

            return $this->forward("producttypes/index");
        }
        $producttypes->id = $this->request->getPost("id", "int");
        $producttypes->name = $this->request->getPost("name", "striptags");

        if (!$producttypes->save()) {
            foreach ($producttypes->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("producttypes/edit/" . $producttypes->id);
        } else {
            $this->flash->success("Product Type was updated successfully");
            return $this->forward("producttypes/index");
        }
    }
	
    public function deleteAction($id)
    {
        $id = $this->filter->sanitize($id, array("int"));

        $producttypes = ProductTypes::findFirst('id="' . $id . '"');
        if (!$producttypes) {
            $this->flash->error("没找到对应的类型");
            return $this->forward("producttypes/index");
        }

        if (!$producttypes->delete()) {
            foreach ($producttypes->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("producttypes/search");
        } else {
            $this->flash->success("product types was deleted");
            return $this->forward("producttypes/index");
        }
    }
	
	public function newtypesAction(){
		$this->view->form = $this->getForm();
	}
	
	public function savetypesAction(){
		if (!$this->request->isPost()) {
			return $this->forward("producttypes/index");
		}

		$id = $this->request->getPost("id", "int");

		$Types = Types::findFirstById($id);
		if ($Types == false) {
			$this->flash->error("没有找到下级类型");
			return $this->forward("producttypes/index");
		}

		$Types->id = $this->request->getPost("id", "int");
		$Types->name = $this->request->getPost("name", "striptags");
		$Types->limit = $this->request->getPost("limit", "striptags");
		$Types->remark = $this->request->getPost("remark", "striptags");

		if (!$Types->save()) {
			foreach ($Types->getMessages() as $message) {
				$this->flash->error((string) $message);
			}
			return $this->forward("producttypes/edittypes/".$Types->id);
		}
		
		$this->response->redirect("producttypes/child/".$Types->fid);		
	}
	
	public function edittypesAction($id){
		$request = $this->request;
		if (!$request->isPost()) {

			$types = Types::findFirstById($id);
			
			if (!$types) {
				$this->flash->error("没有找到对应的类型");
				return $this->forward("producttypes/index");
			}

			$this->view->form = $this->getForm($types, true);
		}					
	}
	
	public function createtypesAction(){
		
	}
	
	public function deletetypesAction(){
		
	}
}
