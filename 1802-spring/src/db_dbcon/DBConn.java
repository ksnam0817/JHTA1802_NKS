package db_dbcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DBConn implements DB{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String dbUrl  = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbUser = "hr";
	String dbPwd  = "hr";
	
	Connection conn;
	
	PreparedStatement ps;
	ResultSet rs;
	
	SqlSession s;
	public DBConn() {
		try{
			// driver loading
			synchronized (this) {
				Class.forName(driver);
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		
	}
	
	@Override
	public Connection getConn() {
		return conn;
	}
	

	@Override
	public List<EmpVo> select(String findStr) {
		List<EmpVo> list = new ArrayList<>();
		String sql = "select * from employees where first_name like ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				EmpVo v = setVo(rs);
				list.add(v);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
