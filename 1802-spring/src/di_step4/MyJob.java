package di_step4;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MyJob {

	public MyJob() {
	
		Resource rs = new ClassPathResource("di_step4/assembler.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		
		Main m = (Main)factory.getBean("main");
	}
	
	public static void main(String[] args) {
		new MyJob();
	}
}
