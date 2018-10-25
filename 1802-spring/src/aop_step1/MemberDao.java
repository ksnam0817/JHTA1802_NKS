package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDao implements Dao {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");
	@Override
	public String select() {
		System.out.println("select 문 실행......");
		System.out.println(sdf.format(new Date())); //횡단적 관심사
		return null;
	}

	@Override
	public String update() {
		System.out.println("update 문 실행.......");
		System.out.println(sdf.format(new Date()));
		return null;
	}

	@Override
	public String delete() {
		System.out.println("delete 문 실행..........");
		System.out.println(sdf.format(new Date()));
		return null;
	}

	@Override
	public String view() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String repl() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert() {
		// TODO Auto-generated method stub
		return null;
	}

}
