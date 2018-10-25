package aop_proxy;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MyJob {
	public MyJob() {
		ApplicationContext context =
			new FileSystemXmlApplicationContext(
					"src/aop_proxy/aop_proxy.xml");
		
		Dao dao = (Dao)context.getBean("proxy");
		
		String msg = dao.select();
		System.out.println(msg);
		
		msg = dao.update();
		System.out.println(msg);
	
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
}
