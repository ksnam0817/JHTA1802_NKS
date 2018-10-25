package di_step3;

public class MsSql implements DB{
	String name="ms-sql";

	@Override
	public String getName() {
		return name;
	}
	
}
