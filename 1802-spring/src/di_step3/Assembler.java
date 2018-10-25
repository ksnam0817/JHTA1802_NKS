package di_step3;

//사용하려는 DB를 생성하여 리턴
//각회사의 개발자들에겐 open
public class Assembler {
	public DB getDB() {
		DB db = new MySql();
		return db;
	}
	
}
