package db_myba;

public class EmpVo {
	int    employee_id;
	String first_name;
	String phone_number;
	int    salary;
	
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
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
	
	public String toStringConsole() {
		String str = String.format("%-10s%-15s%-20s%10d", employee_id, first_name, phone_number, salary);
		return str;
	}
	
	public String toStringHTML() {
		StringBuffer sb = new StringBuffer();
		sb.append("<div>");
		sb.append("<span>"  + employee_id  + "</span>");
		sb.append("<span>"   + first_name   + "</span>");
		sb.append("<span>"   + phone_number + "</span>");
		sb.append("<span>"  + salary       + "</span>");
		sb.append("</div>");
		
		return sb.toString();
	}
	
	
	public String toStringJSON() {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("'eid' : '"  + employee_id  + "',");
		sb.append("'fn'  : '"  + first_name   + "',");
		sb.append("'ph'  : '"  + phone_number + "',");
		sb.append("'sal' : '"  + salary       + "'");
		sb.append("}");
		
		return sb.toString();
	}
	
	public String toStringXML() {
		StringBuffer sb = new StringBuffer();
		sb.append("<emp>");
		sb.append("<eid>"  + employee_id  + "</eid>");
		sb.append("<fn>"   + first_name   + "</fn>");
		sb.append("<ph>"   + phone_number + "</fn>");
		sb.append("<sal>"  + salary       + "</sal>");
		sb.append("</emp>");
		
		return sb.toString();
	}
	

}
