package aop_step1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MyJob {
	public MyJob() {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("src/aop_step1/aop.xml");
		Dao dao = context.getBean("boardDao", BoardDao.class);
		dao.select();
		dao.update();
		
		Main main = context.getBean("main", Main.class);
		main.getBoardDao().select();
		main.getMemberDao().select();
		
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
}
