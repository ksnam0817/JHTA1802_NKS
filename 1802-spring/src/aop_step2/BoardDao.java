package aop_step2;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDao implements Dao {
	
	@Override
	public String select() {
		System.out.println("게시판에서 select문 실행-------");
		return null;
	}

	@Override
	public String update() {
		System.out.println("게시판에서 update문 실행-------");
		return null;
	}

	@Override
	public String delete() {
		System.out.println("게시판에서 delete문 실행-------");
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
