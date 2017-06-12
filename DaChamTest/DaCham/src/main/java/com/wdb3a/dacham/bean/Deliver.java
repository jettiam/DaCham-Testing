package com.wdb3a.dacham.bean;

import java.sql.Date;

public class Deliver {
	private int foodMICode;
	private int foodMCode;
	private String foodMName;
	private int inAmount;
	private Date inDate;
	private int outAmount;
	private String uint;
	private int price;
	private Date exDate;
	private String foodMImg;
	private String searchType;
	private String keyword;
	
	
	public int getFoodMICode() {
		return foodMICode;
	}
	public void setFoodMICode(int foodMICode) {
		this.foodMICode = foodMICode;
	}
	public int getFoodMCode() {
		return foodMCode;
	}
	public void setFoodMCode(int foodMCode) {
		this.foodMCode = foodMCode;
	}
	public String getFoodMName() {
		return foodMName;
	}
	public void setFoodMName(String foodMName) {
		this.foodMName = foodMName;
	}
	public int getInAmount() {
		return inAmount;
	}
	public void setInAmount(int inAmount) {
		this.inAmount = inAmount;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public int getOutAmount() {
		return outAmount;
	}
	public void setOutAmount(int outAmount) {
		this.outAmount = outAmount;
	}
	public String getUint() {
		return uint;
	}
	public void setUint(String uint) {
		this.uint = uint;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getExDate() {
		return exDate;
	}
	public void setExDate(Date exDate) {
		this.exDate = exDate;
	}
	public String getFoodMImg() {
		return foodMImg;
	}
	public void setFoodMImg(String foodMImg) {
		this.foodMImg = foodMImg;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
