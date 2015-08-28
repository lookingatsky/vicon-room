<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\PresenceOf as PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class Type extends Model
{
	public $id;

	public $name;

	public function initialize()
	{
		$this->hasMany("id", "Types", "fid");
	}

	public function validation(){	
		$this->validate(new PresenceOf(array(
			'field' => 'name',
			'message' => '名称不能为空'
		)));	
	
	   $this->validate(new UniquenessValidator(array(
            'field' => 'name',
            'message' => '已经有该类型了'
        )));

        if ($this->validationHasFailed() == true) {
            return false;
        }		
	}
/*
	public function getActiveDetail()
	{
		if ($this->active == 'Y') {
			return 'Yes';
		}
		return 'No';
	}
*/
}
