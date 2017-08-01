package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.FoodMInven;

public interface WholseService {
	public List<FoodMInven> foodMOrderList() throws Exception;
	public List<FoodMInven> foodMOrderListDetail(String orderDate) throws Exception ;
	public List<FoodMInven> foodMOrderListDetailAdd(String orderDate) throws Exception;
	
}
