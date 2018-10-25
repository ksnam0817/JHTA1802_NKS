package aop_proxy;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDao implements Dao {

	@Override
	public String select() {
		String rs = ("MemberDao select 문 실행......");
		return rs;
	}

	@Override
	public String update() {
		String rs = ("MemberDao update 문 실행.......");
		return rs;
	}

	@Override
	public String delete() {
		String rs = ("MemberDao delete 문 실행..........");
		return rs;
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
