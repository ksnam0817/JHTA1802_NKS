package di_step1;

//DI가 전혀 적용되지 않았을 때 외부 환경의 변화가
//내부 환경에 직접적인 영향을 준다.

public class Main {
	public Main() {
		Oracle ora = new Oracle();
		System.out.println(ora.getName());
	}

	public static void main(String[] args) {
		new Main();

	}

}
