package di_step2;

public class Main {
	public Main() {
		Oracle ora = new Oracle(); // 1)
		DB db = new Oracle(); //----- 2)
		
		System.out.println(ora.getName());
		System.out.println(db.getName());
		
	}
	public static void main(String[] args) {
		new Main();

	}

}
