<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class Bcards extends model
{
    public function initialize()
    {
       // $this->setConnectionService('mongo1');
    }
    public function validation()
    {
	   $this->validate(new UniquenessValidator(array(
            'field' => 'number',
            'message' => '银行卡号被霸占了'
        )));
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }
}
