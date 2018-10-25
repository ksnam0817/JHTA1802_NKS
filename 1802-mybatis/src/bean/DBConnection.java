package bean;
/*
 * DB에 연결할 Connection을 반환할 목적
 */



import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	// 필드
	String driver = "oracle.jdbc.driver.OracleDriver";			// oracle JDBC 드라이버 문자열 상수
//	String dbUrl = "jdbc:oracle:thin:35.200.86.247:1521:xe";	// GCE (180715)
	String dbUrl = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=35.200.86.247)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=xe)))";	// GCE (180715)


//	String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";	// 쿼리박스에 넣은 내용과 동일
	
	String dbUser = "hr";
	String dbPwd = "hr";
	Connection conn;
	
	// 생성자
	public DBConnection() {
		try {
			// driver loading
			Class.forName(driver);
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	// getter
	public Connection getConn() {
		return conn;
	}
	
}
