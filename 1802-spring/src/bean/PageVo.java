package bean;

import java.lang.reflect.Field;

public class PageVo {
	String msg      = "";
	String findStr  = "";
	String backPage = "list";
	
	int    startNo = 1;
	int    endNo   = 1;
	int    nowPage = 1;
	
	
	public String toString(String title) {
		StringBuilder sb = new StringBuilder();
		
		sb.append("-----------------------------------\n");
		sb.append(title + "ParamVo......\n" );
		sb.append("-----------------------------------\n");
		
		
		
		Field[] fields = this.getClass().getDeclaredFields();
		sb.append("length : " + fields.length+ "\n");
		for(Field f : fields) {
			try {
				sb.append(f.getName() + ":" + f.get(this) );
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			sb.append("\n");
		}
		return sb.toString();
	}	
	
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	public String getBackPage() {
		return backPage;
	}
	public void setBackPage(String backPage) {
		this.backPage = backPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	

	
	
}
