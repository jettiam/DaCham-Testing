package com.wdb3a.dacham.bean;

import java.sql.Date;

public class FoodMInven {
	private String foodMICode;
	private String foodMCode;
	private String foodMName;
	private int foodMAmount;
	private double inAmount;
	private Date inDate;
	private int outAmount;
	private String unit;
	private int price;
	private Date exDate;
	private int stock;
	private String keyword;
	private String searchType;
	private Date orderDate;
	private int foodMStatus;
	private String foodMCheck; 
	
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getFoodMICode() {
		return foodMICode;
	}
	public void setFoodMICode(String foodMICode) {
		this.foodMICode = foodMICode;
	}
	public String getFoodMCode() {
		return foodMCode;
	}
	public void setFoodMCode(String foodMCode) {
		this.foodMCode = foodMCode;
	}
	public String getFoodMName() {
		return foodMName;
	}
	public void setFoodMName(String foodMName) {
		this.foodMName = foodMName;
	}
	public int getFoodMAmount() {
		return foodMAmount;
	}
	public void setFoodMAmount(int foodMAmount) {
		this.foodMAmount = foodMAmount;
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
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	public void setPrice(double price) {
		this.price = (int)price;
	}
	public Date getExDate() {
		return exDate;
	}
	public void setExDate(Date exDate) {
		this.exDate = exDate;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
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
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getFoodMStatus() {
		return foodMStatus;
	}
	public void setFoodMStatus(int foodMStatus) {
		this.foodMStatus = foodMStatus;
		if(foodMStatus==0){
			this.foodMCheck = "미완료";
		}else{
			this.foodMCheck = "완료";
		}
	}
	public String getFoodMCheck() {
		return foodMCheck;
	}
	public void setFoodMCheck(String foodMCheck) {
		this.foodMCheck = foodMCheck;	
	}
	public double getInAmount() {
		return inAmount;
	}
	public void setInAmount(double inAmount) {
		this.inAmount = Math.round(inAmount*100d) / 100d;
	}
	
	
	
	
	
}
