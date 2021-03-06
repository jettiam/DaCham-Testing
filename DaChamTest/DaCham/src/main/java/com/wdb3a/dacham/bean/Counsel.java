package com.wdb3a.dacham.bean;

import java.sql.Date;

public class Counsel {
private int counselCode;
private String counselItemCode;
private String counselItemName;
private String customer;
private String adviser;
private String counselTitle;
private Date counselDate;
private String counselContent;
private String counselRec;
private String address;
private String tel;
private String answer;


public int getCounselCode() {
	return counselCode;
}
public void setCounselCode(int counselCode) {
	this.counselCode = counselCode;
}
public String getCounselItemCode() {
	return counselItemCode;
}
public void setCounselItemCode(String counselItemCode) {
	this.counselItemCode = counselItemCode;
}
public String getCustomer() {
	return customer;
}
public void setCustomer(String customer) {
	this.customer = customer;
}
public String getAdviser() {
	return adviser;
}
public void setAdviser(String adviser) {
	this.adviser = adviser;
}
public String getCounselTitle() {
	return counselTitle;
}
public void setCounselTitle(String counselTitle) {
	this.counselTitle = counselTitle;
}
public Date getCounselDate() {
	return counselDate;
}
public void setCounselDate(Date counselDate) {
	this.counselDate = counselDate;
}
public String getCounselContent() {
	return counselContent;
}
public void setCounselContent(String counselContent) {
	this.counselContent = counselContent;
}
public String getCounselRec() {
	return counselRec;
}
public void setCounselRec(String counselRec) {
	this.counselRec = counselRec;
}
public String getCounselItemName() {
	return counselItemName;
}
public void setCounselItemName(String counselItemName) {
	this.counselItemName = counselItemName;
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
public String getAnswer() {
	return answer;
}
public void setAnswer(String answer) {
	this.answer = answer;
}

}
