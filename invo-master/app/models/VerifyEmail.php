<?php
use Phalcon\Mvc\Model\Relation;

class VerifyEmail extends Phalcon\Mvc\Model
{

    public $id;
    public $email;
    public $verifyCode;
    public $time;

    public function initialize()
    {
/* 		//建立联表	
        $this->hasOne('id', 'BaiduApiDetail', 'info_id', array(
        	'foreignKey' => array(
        		'action' => Relation::ACTION_CASCADE
        	)
        )); */
    }

}
