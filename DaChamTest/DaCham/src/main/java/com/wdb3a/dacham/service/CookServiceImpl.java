package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.dao.CookDAO;

@Service
public class CookServiceImpl implements CookService {
	@Inject
	private CookDAO dao;
	@Override
	public List<FoodMInven> CookStock(FoodMInven foodInv) throws Exception {
		// TODO Auto-generated method stub
		return dao.CookStock(foodInv);
	}
	@Override
	public List<Cook> cookList() throws Exception {
		// TODO Auto-generated method stub
		return dao.cookList();
	}
	@Override
	public List<Cook> readycook() throws Exception {
		// TODO Auto-generated method stub
		return dao.readycook();
	}
	
	@Override
	public void transportNum2(OrderList order) throws Exception {
		// TODO Auto-generated method stub
		dao.transportNum2(order);
	}
	
}
