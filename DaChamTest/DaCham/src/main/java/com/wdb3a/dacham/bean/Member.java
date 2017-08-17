package com.wdb3a.dacham.bean;

import java.sql.Date;


public class Member {
	private String id;
	private String passwd;
	private String name;
	
	private String address;
	private String recentlyAddress = "";
	private String tel;
	private String email;
	private String deptCode;
	private String gradeCode;
	private Date joinDate;
	private Date outDate;
	private String photoImg;
	
	private String token;
	
	private String path_e;
	private String education;
	private String salary;
	private String bank_name;
	private String bank_user;
	private String Account_Number;
	private Date birthday;
	private int diseaseCode;
	private String keyword;
	private String searchType;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}



	public String getPath_e() {
		return path_e;
	}


	public void setPath_e(String path_e) {
		this.path_e = path_e;
	}


	public String getEducation() {
		return education;
	}


	public void setEducation(String education) {
		this.education = education;
	}


	public String getSalary() {
		return salary;
	}


	public void setSalary(String salary) {
		this.salary = salary;
	}


	public String getBank_name() {
		return bank_name;
	}


	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}


	public String getBank_user() {
		return bank_user;
	}


	public void setBank_user(String bank_user) {
		this.bank_user = bank_user;
	}


	public String getAccount_Number() {
		return Account_Number;
	}


	public void setAccount_Number(String account_Number) {
		Account_Number = account_Number;
	}


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


	public String getToken() {
		return token;
	}


	public void setToken(String token) {
		this.token = token;
	}


	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public int getDiseaseCode() {
		return diseaseCode;
	}


	public void setDiseaseCode(int diseaseCode) {
		this.diseaseCode = diseaseCode;
	}
	public String getRecentlyAddress() {
		return recentlyAddress;
	}
	public void setRecentlyAddress(String recentlyAddress) {
		this.recentlyAddress = recentlyAddress;
	}
}
