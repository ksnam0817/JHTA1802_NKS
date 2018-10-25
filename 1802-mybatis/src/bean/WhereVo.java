package bean;

public class WhereVo {
	/*
	 * 필드 (myBatis사용을 고려하여 DB컬럼과 자료형, 이름이 같게 한다)
	 */
	String first_name;
	String hire_year;
	
	/*
	 * Getters, Setters
	 */
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getHire_year() {
		return hire_year;
	}
	public void setHire_year(String hire_year) {
		this.hire_year = hire_year;
	}
	
	
	
} // End of Class
