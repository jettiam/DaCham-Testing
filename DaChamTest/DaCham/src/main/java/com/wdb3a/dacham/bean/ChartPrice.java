package com.wdb3a.dacham.bean;

import java.sql.Date;

public class ChartPrice {
	private int totalprice;
	private Date orderdate;
	private int dietAmount;
	private String startdate;
	private String enddate;
	private int orderCodetotal;
	
	 
	public int getOrderCodetotal() {
		return orderCodetotal;
	}
	public void setOrderCodetotal(int orderCodetotal) {
		this.orderCodetotal = orderCodetotal;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
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
