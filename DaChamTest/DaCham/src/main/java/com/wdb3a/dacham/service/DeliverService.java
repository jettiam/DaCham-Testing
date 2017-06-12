package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Deliver;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.orderList;

public interface DeliverService {
	public List<orderList> listAll(orderList orderList) throws Exception;
	public List<Nutritionist> listMaterial() throws Exception;
	public void createDeliver(Deliver deliver) throws Exception;
	public List<Deliver> showDeliver(Deliver deliver) throws Exception;
}
