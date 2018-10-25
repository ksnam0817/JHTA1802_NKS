package db_myba;

import java.sql.ResultSet;
import java.util.List;


public class EmpDao {
	DB db;
	
	public EmpDao(DB db) {
		this.db = db;
	}
	
	public void select(String findStr) {
		//select() test
		List<EmpVo> list = db.select(findStr);
		for(EmpVo v : list) {
			System.out.println(v.toStringConsole());
		}
	}
}
