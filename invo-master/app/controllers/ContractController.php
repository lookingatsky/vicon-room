<?php

use Phalcon\Tag as Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;

class ContractController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('合同登记');
        parent::initialize();
    }

    public function indexAction()
    {
		$numberPage = 1;
		if($this->request->isPost())}{
			$query = Criteria::fromInput($this->di, "Companies", $_POST);
			$this->persistent->searchParams = $query->getParams();		
		}else{
			$numberPage = $this->request->getQuery("page", "int");
			if ($numberPage <= 0) {
				$numberPage = 1;
			}					
		}
		
		$parameters = array();
		if ($this->persistent->searchParams) {
			$parameters = $this->persistent->searchParams;
		}	

		$companies = Department::find($parameters);
		if (count($companies) == 0) {
			$this->flash->notice("没有找到对应的合同");
			return $this->forward("companies/index");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $companies,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();

		$this->view->setVar("page", $page);
		$this->view->setVar("companies", $companies);		
    }

	
}
