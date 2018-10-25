package bean;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

//메일전송에 사용되는 계정의 정보
public class BrdMyAuthenticator extends Authenticator{
	PasswordAuthentication pa;

	public PasswordAuthentication getPasswordAuthentication() {
		String user = "hipwg@naver.com";
		String pwd  = "hipwg7737";
		pa = new PasswordAuthentication(user, pwd);
				
		return pa;
	}

	
	
}
