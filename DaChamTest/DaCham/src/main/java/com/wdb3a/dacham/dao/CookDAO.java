package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;

public interface CookDAO {
	public List<FoodMInven> CookStock(FoodMInven foodInv) throws Exception;
	
}
