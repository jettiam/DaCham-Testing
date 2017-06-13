package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.bean.FoodMAmountRead;

public interface AdminMainDAO {
	//orderList 전체 출력
	public List<OrderList> orderListAll() throws Exception;
	public List<OrderList> datailview(String orderCode) throws Exception;
	public List<FoodMInven> foodStockList() throws Exception;
	public void refundUpdate(OrderList list) throws Exception;
	public void workUpdate(OrderList list) throws Exception;
	public List<FoodMAmountRead> foodMAmountRead(int orderCode) throws Exception;
	
}
