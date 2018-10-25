package aop_proxy;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class Advice implements MethodInterceptor{
	
	SimpleDateFormat sdf = 
			new SimpleDateFormat("yyyy-MM-dd(E요일) hh:mm:ss:SS");
	
	public String log() {
		String log = sdf.format(new Date());
		return log;
		
	}
	
	/* Spring의 AOP(proxy)에 의해서 지정된 메서드가 실행되면
	 * 자동으로 호출됨. 실행되어야 할 메서드 정보는 invoke의 매개변수인
	 * MethodInvocation을 타고 들어옴
	 */

	@Override
	public Object invoke(MethodInvocation invoc) throws Throwable {
		String msg = "log : " + log() + "\n";
		String methodName = "method name :" + invoc.getMethod().getName() + "\n";
		String rs = "실행 결과 : " + (String)invoc.proceed() + "\n";
		
		return msg + methodName + rs;
	}
}






