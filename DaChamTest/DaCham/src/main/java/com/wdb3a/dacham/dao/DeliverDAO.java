package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.orderList;

public interface DeliverDAO {
	public List<orderList> listAll(orderList orderList) throws Exception;
}
