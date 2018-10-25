package di_step3;

public class Main {
	public Main(DB db) {
		
		System.out.println(db.getName());
		
	}
	public static void main(String[] args) {
		Assembler as = new Assembler();
		new Main(as.getDB());

	}

}
