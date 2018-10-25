package db_dbcon;

import java.sql.ResultSet;
import java.util.List;

public class EmpDao {
	DB db;
	
	public EmpDao(DB db) {
		this.db = db;
		
		if(db.getConn() != null) {
			System.out.println("connection 성공!!!");
		}else {
			System.out.println("connection 실패");
		}
		
	}
	
	public void select(String findStr) {
		//select() test
		List<EmpVo> list = db.select(findStr);
		for(EmpVo v : list) {
			System.out.println(v.toStringConsole());
		}
	}
}
