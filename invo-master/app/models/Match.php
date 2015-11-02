<?php

class Match extends Phalcon\Mvc\Model
{
	
    public $id;

    public function initialize()
    {
        $this->belongsTo('loan_number', 'Loan', 'number', array(
			'reusable' => true
		));	
    }
}
