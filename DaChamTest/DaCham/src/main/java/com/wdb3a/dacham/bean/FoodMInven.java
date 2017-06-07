package com.wdb3a.dacham.bean;

import java.sql.Date;

public class FoodMInven {
	private String foodMICode;
	private String foodMCode;
	private String foodMName;
	private int inAmount;
	private Date inDate;
	private int outAmount;
	private String uint;
	private int price;
	private Date exDate;
	private int stock;
	
	
	
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
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
	
	
}
