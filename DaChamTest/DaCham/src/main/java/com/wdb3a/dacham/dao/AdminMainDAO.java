package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.orderList;
import com.wdb3a.dacham.bean.FoodMAmountRead;

public interface AdminMainDAO {
	//orderList 전체 출력
	public List<orderList> orderListAll(orderList orderList) throws Exception;
	public List<orderList> datailview(String orderCode) throws Exception;
	public List<FoodMInven> foodStockList(FoodMInven foodMInven) throws Exception;
	public void refundUpdate(orderList list) throws Exception;
	public void workUpdate(orderList list) throws Exception;
	public List<FoodMAmountRead> foodMAmountRead(int orderCode) throws Exception;
	
}
