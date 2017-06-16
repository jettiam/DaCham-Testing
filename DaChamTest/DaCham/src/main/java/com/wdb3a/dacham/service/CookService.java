package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.FoodMInven;

public interface CookService {
	public List<FoodMInven> CookStock(FoodMInven foodInv) throws Exception;
	public List<Cook> cookList() throws Exception;
	public List<Cook> readycook() throws Exception;
	public List<Cook> cookingfood() throws Exception;
	public List<Cook> finishcook() throws Exception;

}
