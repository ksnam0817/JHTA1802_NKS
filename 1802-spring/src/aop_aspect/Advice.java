package aop_aspect;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class Advice{
	
	SimpleDateFormat sdf = 
			new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");
	
	public String log() {
		String log = sdf.format(new Date());
		return log;
	}

	public Object before(JoinPoint point) {
		String log = log();
		System.out.println(log);
		return "befor advice : " + log;
	}
	
	public Object after(JoinPoint point) {
		String log = log();
		System.out.println(log);
		return "after advice : " + log;
	}
	
	public Object around(ProceedingJoinPoint point) {
		String log = "";
		try {
			log = log() + "\n";
			//실제로 사용자가 호출 메서드 실행
			String rs = (String)point.proceed() + "\n";
			log += rs + log();
		}catch(Exception ex) {
			log = ex.toString();
		}finally {
			return log;
		}
	}
	
	
}

	










