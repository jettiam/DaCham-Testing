package com.wdb3a.dacham.dao;

import java.util.List;
import com.wdb3a.dacham.bean.FoodMInven;
public interface WholseDAO {
	public List<FoodMInven> foodMOrderList() throws Exception;
	public List<FoodMInven> foodMOrderListDetail(String orderDate) throws Exception;
}
