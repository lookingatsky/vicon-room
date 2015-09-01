<?php
/**
 * 邮件类
 */
//namespace App\Plugin;
use Phalcon\Logger\Adapter\File as FileAdapter;
use Phalcon\Config\Adapter\Ini as ConfigIni;

class Mail{
    public function __construct(){
		$config = new ConfigIni(APP_PATH . 'app/config/mail.ini');
		$this->mail_from = $config->mail->from;
        $this->mail_user = $config->mail->user;
        $this->mail_password = $config->mail->password;
        $this->smtp_server = $config->mail->smtp_server;
        $this->smtp_port = $config->mail->smtp_port;
        $this->sitename = $config->mail->site_name;
    }
	
	
    /**
     * 邮件发送
     * @param $toemail 收件人
     * @param $subject 发件标题
     * @param $email_message 发件内容
     * <code>
     * $mail = new \App\Plugin\Mail();
     * $mail->smtp('2483175666@qq.com','Have a try','This is test content');
     * </code>
     */
    public function smtp($toemail,$subject,$email_message) {
    	$email_from = '=?utf-8?B?'.base64_encode($this->sitename)."?= <".$this->mail_from.">";
    	$email_subject = '=?utf-8?B?'.base64_encode(preg_replace("/[\r|\n]/", '', '['.$this->sitename.'] '.$subject)).'?=';
        $headers = "From: $email_from \r\nX-Priority: 3 \r\n X-Mailer: Chairsma \r\n MIME-Version: 1.0 \r\n Content-type: text/html\r\n charset=utf-8 \r\n Content-Transfer-Encoding: base64 \r\n ";
        $log = new FileAdapter(LOGS_PATH.'mail_'.date('Ymd').'.log');
    	if(!$fp = pfsockopen($this->smtp_server, $this->smtp_port, $errno, $errstr, 30)) {
    	    $log->error('('.$this->smtp_server.':'.$this->smtp_port.') CONNECT - Unable to connect to the SMTP server');
    		return false;
    	}
    	stream_set_blocking($fp, true);
    	$lastmessage = fgets($fp, 512);
    	if(substr($lastmessage, 0, 3) != '220') {
    	   $log->error('('.$this->smtp_server.':'.$this->smtp_port.") CONNECT - $lastmessage");
    	   return false;
    	}
        fputs($fp,"HELO Charisma\r\n");
    	$lastmessage = fgets($fp, 512);
    	if(substr($lastmessage, 0, 3) != 220 && substr($lastmessage, 0, 3) != 250) {
    	   $log->error('('.$this->smtp_server.':'.$this->smtp_port.") Charisma - $lastmessage");
   		   return false;
    	}
    	while(1) {
    		if(substr($lastmessage, 3, 1) != '-' || empty($lastmessage)) {
    			break;
    		}
    		$lastmessage = fgets($fp, 512);
    	}
        fputs($fp, "AUTH LOGIN\r\n");
		$lastmessage = fgets($fp, 512);
		if(substr($lastmessage, 0, 3) != 334) {
			$log->error('('.$this->smtp_server.':'.$this->smtp_port.") AUTH LOGIN - $lastmessage");
			return false;
		}
		fputs($fp, base64_encode($this->mail_user)."\r\n");
		$lastmessage = fgets($fp, 512);
		if(substr($lastmessage, 0, 3) != 334) {
            $log->error('('.$this->smtp_server.':'.$this->smtp_port.") USERNAME - $lastmessage");
			return false;
		}
		fputs($fp, base64_encode($this->mail_password)."\r\n");
		$lastmessage = fgets($fp, 512);
		if(substr($lastmessage, 0, 3) != 235) {
            $log->error('('.$this->smtp_server.':'.$this->smtp_port.") PASSWORD - $lastmessage");
			return false;
		}
    	fputs($fp, "MAIL FROM: <".preg_replace("/.*\<(.+?)\>.*/", "\\1", $email_from).">\r\n");
    	$lastmessage = fgets($fp, 512);
    	if(substr($lastmessage, 0, 3) != 250) {
    		fputs($fp, "MAIL FROM: <".preg_replace("/.*\<(.+?)\>.*/", "\\1", $email_from).">\r\n");
    		$lastmessage = fgets($fp, 512);
    		if(substr($lastmessage, 0, 3) != 250) {
                $log->error('('.$this->smtp_server.':'.$this->smtp_port.") MAIL FROM - $lastmessage");
    			return false;
    		}
    	}
    	fputs($fp, "RCPT TO: <".preg_replace("/.*\<(.+?)\>.*/", "\\1", $toemail).">\r\n");
    	$lastmessage = fgets($fp, 512);
    	if(substr($lastmessage, 0, 3) != 250) {
    		fputs($fp, "RCPT TO: <".preg_replace("/.*\<(.+?)\>.*/", "\\1", $toemail).">\r\n");
    		$lastmessage = fgets($fp, 512);
            $log->error('('.$this->smtp_server.':'.$this->smtp_port.") RCPT TO - $lastmessage");
    		return false;
    	}
    	fputs($fp, "DATA\r\n");
    	$lastmessage = fgets($fp, 512);
    	if(substr($lastmessage, 0, 3) != 354) {
    		$log->error('('.$this->smtp_server.':'.$this->smtp_port.") DATA - $lastmessage");
    		return false;
    	}
    	fputs($fp, "Date: ".gmdate('r')."\r\n");
        $info = "\r\n发送时间：".date('Y-m-d H:i:s')."\r\n";
        $info .= '发件人：'.$this->mail_from."\r\n";
    	fputs($fp, "To: ".$toemail."\r\n");
        $info .= '收件人：'.$toemail."\r\n";
    	fputs($fp, "Subject: ".$email_subject."\r\n");
        $info .= '标题：'.$subject."\r\n";
     	fputs($fp, $headers);
    	fputs($fp, "\r\n\r\n");
    	fputs($fp, $email_message."\r\n.\r\n"); 
		
        $info .= '内容：'.$email_message."\r\n";
    	$lastmessage = fgets($fp, 512);
    	if(substr($lastmessage, 0, 3) != 250) {
            $log->error('('.$this->smtp_server.':'.$this->smtp_port.") END - $lastmessage");
    	}
    	fputs($fp, "QUIT\r\n");
        $log->log($info);
    	return true;
    }
    
    /**
     * 邮件接收
     * <code>
     * $mail = new \App\Plugins\Mail();
     * $list = $mail->pop();
     * </code>
     */
    public function pop(){
        
    }
}