package di_autowire;

//DI를 xml의 아이디와 필드의 이름과 동일한 bean을
//자동으로 주입 처리하는 방식
//메서드를 통한 자동 주입
public class AutowireByName {
	Data data;
	
	
	public void setData(Data d) {
		this.data = d;
		System.out.println(d);
	}
}
