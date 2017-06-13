package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Deliver;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;

public interface DeliverDAO {
	public List<OrderList> listAll(OrderList orderList) throws Exception;
	public List<Nutritionist> listMaterial() throws Exception;
	public void createDeliver(Deliver deliver) throws Exception;
	public List<Deliver> showDeliver(Deliver deliver) throws Exception;
}
