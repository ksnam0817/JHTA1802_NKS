package di_autowire;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class AutowireMain {
	public AutowireMain() {
		//byName 
		System.out.println("byName에 의한 자동 주입 결과....");
		ApplicationContext factory =
				new FileSystemXmlApplicationContext("src/di_autowire/autowire.xml");
		AutowireByName bean = factory.getBean("byName", AutowireByName.class);
		
		//byType
		System.out.println("byType에 의한 자동 주입 결과.....");
		factory = new FileSystemXmlApplicationContext("src/di_autowire/autowire_type.xml");
		AutowireByType bean2 = factory.getBean("byType", AutowireByType.class);
		
		//annotation
		System.out.println("@Autowired(annotation)에 의한 자동 주입 결과");
		factory = new FileSystemXmlApplicationContext("src/di_autowire/autowire_anno.xml");
		AutowireAnnotation bean3 =
				factory.getBean("anno", AutowireAnnotation.class);
		
		
	}
	
	public static void main(String[] args) {
		new AutowireMain();
	}

}
