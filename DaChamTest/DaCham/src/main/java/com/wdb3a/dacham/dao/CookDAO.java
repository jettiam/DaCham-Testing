package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.CookingItem;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;


public interface CookDAO {
	public List<FoodMInven> CookStock(FoodMInven foodInv) throws Exception;
	public List<Cook> cookList() throws Exception;
	public List<Cook> readycook() throws Exception;
	public List<Cook> finishcook() throws Exception;
	public void transportNum2(OrderList orderList) throws Exception;
	public List<Cook> readyScreen() throws Exception;
	public List<Cook> cookScreen() throws Exception;
	public List<Cook> endScreen() throws Exception;
	
	public List<CookingItem> getCookingItemList() throws Exception;
	public void updateOptionsItemCode(int orderItemCode, int sideDCode) throws Exception;
	public List<FoodMInven> foodStockAll(Criteria criteria) throws Exception;
	public int foodStockAll() throws Exception;
	public List<CookingItem> anotherSelectCookingItem3(Criteria criteria) throws Exception;
	public List<CookingItem> anotherSelectCookingItem5(Criteria criteria) throws Exception;
	public int anotherSelectCookingItemCount() throws Exception;
	public int anotherSelectCookingItemCount2() throws Exception;
}
