package com.wdb3a.dacham.bean;

public class CookingItem {
	private int orderCode;
	private int sideDCode;
	private String sideDImg;
	private String sideDName;
	private int orderOrderItemCode; // orderlist테이블의 반찬 itemCode(상태)
	private int optionsOrderItemCode; // options테이블의 반찬 itemCode(상태)
	private int cookingAmount;
	private String orderItemName;
	
	
	
	
	
	
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public int getSideDCode() {
		return sideDCode;
	}
	public void setSideDCode(int sideDCode) {
		this.sideDCode = sideDCode;
	}
	public String getSideDImg() {
		return sideDImg;
	}
	public void setSideDImg(String sideDImg) {
		this.sideDImg = sideDImg;
	}
	public String getSideDName() {
		return sideDName;
	}
	public void setSideDName(String sideDName) {
		this.sideDName = sideDName;
	}
	public int getOrderOrderItemCode() {
		return orderOrderItemCode;
	}
	public void setOrderOrderItemCode(int orderOrderItemCode) {
		this.orderOrderItemCode = orderOrderItemCode;
	}
	public int getOptionsOrderItemCode() {
		return optionsOrderItemCode;
	}
	public void setOptionsOrderItemCode(int optionsOrderItemCode) {
		this.optionsOrderItemCode = optionsOrderItemCode;
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
}
