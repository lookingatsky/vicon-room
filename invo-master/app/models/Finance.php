<?php

use Phalcon\Mvc\Model;

class Finance extends Model
{
	public $id;

	public $did;

	public $time;

	public $data;

	public function initialize()
	{
		$this->belongsTo('did', 'Department', 'id', array(
			'reusable' => true
		));
	}


/* 	public function getActiveDetail()
	{
		if ($this->active == 'Y') {
			return 'Yes';
		}
		return 'No';
	} */

}
