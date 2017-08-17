package com.wdb3a.dacham.bean;

public class FoodMAmountRead {
	private String foodMName;
	private int price;
	private double foodMAmount;
	private String unit;
	private String foodMCode;
	private int orderCode;
	private double totalAmount;
	private double inAmount;
	
	
	public double getInAmount() {
		return inAmount;
	}
	public void setInAmount(double inAmount) {
		this.inAmount = inAmount;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = Math.round(totalAmount*1000d)/1000d;
		this.inAmount = Math.round(totalAmount*1000d)/1000d; 
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
	public double getFoodMAmount() {
		return foodMAmount;
	}
	public void setFoodMAmount(double foodMAmount) {
		this.foodMAmount =  Math.round(foodMAmount*1000d)/1000d;
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
