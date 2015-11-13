<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;


class RegisterForm extends Form
{

    public function initialize($entity = null, $options = null)
    {
        //姓名
        $name = new Text('name');
        $name->setLabel('姓 名');
        $name->setFilters(array('striptags', 'string'));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入使用者的姓名'
            ))
        ));
        $this->add($name);

        //用户名
        $name = new Text('username');
        $name->setLabel('用户名');
        $name->setFilters(array('alpha'));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入用户名'
            ))
        ));
        $this->add($name);

        //邮箱
        $email = new Text('email');
        $email->setLabel('邮 箱');
        $email->setFilters('email');
        $email->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入邮箱'
            )),
            new Email(array(
                'message' => '不是有效的邮箱'
            ))
        ));
        $this->add($email);

        //密码
        $password = new Password('password');
        $password->setLabel('密 码');
        $password->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入密码'
            ))
        ));
        $this->add($password);

        //确认密码
        $repeatPassword = new Password('repeatPassword');
        $repeatPassword->setLabel('二次密码');
        $repeatPassword->addValidators(array(
            new PresenceOf(array(
                'message' => '请再次输入密码'
            ))
        ));
        $this->add($repeatPassword);
    }
}