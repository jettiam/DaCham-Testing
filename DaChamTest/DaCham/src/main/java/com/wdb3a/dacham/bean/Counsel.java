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

}
