/*
 * Board테이블의 1개 row를 저장하는 Vo 객체
 */

package bean;

public class BoardVo {
	/*
	 * 필드
	 */
	int serial = 0;
	String mdate = "";
	String id = "";
	String pwd = "";
	String subject = "";
	String doc = "";
	
	int hit = 0;
	int grp = 0;
	String deep = "";
	String attfile = "";
	String fileOri = "";
	
	int num = 0;			// rownum
	
	/*
	 * Getter/Setter
	 */
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate.substring(0, 10);
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public String getDeep() {
		return deep;
	}
	public void setDeep(String deep) {
		this.deep = deep;
	}
	public String getAttfile() {
		return attfile;
	}
	public void setAttfile(String attfile) {
		this.attfile = attfile;
	}
	public String getFileOri() {
		return fileOri;
	}
	public void setFileOri(String fileOri) {
		this.fileOri = fileOri;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	
	
	
	
} // End of BoardVo
