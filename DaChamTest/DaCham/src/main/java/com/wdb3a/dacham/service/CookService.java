package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.FoodMInven;

public interface CookService {
	public List<FoodMInven> CookStock(FoodMInven foodInv) throws Exception;
	

}
