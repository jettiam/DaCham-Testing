package com.wdb3a.dacham.bean;

public class Emp {
	private String emp_id;
	private String emp_pw;
	private String emp_name;
	private String dept;
	
	public String toString() { //체킹용 함수 나중에 없앨 것.
		return "emp_id = "+emp_id+
				", emp_pw = "+emp_pw+
				", emp_name = "+emp_name+
				", dept = "+dept;
	}
	
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_pw() {
		return emp_pw;
	}
	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
}
