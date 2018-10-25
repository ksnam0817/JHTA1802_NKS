package i18n;

import java.util.Locale;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyJob {
	public MyJob() {
		String[] config = new String[] { "i18n/i18n_message.xml" };
		ApplicationContext context =
				new ClassPathXmlApplicationContext(config);
		
		// 현재 사용자의 지역정보를 기준으로 메시지를 출력
		Locale locale = Locale.getDefault();
		
		String menu = context.getMessage("menu", new Object[0], locale);
		System.out.println(menu);
		
		//클래스를 직접 핸들링 하는 경우
		MessageSourceEx ex = (MessageSourceEx)context.getBean("source");
		ex.getMenu("menu", locale);
		ex.getMenu("jjajang", locale);
		ex.getMenu("jjampong", locale);
	
		// 영어로 메뉴보기
		locale = Locale.ENGLISH;
		ex.getMenu("menu", locale);
		ex.getMenu("jjajang", locale);
		ex.getMenu("jjampong", locale);
		
		
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
}
