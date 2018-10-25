package bean;

public class EmpVo {

	String employee_id;
	String first_name;
	String phone_number;
	String email;
	int salary;
	
	String strSal;				// 소숫점이 포함된 salary

	
	/*
	 * Gettes and Seteers
	 */
	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
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

	public String getStrSal() {
		return strSal;
	}

	public void setStrSal(String strSal) {
		this.strSal = strSal;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
