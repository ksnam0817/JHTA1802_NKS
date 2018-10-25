package db_myba;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DBConn implements DB{
	SqlSession s;
	public DBConn(MybaFactory mf) {
		this.s = mf.getFactory().openSession();
	}
	
	@Override
	public List<EmpVo> select(String findStr) {
		List<EmpVo> list = s.selectList("emp.select2", "%"+"ter"+"%");
		return list;
	}

	@Override
	public String update(EmpVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert(EmpVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EmpVo view(int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String repl(EmpVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EmpVo setVo(ResultSet rs) throws Exception {
		EmpVo v = new EmpVo();
		v.setEmployee_id(rs.getInt("employee_id"));
		v.setFirst_name(rs.getString("first_name"));
		v.setPhone_number(rs.getString("phone_number"));
		v.setSalary(rs.getInt("salary"));
				
		return v;
	}

}
