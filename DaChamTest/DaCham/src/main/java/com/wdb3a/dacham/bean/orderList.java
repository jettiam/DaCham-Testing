package com.wdb3a.dacham.bean;

import java.util.Date;

public class orderList {
	private String orderCode;
	private String id;
	private String dietCode;
	private Date orderDate;
	
	private int price;
	private int dietAmount;
	private String email;
	private String orderItem;
	private String paymentItem;
	private String transportNum;
	
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDietCode() {
		return dietCode;
	}
	public void setDietCode(String dietCode) {
		this.dietCode = dietCode;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDietAmount() {
		return dietAmount;
	}
	public void setDietAmount(int dietAmount) {
		this.dietAmount = dietAmount;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(String orderItem) {
		this.orderItem = orderItem;
	}
	public String getPaymentItem() {
		return paymentItem;
	}
	public void setPaymentItem(String paymentItem) {
		this.paymentItem = paymentItem;
	}
	public String getTransportNum() {
		return transportNum;
	}
	public void setTransportNum(String transportNum) {
		this.transportNum = transportNum;
	}
	
	
}
