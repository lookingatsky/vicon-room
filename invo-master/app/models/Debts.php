<?php

class Debts extends Phalcon\Mvc\Model
{
	
    public $id;

    public function initialize()
    {
        $this->hasMany('id', 'Debt', 'fid', array(
        	'foreignKey' => array(
        		'message' => '请先删除子记录'
        	)
        ));
		
        $this->belongsTo('cid', 'Customer', 'id', array(
			'reusable' => true
		));		
    }
}
