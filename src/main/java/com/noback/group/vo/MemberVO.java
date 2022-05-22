package com.noback.group.vo;

/**
 * 회원 정보 VO
 */
public class MemberVO {
	
	private String employee_num;
	private String employee_password;
	private String employee_name;	    
	private String employee_ssn;	
	private String employee_address;	
	private String employee_dep;    
	private String employee_pos;	    
	private String employee_email;	   
	private int employee_level;	   
	private String employee_phone;	    
	private String employee_picture;
	
	
	public MemberVO() {}


	public MemberVO(String employee_num, String employee_password, String employee_name, String employee_ssn,
			String employee_address, String employee_dep, String employee_pos, String employee_email,
			int employee_level, String employee_phone, String employee_picture) {
		super();
		this.employee_num = employee_num;
		this.employee_password = employee_password;
		this.employee_name = employee_name;
		this.employee_ssn = employee_ssn;
		this.employee_address = employee_address;
		this.employee_dep = employee_dep;
		this.employee_pos = employee_pos;
		this.employee_email = employee_email;
		this.employee_level = employee_level;
		this.employee_phone = employee_phone;
		this.employee_picture = employee_picture;
	}


	public String getEmployee_num() {
		return employee_num;
	}


	public void setEmployee_num(String employee_num) {
		this.employee_num = employee_num;
	}


	public String getEmployee_password() {
		return employee_password;
	}


	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}


	public String getEmployee_name() {
		return employee_name;
	}


	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}


	public String getEmployee_ssn() {
		return employee_ssn;
	}


	public void setEmployee_ssn(String employee_ssn) {
		this.employee_ssn = employee_ssn;
	}


	public String getEmployee_address() {
		return employee_address;
	}


	public void setEmployee_address(String employee_address) {
		this.employee_address = employee_address;
	}


	public String getEmployee_dep() {
		return employee_dep;
	}


	public void setEmployee_dep(String employee_dep) {
		this.employee_dep = employee_dep;
	}


	public String getEmployee_pos() {
		return employee_pos;
	}


	public void setEmployee_pos(String employee_pos) {
		this.employee_pos = employee_pos;
	}


	public String getEmployee_email() {
		return employee_email;
	}


	public void setEmployee_email(String employee_email) {
		this.employee_email = employee_email;
	}


	public int getEmployee_level() {
		return employee_level;
	}


	public void setEmployee_level(int employee_level) {
		this.employee_level = employee_level;
	}


	public String getEmployee_phone() {
		return employee_phone;
	}


	public void setEmployee_phone(String employee_phone) {
		this.employee_phone = employee_phone;
	}


	public String getEmployee_picture() {
		return employee_picture;
	}


	public void setEmployee_picture(String employee_picture) {
		this.employee_picture = employee_picture;
	}


	@Override
	public String toString() {
		return "MemberVO [employee_num=" + employee_num + ", employee_password=" + employee_password
				+ ", employee_name=" + employee_name + ", employee_ssn=" + employee_ssn + ", employee_address="
				+ employee_address + ", employee_dep=" + employee_dep + ", employee_pos=" + employee_pos
				+ ", employee_email=" + employee_email + ", employee_level=" + employee_level + ", employee_phone="
				+ employee_phone + ", employee_picture=" + employee_picture + "]";
	}
	
}
	
	

