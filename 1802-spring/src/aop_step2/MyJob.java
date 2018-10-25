package aop_step2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MyJob {
	public MyJob() {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("src/aop_step2/aop.xml");
		Main main = context.getBean("main", Main.class);
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
}
