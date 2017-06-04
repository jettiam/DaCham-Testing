package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.orderList;

public interface DeliverService {
	public List<orderList> listAll(orderList orderList) throws Exception;
}
