package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.CookingItem;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;

public interface CookService {
	public List<FoodMInven> CookStock(FoodMInven foodInv) throws Exception;
	public List<Cook> cookList() throws Exception;
	public List<Cook> readycook() throws Exception;
	public List<Cook> finishcook() throws Exception;
	public void transportNum2(OrderList order) throws Exception;
	public List<Cook> readyScreen() throws Exception;
	public List<Cook> cookScreen() throws Exception;
	public List<Cook> endScreen() throws Exception;
	
	public List<CookingItem> getCookingItemList() throws Exception;
}
