package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.CookingItem;
import com.wdb3a.dacham.bean.Criteria;
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
	@Override
	public List<Cook> finishcook() throws Exception {
		// TODO Auto-generated method stub
		return dao.finishcook();
	}
	@Override
	public List<Cook> readyScreen() throws Exception {
		// TODO Auto-generated method stub
		return dao.readyScreen();
	}
	@Override
	public List<Cook> cookScreen() throws Exception {
		// TODO Auto-generated method stub
		return dao.cookScreen();
	}
	@Override
	public List<Cook> endScreen() throws Exception {
		// TODO Auto-generated method stub
		return dao.endScreen();
	}
	
	
	
	@Override
	public List<CookingItem> getCookingItemList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getCookingItemList();
	}
	
	
	@Override
	public void updateOptionsItemCode(int orderItemCode, int sideDCode) throws Exception {
		dao.updateOptionsItemCode(orderItemCode, sideDCode);		
	}
	@Override
	public List<FoodMInven> foodStockAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.foodStockAll(criteria);
	}
	@Override
	public int foodStockAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.foodStockAll();
	}
	@Override
	public List<CookingItem> anotherSelectCookingItem3(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.anotherSelectCookingItem3(criteria);
	}
	@Override
	public List<CookingItem> anotherSelectCookingItem5(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.anotherSelectCookingItem5(criteria);
	}
	@Override
	public int anotherSelectCookingItemCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.anotherSelectCookingItemCount();
	}
	@Override
	public int anotherSelectCookingItemCount2() throws Exception {
		// TODO Auto-generated method stub
		return dao.anotherSelectCookingItemCount2();
	}
	
}
