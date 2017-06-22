package com.wdb3a.dacham.bean;

public class Cook {
	private String sideDName;
	private int dietAmount;
	private int orderItemCode;
	private int orderCode;
	private String orderItemName;
	
	
	public String getOrderItemName() {
		return orderItemName;
	}
	public void setOrderItemName(String orderItemName) {
		this.orderItemName = orderItemName;
	}
	public String getSideDName() {
		return sideDName;
	}
	public void setSideDName(String sideDName) {
		this.sideDName = sideDName;
	}
	public int getDietAmount() {
		return dietAmount;
	}
	public void setDietAmount(int dietAmount) {
		this.dietAmount = dietAmount;
	}
	public int getOrderItemCode() {
		return orderItemCode;
	}
	public void setOrderItemCode(int orderItemCode) {
		this.orderItemCode = orderItemCode;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	
	
}
