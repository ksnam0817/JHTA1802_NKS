package di_step2;

public class MySql implements DB{
	String databaseName = "my sql";

	@Override
	public String getName() {
		return databaseName;
	}
}
