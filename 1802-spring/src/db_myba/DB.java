package db_myba;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.List;

public interface DB {
	//public Connection getConn();
	String update(EmpVo vo);
	String insert(EmpVo vo);
	String repl(EmpVo vo);
	String delete(int serial);
	EmpVo  view(int serial);
	EmpVo  setVo(ResultSet rs) throws Exception;
	List<EmpVo> select(String findStr);
}
