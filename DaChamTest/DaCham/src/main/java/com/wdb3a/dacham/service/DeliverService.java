package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Deliver;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;

public interface DeliverService {
	public List<OrderList> listAll(OrderList orderList) throws Exception;
	public List<Nutritionist> listMaterial() throws Exception;
	public void createDeliver(Deliver deliver) throws Exception;
	public List<Deliver> showDeliver(Deliver deliver) throws Exception;
	public void transportNum(OrderList orderList) throws Exception;
	public List<OrderList> all(String orderItemCode,Criteria criteria) throws Exception;
	public int allCount(String orderItemCode) throws Exception;
}
