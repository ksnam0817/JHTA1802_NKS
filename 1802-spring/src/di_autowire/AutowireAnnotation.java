package di_autowire;

import org.springframework.beans.factory.annotation.Autowired;

public class AutowireAnnotation {
	
	Data data;
	
	@Autowired
	// @Autowired의 주입형태는 byType에 의한 DI
	public void setData(Data d) {
		this.data = d;
		System.out.println(d);
	}
}
