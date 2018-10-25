package di_autowire;

// 필드의 유형에 맞는 빈을 자동으로 찾아 DI해줌
public class AutowireByType {
	Data d1;
	
	public void setABC(Data d) {
		this.d1 = d;
		System.out.println(d);
	}
}
