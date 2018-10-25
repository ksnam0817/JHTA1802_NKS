package aop_anno;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class Advice{
	
	SimpleDateFormat sdf = 
			new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");
	
	public String log() {
		String log = sdf.format(new Date());
		return log;
	}

	@Before("execution(* select(..))")
	public Object before(JoinPoint point) {
		String log = log();
		System.out.println(log);
		return "befor advice : " + log;
	}
	
	@AfterReturning("execution(* update(..))")
	public Object after(JoinPoint point) {
		String log = log();
		System.out.println(log);
		return "after advice : " + log;
	}
	
	@Around("execution(* delete(..))")
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

	










