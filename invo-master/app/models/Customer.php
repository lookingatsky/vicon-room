<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class Customer extends model
{
    public function initialize()
    {
       // $this->setConnectionService('mongo1');
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
    }
}
