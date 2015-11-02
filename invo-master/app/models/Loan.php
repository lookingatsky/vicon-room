<?php

class Loan extends Phalcon\Mvc\Model
{
	
    public $id;

    public function initialize()
    {	
        $this->belongsTo('bid', 'Borrower', 'id', array(
			'reusable' => true
		));		
        $this->hasMany('number', 'Match', 'loan_number', array(
        	'foreignKey' => array(
        		'message' => '请先删除子记录'
        	)
        ));	
        $this->hasMany('id', 'Pawn', 'bid', array(
        	'foreignKey' => array(
        		'message' => '请先删除子记录'
        	)
        ));		
    }
}
