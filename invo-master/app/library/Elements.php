<?php

/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends Phalcon\Mvc\User\Component
{

    private $_headerMenu = array(
        'pull-left' => array(
            'index' => array(
                'caption' => '首 页',
                'action' => 'index'
            ),
             'invoices' => array(
                'caption' => '系 统',
                'action' => 'index'
            ),
             'help' => array(
                'caption' => '帮助中心',
                'action' => 'index'
            )
        ),
        'pull-right' => array(
			'invoices' => array(
				'caption' => '',
				'action' => 'index'
			),
            'session' => array(
                'caption' => '登 录',
                'action' => 'index'
            ),
			'help' => array(
				'caption' => '帮助中心',
				'action' => 'index'
			)			
        )
    );

    private $fee_tabs = array(
        '行政费控' => array(
            'controller' => 'invoices',
            'action' => 'index',
            'any' => false
        ),
        '部门管理' => array(
            'controller' => 'companies',
            'action' => 'index',
            'any' => true
        ),
        '信息录入' => array(
            'controller' => 'products',
            'action' => 'index',
            'any' => true
        ),
        '类型管理' => array(
            'controller' => 'producttypes',
            'action' => 'index',
            'any' => true
        ),	
        '账户管理' => array(
            'controller' => 'invoices',
            'action' => 'profile',
            'any' => false
        )		
    );
	
    private $service_tabs = array(		
        '客户管理' => array(
            'controller' => 'customer',
            'action' => 'index',
            'any' => true
        ),
        '债权管理' => array(
            'controller' => 'debt',
            'action' => 'index',
            'any' => true
        ),		
        '借款人管理' => array(
            'controller' => 'borrower',
            'action' => 'index',
            'any' => true
        ),	
        '借款管理' => array(
            'controller' => 'loan',
            'action' => 'index',
            'any' => true
        ),	
		'预约管理' => array(
            'controller' => 'appointment',
            'action' => 'index',
            'any' => true
        ),			
        '账户管理' => array(
            'controller' => 'invoices',
            'action' => 'profile',
            'any' => false
        )		
    );

    private $news_tabs = array(		
        '新闻列表' => array(
            'controller' => 'news',
            'action' => 'index',
            'any' => false
        ),
        '新闻类型' => array(
            'controller' => 'news',
            'action' => 'types',
            'any' => false
        ),		
        '初稿列表' => array(
            'controller' => 'news',
            'action' => 'draft',
            'any' => false
        ),
        '产品列表' => array(
            'controller' => 'news',
            'action' => 'product',
            'any' => false
        ),		
		'管理员列表' => array(
            'controller' => 'news',
            'action' => 'members',
            'any' => false
        ),			
        '账户管理' => array(
            'controller' => 'news',
            'action' => 'profile',
            'any' => false
        )		
    );
	
    public function getMenu()
    {

        $auth = $this->session->get('auth');
        if ($auth) {
            $this->_headerMenu['pull-right']['session'] = array(
                'caption' => '退 出',
                'action' => 'end'
            );
            $this->_headerMenu['pull-right']['invoices'] = array(
                'caption' => "欢迎您！ ".$auth['name'],
                'action' => 'profile'
            );	
			if($auth['type'] == "market"){
				$this->_headerMenu['pull-left'] = array(
					'index' => array(
						'caption' => '首 页',
						'action' => 'index'
					),
					 'customer' => array(
						'caption' => '客户管理',
						'action' => 'index'
					),
					 'debt' => array(
						'caption' => '债权管理',
						'action' => 'index'
					),							
					 'borrower' => array(
						'caption' => '借款人管理',
						'action' => 'index'
					),	
					 'loan' => array(
						'caption' => '借款管理',
						'action' => 'index'
					),						
					 'appointment' => array(
						'caption' => '预约管理',
						'action' => 'index'
					),	
				);				
			}	
        } else {
            unset($this->_headerMenu['pull-left']['invoices']);
        }

        echo '<div class="nav-collapse">';
        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
			if($position == "pull-left" && $auth['type'] == "market"){

				echo "<div class='btn-group ".$position."'>";
				echo "<button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown'>";
				echo "客户服务系统";
				echo "<span class='caret'></span>";
				echo "</button>";
				echo "<ul class='dropdown-menu'>";
				foreach ($menu as $controller => $option) {
					if ($controllerName == $controller) {
						echo '<li class="active">';
					} else {
						echo '<li>';
					}
					echo Phalcon\Tag::linkTo($controller.'/'.$option['action'], $option['caption']);
					echo '</li>';					
				}
				echo "</ul>";
				echo "</div>";	
			}else{
				echo '<ul class="nav ', $position, '">';
				foreach ($menu as $controller => $option) {
					if ($controllerName == $controller) {
						echo '<li class="active">';
					} else {
						echo '<li>';
					}
					echo Phalcon\Tag::linkTo($controller.'/'.$option['action'], $option['caption']);
					echo '</li>';
				}
				echo '</ul>';				
			}
        }
        echo '</div>';
    }

    public function getTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
		$auth = $this->session->get('auth');
		if($auth['type'] == "market"){
			$tabs = $this->service_tabs;
		}elseif($auth['type'] == "editor"){
			$tabs = $this->news_tabs;
		}elseif($auth['type'] == "author"){
			$tabs = $this->news_tabs;
		}else{
			$tabs = $this->fee_tabs;
		}	
        foreach ($tabs as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo Phalcon\Tag::linkTo($option['controller'].'/'.$option['action'], $caption), '<li>';
        }
        echo '</ul>';
    }
}
