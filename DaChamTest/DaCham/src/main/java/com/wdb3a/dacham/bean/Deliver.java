package com.wdb3a.dacham.bean;

import java.sql.Date;

public class Deliver {
	private int foodMICode;
	private int foodMCode;
	private String foodMName;
	private int inAmount;
	private Date inDate;
	private int outAmount;
	private String unit;
	private int price;
	private Date exDate;
	private String foodMImg;
	private String searchType;
	private String keyword;
	private String orderItemName;
	private int foodMStatus;
	
	
	private int orderCode;
	
	private int page = 1;
	private int recordsPerPage = 10;
	
	
	
	public final static int DISPLAY_PAGE_NUM = 10;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int totalCount;
	
	public int getFoodMICode() {
		return foodMICode;
	}
	public void setFoodMICode(int foodMICode) {
		this.foodMICode = foodMICode;
	}
	public int getFoodMCode() {
		return foodMCode;
	}
	public void setFoodMCode(int foodMCode) {
		this.foodMCode = foodMCode;
	}
	public String getFoodMName() {
		return foodMName;
	}
	public void setFoodMName(String foodMName) {
		this.foodMName = foodMName;
	}
	public int getInAmount() {
		return inAmount;
	}
	public void setInAmount(int inAmount) {
		this.inAmount = inAmount;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public int getOutAmount() {
		return outAmount;
	}
	public void setOutAmount(int outAmount) {
		this.outAmount = outAmount;
	}
	public String getUnit() {
		return unit;
	}
	public void setUint(String unit) {
		this.unit = unit;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getExDate() {
		return exDate;
	}
	public void setExDate(Date exDate) {
		this.exDate = exDate;
	}
	public String getFoodMImg() {
		return foodMImg;
	}
	public void setFoodMImg(String foodMImg) {
		this.foodMImg = foodMImg;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOrderItemName() {
		return orderItemName;
	}
	public void setOrderItemName(String orderItemName) {
		this.orderItemName = orderItemName;
	}
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calculate();
	}
	
	private void calculate(){
		//startpage, endpage, prev, next 계산 해줌.
		endPage = (int)Math.ceil(page/(double)DISPLAY_PAGE_NUM)*DISPLAY_PAGE_NUM;
		//endPage까지 나타낼 수 있는 글 수와 테이블에 들어 있는 총 글 수를 비교한다.
		//endPage까지 나타낼 수 있는 글 수는 : endPage * recordsPerPage
		//(endPage * recordsPerPage) > totalCount
		//만약에 위가 참이라면 endPage = (totalCount / recordsPerPage)+1
	
		
		
		startPage = endPage-DISPLAY_PAGE_NUM + 1;
		
		if((endPage*recordsPerPage)>totalCount){
			endPage = (totalCount / recordsPerPage) + 1;
		}
		prev = startPage > 1? true:false;
		next = endPage * recordsPerPage < totalCount?true:false;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}
	
	public int getPage() {
		return page;
	}
	public int getStartRecord(){
		//page가 1이면 0*10리턴
		//page가 2이면 1*10리턴........
		
		return (page-1)*recordsPerPage;
	}
	public void setPage(int page) {
		if(page <= 0){
			this.page = 1;
		}
		else{
			this.page = page;
		}
	}
	public int getRecordsPerPage() {
		return recordsPerPage;
	}
	public void setRecordsPerPage(int recordsPerPage) {
		if(recordsPerPage <= 0 || recordsPerPage > 100){
			this.recordsPerPage = 10;
		}
		else{
			this.recordsPerPage = recordsPerPage;
		}
	}
	@Override
	public String toString(){
		return "Criteria[page ="+page+", "+ " recordsPerPage ="+recordsPerPage+"]";
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public int getFoodMStatus() {
		return foodMStatus;
	}
	public void setFoodMStatus(int foodMStatus) {
		this.foodMStatus = foodMStatus;
	}
}
