package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Nutritionist;

public interface NutritionistDAO {
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
	public List<Nutritionist> materialSearch(Nutritionist nutritionist) throws Exception;
	public Nutritionist materialView(String sideDCode) throws Exception;
}
