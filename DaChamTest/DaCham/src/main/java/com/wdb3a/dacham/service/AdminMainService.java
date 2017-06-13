package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.FoodMAmountRead;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;

@Service
public interface AdminMainService {
	public List<OrderList> orderListAll() throws Exception; 
	public List<OrderList> datailview(String orderCode) throws Exception;
	public List<FoodMInven> foodStockList() throws Exception;
	public void refundUpdate(OrderList list) throws Exception;
	public void workUpdate(OrderList list) throws Exception;
	public List<FoodMAmountRead> foodMAmountRead(int orderCode) throws Exception;
	public boolean send(String subject, String text, String from, String to) throws Exception;
}
