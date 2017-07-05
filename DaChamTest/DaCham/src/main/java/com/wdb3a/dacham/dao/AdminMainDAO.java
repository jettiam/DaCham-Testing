package com.wdb3a.dacham.dao;

import java.util.List;

import org.springframework.aop.ThrowsAdvice;

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.bean.ChartList;
import com.wdb3a.dacham.bean.ChartPrice;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.FoodMAmountRead;

public interface AdminMainDAO {
	//orderList 전체 출력

	public List<OrderList> orderListAll(OrderList orderList) throws Exception;
	public List<OrderList> orderAll(OrderList orderList) throws Exception;
	public List<OrderList> datailview(String orderCode) throws Exception;
	public List<FoodMInven> foodStockList(FoodMInven foodMInven) throws Exception;//식재료 재고 검색
	public void refundUpdate(OrderList list) throws Exception;
	public void workUpdate(OrderList list) throws Exception;
	public List<FoodMAmountRead> foodMAmountRead(int orderCode) throws Exception;
	public List<ChartList> chartList() throws Exception;
	public List<ChartPrice> chartPrice() throws Exception;
	public List<ChartPrice> chartPrice1(ChartPrice dates) throws Exception;
	public List<OrderList> all(Criteria criteria) throws Exception;
	public List<OrderList> orderAll() throws Exception;
	public List<OrderList> orderAllSearch(OrderList orderList) throws Exception;
	public List<FoodMInven> foodStockListAll() throws Exception;
	public int orderListCount() throws Exception;
	
}
