package com.wdb3a.dacham.bean;

import java.sql.Date;


public class Member {
	private String id;
	private String passwd;
	private String name;
	
	private String address;
	private String tel;
	private String email;
	private String deptCode;
	private String gradeCode;
	private Date joinDate;
	private Date outDate;
	private String photoImg;
	
	public Date getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}


	public Date getOutDate() {
		return outDate;
	}


	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getDeptCode() {
		return deptCode;
	}


	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}


	public String getGradeCode() {
		return gradeCode;
	}


	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}




	public String getPhotoImg() {
		return photoImg;
	}


	public void setPhotoImg(String photoImg) {
		this.photoImg = photoImg;
	}


	public String toString(){
		return "id: "+id+", pw: "+passwd+", name: "+name;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
