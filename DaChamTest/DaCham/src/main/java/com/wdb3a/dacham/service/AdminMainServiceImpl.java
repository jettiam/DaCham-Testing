package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.orderList;
import com.wdb3a.dacham.dao.AdminMainDAO;

@Service
public class AdminMainServiceImpl implements AdminMainService {
	@Inject
	private AdminMainDAO dao;
	
	@Override
	public List<orderList> orderListAll() throws Exception {
		return dao.orderListAll();
	}

	@Override
	public List<orderList> datailview(String orderCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.datailview(orderCode);
	}

	@Override
	public List<FoodMInven> foodStockList() throws Exception {
		// TODO Auto-generated method stub
		return dao.foodStockList();
	}

	@Override
	public void transportNumUpdate(orderList list) throws Exception {
		dao.transportNumUpdate(list);
		
	}

}
