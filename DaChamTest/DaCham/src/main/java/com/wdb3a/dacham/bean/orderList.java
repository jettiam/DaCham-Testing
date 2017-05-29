package com.wdb3a.dacham.bean;

import java.util.Date;

public class orderList {
	private String orderCode;
	private String id;
	private String dietCode;
	private Date orderDate;
	private String diseaseCode; // 질환코드
	private String dietName; //
	private String address;
	private String tel;
	private String name;
	
	
	private int price;
	private int dietAmount;
	private String orderItem;
	private String paymentItem;
	private String transportNum;
	
		
	public String getDiseaseCode() {
		return diseaseCode;
	}
	public void setDiseaseCode(String diseaseCode) {
		this.diseaseCode = diseaseCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDietName() {
		return dietName;
	}
	public void setDietName(String dietName) {
		this.dietName = dietName;
	}
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
		if(transportNum.equals("미진행")){
			this.transportNum = "미진행";
		}else{
			this.transportNum = transportNum;
		}
		
		
	}
	public String toString(){
		return getName();
	}
	
	
	
	
}
