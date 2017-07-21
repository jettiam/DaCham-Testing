package com.wdb3a.dacham.bean;

import java.sql.Date;

public class Measure {
private String id;
private int lowBooldP;
private int highBooldP;
private int lowBooldS;
private int highBooldS;
private int reading;
private String measureICode;
private String measureUnit;
private String measureName;
private Date measureDate;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getLowBooldP() {
	return lowBooldP;
}
public void setLowBooldP(int lowBooldP) {
	this.lowBooldP = lowBooldP;
}
public int getHighBooldP() {
	return highBooldP;
}
public void setHighBooldP(int highBooldP) {
	this.highBooldP = highBooldP;
}
public int getLowBooldS() {
	return lowBooldS;
}
public void setLowBooldS(int lowBooldS) {
	this.lowBooldS = lowBooldS;
}
public int getHighBooldS() {
	return highBooldS;
}
public void setHighBooldS(int highBooldS) {
	this.highBooldS = highBooldS;
}
public int getReading() {
	return reading;
}
public void setReading(int reading) {
	this.reading = reading;
}
public String getMeasureICode() {
	return measureICode;
}
public void setMeasureICode(String measureICode) {
	this.measureICode = measureICode;
}
public String getMeasureUnit() {
	return measureUnit;
}
public void setMeasureUnit(String measureUnit) {
	this.measureUnit = measureUnit;
}
public String getMeasureName() {
	return measureName;
}
public void setMeasureName(String measureName) {
	this.measureName = measureName;
}
public Date getMeasureDate() {
	return measureDate;
}
public void setMeasureDate(Date measureDate) {
	this.measureDate = measureDate;
}
}