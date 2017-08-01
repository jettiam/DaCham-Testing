package com.wdb3a.dacham.bean;

import java.sql.Date;

public class FoodMInven {
	private String foodMICode;
	private String foodMCode;
	private String foodMName;
	private double foodMAmount;
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
	private int foodMCheck1;
	private int foodMCheck2;
	private double totalAmount;	
	 
	

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

	public double getInAmount() {
		return inAmount;
	}
	public void setInAmount(double inAmount) {
		this.inAmount = Math.round(inAmount*1000d)/1000d;
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
	public int getFoodMCheck1() {
		return foodMCheck1;
	}
	public void setFoodMCheck1(int foodMCheck1) {
		this.foodMCheck1 = foodMCheck1;
	}
	public int getFoodMCheck2() {
		return foodMCheck2;
	}
	public void setFoodMCheck2(int foodMCheck2) {
		this.foodMCheck2 = foodMCheck2;
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
		if(foodMStatus==0){
			this.foodMCheck = "�̿Ϸ�";
		}else{
			this.foodMCheck = "�Ϸ�";
		}
		this.foodMStatus = foodMStatus;
	}
	public String getFoodMCheck() {
		return foodMCheck;
	}
	public void setFoodMCheck(String foodMCheck) {
		this.foodMCheck = foodMCheck;
	}
	public double getFoodMAmount() {
		return foodMAmount;
	}
	public void setFoodMAmount(double foodMAmount) {
		this.foodMAmount = foodMAmount;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	
	
	
	
	
}
