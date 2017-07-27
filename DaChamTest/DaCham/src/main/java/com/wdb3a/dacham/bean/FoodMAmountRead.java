package com.wdb3a.dacham.bean;

public class FoodMAmountRead {
	private String foodMName;
	private int price;
	private int foodMAmount;
	private String unit;
	private String foodMCode;
	private int orderCode;
	private String totalAmount;
	private String inAmount;
	
	
	public String getInAmount() {
		return inAmount;
	}
	public void setInAmount(String inAmount) {
		this.inAmount = inAmount;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
		this.inAmount = totalAmount;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public String getFoodMName() {
		return foodMName;
	}
	public void setFoodMName(String foodMName) {
		this.foodMName = foodMName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getFoodMAmount() {
		return foodMAmount;
	}
	public void setFoodMAmount(int foodMAmount) {
		this.foodMAmount = foodMAmount;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getFoodMCode() {
		return foodMCode;
	}
	public void setFoodMCode(String foodMCode) {
		this.foodMCode = foodMCode;
	}
	
	
}
