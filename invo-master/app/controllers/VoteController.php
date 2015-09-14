<?php
use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;

class VoteController extends ControllerBase
{
    public function initialize()
    {
        //$this->view->setTemplateAfter('main');
        Tag::setTitle('投票');
        parent::initialize();
    }

    public function indexAction()
    {
		if($this->is_weixin()){
			$isWeixin = 1;
		}else{
			$isWeixin = 0;;
		}
		$this->view->setVar("isWeixin",$isWeixin);
				
					$APPID = "wxec3e1348d19af993";
					$SECRET = "3b941879e6467442d4c398b0c2cc99fa";
					$code = $_REQUEST['code'];
					$this->view->setVar("code",$code);
					$test = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$APPID."&secret=".$SECRET;
				
					//$accessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" . $APPID . "&secret=" . $SECRET . "&code=".$code."&grant_type=authorization_code";
					$ch = curl_init($test);
					curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
					curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
					curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 5.1; rv:21.0) Gecko/20100101 Firefox/21.0');
					curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
					$info = curl_exec($ch); 
					$dataJson = json_decode($info, true);
					$this->view->setVar("dataJson",$dataJson);
					
					
					$accessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" . $APPID . "&secret=" . $SECRET . "&code=".$code."&grant_type=authorization_code";
					$ch2 = curl_init($accessTokenUrl);
					curl_setopt($ch2, CURLOPT_CUSTOMREQUEST, "POST");
					curl_setopt($ch2, CURLOPT_RETURNTRANSFER, true);
					curl_setopt($ch2, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 5.1; rv:21.0) Gecko/20100101 Firefox/21.0');
					curl_setopt($ch2, CURLOPT_SSL_VERIFYPEER, false);
					$info2 = curl_exec($ch2); 
					$dataJson2 = json_decode($info2, true);
					
					//$openid = $dataJson['openid'];
					$this->view->setVar("dataJson2",$dataJson2);
					//$this->view->setVar("openid",$openid);
					
					//$refresh_token = "OezXcEiiBSKSxW0eoylIeMmDrGVrRqI4UJHh7hukRNE5t294rK_rtPNW_qAaWFz0e5sAfURNm11eg-KAl9w9QwJ2wXy5kHxiqE51U444-wu2w0gUnZJrKpb8v4SEMNp3hCQ5ty0TayFHCu0ALni2Kg";
				
 					//$ACCESS_TOKEN = "2D6t8FiF6cwngpdwyAvW7A81ruZuWBoJjoqrxn4jF9r7D3VnqGaP9ZYR7sc1KiDW6-cT_xyDtsGHjcsIV8e4zaI-lpY8FPn0Vi5bZcifVZE";
 					$ACCESS_TOKEN = $dataJson['access_token'];
					$OPENID = $dataJson2['openid'];
					$accessTokenUrl_ =  "https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$ACCESS_TOKEN."&openid=".$OPENID."&lang=zh_CN";
					
 					$ch_ = curl_init($accessTokenUrl_);
					curl_setopt($ch_, CURLOPT_CUSTOMREQUEST, "POST");
					curl_setopt($ch_, CURLOPT_RETURNTRANSFER, true);
					curl_setopt($ch_, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 5.1; rv:21.0) Gecko/20100101 Firefox/21.0');
					curl_setopt($ch_, CURLOPT_SSL_VERIFYPEER, false);
					$info_ = curl_exec($ch_);

					$dataJson_ = json_decode($info_, true);
					$this->view->setVar("dataJson_",$dataJson_);   
					
					
					
					
/* 					$userdata = $table->get_subscribe_res($openid);
					$subscribed = $userdata['data']['subscribed'];
					if($subscribed){
						session("openid", $openid); 
					}else{
						$url="http://www.oschina.net/code/step1?catalog=";
						echo $this->assign('url', $url)->fetch('redirect');
						return;
					} */
					//https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxec3e1348d19af993&redirect_uri=http://wap.zhwbchina.com/vote/index&response_type=code&scope=snsapi_base&state=123#wechat_redirect
					//https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID
				
				
    }
	
	private function is_weixin(){ 
		if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
			return true;
		}  
        return false;
	}
}
