<?php

class HelpController extends ControllerBase
{
    public function initialize()
    {
        //$this->view->setTemplateAfter('main');
        Phalcon\Tag::setTitle('帮助中心');
        parent::initialize();
    }

    public function indexAction()
    {	
    }
}
