package bean;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardVo {
	int serial =1;
	int hit = 0;
	int pSerial = 1;
	int cnt = 0;
	
	String mdate = "";
	String worker = "";
	String subject = "";
	String content = "";
	String pwd = "";
	
	Map<String, String> attFiles = new HashMap<String, String>();
	String[] delFiles = new String[1];
	List<BoardAttVo> attList;
	
	public String toString(String title) {
		StringBuilder sb = new StringBuilder();
		
		sb.append("-----------------------------------\n");
		sb.append(title + "BoardVo......\n" );
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
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public List<BoardAttVo> getAttList() {
		return attList;
	}
	public void setAttList(List<BoardAttVo> attList) {
		this.attList = attList;
	}
	public Map<String, String> getAttFiles() {
		return attFiles;
	}
	public void setAttFiles(Map<String, String> attFiles) {
		this.attFiles = attFiles;
	}
	public String[] getDelFiles() {
		return delFiles;
	}
	public void setDelFiles(String[] delFiles) {
		this.delFiles = delFiles;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getpSerial() {
		return pSerial;
	}
	public void setpSerial(int pSerial) {
		this.pSerial = pSerial;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getWorker() {
		return worker;
	}
	public void setWorker(String worker) {
		this.worker = worker;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
