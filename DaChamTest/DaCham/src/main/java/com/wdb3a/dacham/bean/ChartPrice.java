package com.wdb3a.dacham.bean;

import java.sql.Date;

public class ChartPrice {
	private int totalprice;
	private Date orderdate;
	private int dietAmount;
	
	
	public int getDietAmount() {
		return dietAmount;
	}
	public void setDietAmount(int dietAmount) {
		this.dietAmount = dietAmount;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

}
