package com.wdb3a.dacham.bean;

import java.sql.Date;

public class Cook {
	private String sideDName;
	private int dietAmount;
	private int orderItemCode;
	private int orderCode;
	private String orderItemName;
	private String dietName;
	private String dietImg;
	private Date orderDate;
	private int sideDCode;
	private int cookingAmount;
	
	public int getSideDCode() {
		return sideDCode;
	}
	public void setSideDCode(int sideDCode) {
		this.sideDCode = sideDCode;
	}
	public int getCookingAmount() {
		return cookingAmount;
	}
	public void setCookingAmount(int cookingAmount) {
		this.cookingAmount = cookingAmount;
	}
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
	public String getDietName() {
		return dietName;
	}
	public void setDietName(String dietName) {
		this.dietName = dietName;
	}
	public String getDietImg() {
		return dietImg;
	}
	public void setDietImg(String dietImg) {
		this.dietImg = dietImg;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
