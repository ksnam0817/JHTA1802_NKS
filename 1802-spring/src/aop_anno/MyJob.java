package aop_anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MyJob {
	public MyJob() {
		ApplicationContext context =
			new FileSystemXmlApplicationContext(
					"src/aop_anno/aop_anno.xml");
		
		Dao dao = (Dao)context.getBean("boardDao");
		
		String msg = dao.select();
		System.out.println(msg);
		
		msg = dao.update();
		System.out.println(msg);
	
		msg = dao.delete();
		System.out.println(msg);
		
		
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
}
