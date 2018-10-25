package bean;

public class EmpVo {
	/*
	 * 필드 (myBatis사용을 고려하여 DB컬럼과 자료형, 이름이 같게 한다)
	 */
	String employee_id;
	String first_name;
	String phone_number;
	String hire_date;
	int salary;
	
	
	/*
	 * Getters, Setters
	 */
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getHire_date() {
		return hire_date;
	}
	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}
	
} // End of Class
