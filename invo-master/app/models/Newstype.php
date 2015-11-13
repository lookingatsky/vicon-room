<?php
use Phalcon\Mvc\Model;

class Newstype extends model
{
    public function initialize()
    {
       $this->setConnectionService('customersystem');
        $this->hasMany('id', 'News', 'typeid', array(
        	'foreignKey' => array(
        		'message' => '该类型下还有新闻，不能删除该新闻类型'
        	)
        ));
        $this->hasMany('id', 'Draft', 'typeid', array(
        	'foreignKey' => array(
        		'message' => '该类型下还有新闻，不能删除该新闻类型'
        	)
        ));			
    }
	
}
