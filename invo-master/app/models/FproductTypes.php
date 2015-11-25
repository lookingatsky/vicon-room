<?php

class FproductTypes extends Phalcon\Mvc\Model
{
    /**
     * @var integer
     */
    public $id;

    /**
     * @var string
     */
    public $name;

    public function initialize()
    {
		$this->setConnectionService('customersystem');
        $this->hasMany('id', 'Fproducts', 'product_types_id', array(
        	'foreignKey' => array(
        		'message' => 'Product Type cannot be deleted because it\'s used on Products'
        	)
        ));
    }
	
	public function getSource(){
		return "product_types";
		
	}
}
