package aop_step1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDao implements Dao {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");

	@Override
	public String select() {
		System.out.println("게시판에서 select문 실행-------");
		System.out.println(sdf.format(new Date()));
		return null;
	}

	@Override
	public String update() {
		System.out.println("게시판에서 update문 실행-------");
		System.out.println(sdf.format(new Date()));
		return null;
	}

	@Override
	public String delete() {
		System.out.println("게시판에서 delete문 실행-------");
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
