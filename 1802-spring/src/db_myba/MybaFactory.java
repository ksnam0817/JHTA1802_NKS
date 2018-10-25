package db_myba;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//java bean에서 사용하던 DBConnection 클래스 역활
public class MybaFactory {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader r = 
				Resources.getResourceAsReader("mybatis_config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}



