package com.wdb3a.dacham.bean;

import org.springframework.data.annotation.Id;

public class Testing5 {

	
	private String date;
	private String time;
	private Object wizard;
	private String block;
	
	@Id
	private String id;
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Object getWizard() {
		return wizard;
	}
	public void setWizard(Object wizard) {
		this.wizard = wizard;
	}
	public String getBlock() {
		return block;
	}
	public void setBlock(String block) {
		this.block = block;
	}
}
