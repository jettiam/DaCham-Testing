package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.ChartList;
import com.wdb3a.dacham.bean.ChartPrice;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.FoodMAmountRead;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;

@Service
public interface AdminMainService {
	public List<OrderList> orderListAll(OrderList orderList) throws Exception; 
	public List<OrderList> datailview(String orderCode) throws Exception;
	public List<FoodMInven> foodStockList(FoodMInven foodMInven) throws Exception;
	public void refundUpdate(OrderList list) throws Exception;
	public void workUpdate(OrderList list) throws Exception;
	public List<FoodMAmountRead> foodMAmountRead(int orderCode) throws Exception;
	public List<ChartList> chartList() throws Exception;
	public List<ChartPrice> chartPrice() throws Exception;
	public List<ChartPrice> chartPrice1(ChartPrice dates) throws Exception;
	public List<OrderList> all(Criteria criteria) throws Exception;
	public List<OrderList> orderAll() throws Exception;
	public List<FoodMInven> foodStockListAll() throws Exception; 
	public int orderListCount() throws Exception;
	public List<OrderList> orderAll(OrderList orderList) throws Exception;
}
