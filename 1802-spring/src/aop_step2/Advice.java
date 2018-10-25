package aop_step2;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Advice {
	BoardDao boardDao;
	MemberDao memberDao;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");
	
	public Advice(BoardDao bDao, MemberDao mDao) {
		this.boardDao = bDao;
		this.memberDao = mDao;
	}
	
	//advice의 종류
	public void beforeAdvice() {
		System.out.println("before advice.........");
		System.out.println(sdf.format(new Date()));
		boardDao.select();
	}
	
	public void afterAdive() {
		System.out.println("after advice...........");
		boardDao.select();
		System.out.println(sdf.format(new Date()));
	}
	
	public void aroundAdvice() {
		System.out.println("around advice begin...........");
		boardDao.select();
		System.out.println(sdf.format(new Date()));
		System.out.println("around advice end...........");
		
	}
}






