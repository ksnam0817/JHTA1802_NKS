package aop_step2;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDao implements Dao {

	@Override
	public String select() {
		System.out.println("select 문 실행......");
		return null;
	}

	@Override
	public String update() {
		System.out.println("update 문 실행.......");
		return null;
	}

	@Override
	public String delete() {
		System.out.println("delete 문 실행..........");
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
