package aop_anno;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDao implements Dao {
	
	@Override
	public String select() {
		String rs = ("게시판에서 select문 실행-------");
		return rs;
	}

	@Override
	public String update() {
		String rs = ("게시판에서 update문 실행-------");
		return rs;
	}

	@Override
	public String delete() {
		String rs = ("게시판에서 delete문 실행-------");
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
