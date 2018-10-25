package di_autowire;

// byName과 byType에 의해서 자동으로 주입될 클래스
public class Data {
	String id;
	String pwd;
	
	public Data(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}
	
	@Override
	public String toString() {
		return "id=" + id + ", pwd=" + pwd; 
	}
}
