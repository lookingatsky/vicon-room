<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class Account extends model
{
    public function initialize()
    {
       $this->setConnectionService('customersystem');
    }
    public function validation()
    {
	   $this->validate(new UniquenessValidator(array(
            'field' => 'email',
            'message' => '该邮箱被霸占了'
        )));
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }
}
