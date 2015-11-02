<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class Borrower extends model
{
    public function initialize()
    {
    }
    public function validation()
    {
	   $this->validate(new UniquenessValidator(array(
            'field' => 'number',
            'message' => '身份证号被霸占了'
        )));
        if ($this->validationHasFailed() == true) {
            return false;
        }

        $this->hasMany('id', 'loan', 'bid', array(
        	'foreignKey' => array(
        		'message' => '请先删除子记录'
        	)
        ));		
    }
}
