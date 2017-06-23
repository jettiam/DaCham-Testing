package com.wdb3a.dacham.bean;

import java.sql.Date;

public class Customer {
private int dietCode;
private int sideDCode;
private String dietName;
private int price;
private String dietImg;
private int diseaseCode;
private String spDietItem;
private int wizardCode;
private int orderCode;
private String id;
private int dietAmount;
private String transportNum;
private String orderItemName;
private int orderItemCode;
private String orderListStatus;
private String paymentItemName;
private int paymentItemCode;
private String sideDName;
private String sideDImg;
private String foodGCode;
private String foodGName;
private Date orderDate;
private boolean detailOrder;
private double kcal;
private double carbohydrate;
private double protein;
private double fat;
private double na;

public int getDietCode() {
	return dietCode;
}
public void setDietCode(int dietCode) {
	this.dietCode = dietCode;
}
public int getSideDCode() {
	return sideDCode;
}
public void setSideDCode(int sideDCode) {
	this.sideDCode = sideDCode;
}
public String getDietName() {
	return dietName;
}
public void setDietName(String dietName) {
	this.dietName = dietName;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getDietImg() {
	return dietImg;
}
public void setDietImg(String dietImg) {
	this.dietImg = dietImg;
}
public int getDiseaseCode() {
	return diseaseCode;
}
public void setDiseaseCode(int diseaseCode) {
	this.diseaseCode = diseaseCode;
}
public String getSpDietItem() {
	return spDietItem;
}
public void setSpDietItem(String spDietItem) {
	this.spDietItem = spDietItem;
}
public int getWizardCode() {
	return wizardCode;
}
public void setWizardCode(int wizardCode) {
	this.wizardCode = wizardCode;
}
public int getOrderCode() {
	return orderCode;
}
public void setOrderCode(int orderCode) {
	this.orderCode = orderCode;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getDietAmount() {
	return dietAmount;
}
public void setDietAmount(int dietAmount) {
	this.dietAmount = dietAmount;
}
public String getTransportNum() {
	return transportNum;
}
public void setTransportNum(String transportNum) {
	this.transportNum = transportNum;
}
public String getOrderItemName() {
	return orderItemName;
}
public void setOrderItemName(String orderItemName) {
	this.orderItemName = orderItemName;
}
public int getOrderItemCode() {
	return orderItemCode;
}
public void setOrderItemCode(int orderItemCode) {
	this.orderItemCode = orderItemCode;
	if(orderItemCode==0){
		this.setOrderListStatus("미결제");
	}else if(orderItemCode>=2 && orderItemCode<=5){
		this.setOrderListStatus("결제완료");
	}else if(orderItemCode==6){
		this.setOrderListStatus("주문취소");
	}else if(orderItemCode==7){
		this.setOrderListStatus("배송중");
	}else if(orderItemCode==8){
		this.setOrderListStatus("배송완료");
	}
}
public String getPaymentItemName() {
	return paymentItemName;
}
public void setPaymentItemName(String paymentItemName) {
	this.paymentItemName = paymentItemName;
}
public int getPaymentItemCode() {
	return paymentItemCode;
}
public void setPaymentItemCode(int paymentItemCode) {
	this.paymentItemCode = paymentItemCode;
}
public String getSideDName() {
	return sideDName;
}
public void setSideDName(String sideDName) {
	this.sideDName = sideDName;
}
public String getSideDImg() {
	return sideDImg;
}
public void setSideDImg(String sideDImg) {
	this.sideDImg = sideDImg;
}
public String getFoodGCode() {
	return foodGCode;
}
public void setFoodGCode(String foodGCode) {
	this.foodGCode = foodGCode;
}

public String getFoodGName() {
	return foodGName;
}
public void setFoodGName(String foodGName) {
	this.foodGName = foodGName;
}
public double getKcal() {
	return kcal;
}
public void setKcal(double kcal) {	
	this.kcal = kcal;
}
public double getCarbohydrate() {
	return carbohydrate;
}
public void setCarbohydrate(double carbohydrate) {
	this.carbohydrate = carbohydrate;
}
public double getProtein() {
	return protein;
}
public void setProtein(double protein) {
	this.protein = protein;
}
public double getFat() {
	return fat;
}
public void setFat(double fat) {
	this.fat = fat;
}
public double getNa() {
	return na;
}
public void setNa(double na) {
	this.na = na;
}
public boolean isDetailOrder() {
	return detailOrder;
}
public void setDetailOrder(boolean detailOrder) {
	this.detailOrder = detailOrder;
}
public Date getOrderDate() {
	return orderDate;
}
public void setOrderDate(Date orderDate) {
	this.orderDate = orderDate;
}
public String getOrderListStatus() {
	return orderListStatus;
}
public void setOrderListStatus(String orderListStatus) {
	this.orderListStatus = orderListStatus;
}


}
