package di_book;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MyJob {

	public MyJob() {
	
		ApplicationContext factory = new FileSystemXmlApplicationContext("src/di_book/book.xml");
		
		MessageBeanImpl m = 
			(MessageBeanImpl)factory.getBean("messageBean");
		
		m.sayHello();
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
}
