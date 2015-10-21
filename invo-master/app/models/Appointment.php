<?php

class Appointment extends Phalcon\Mvc\Model
{
    public $id;

    public function initialize()
    {
		$this->setConnectionService('customersystem');
    }

}
