package db_dbcon;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MyJob {
	public MyJob() {
		ApplicationContext factory = 
			new FileSystemXmlApplicationContext("src/db_dbcon/dbcon.xml");
		
		EmpDao dao = (EmpDao)factory.getBean("dao");
		dao.select("ter");
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
	
}
