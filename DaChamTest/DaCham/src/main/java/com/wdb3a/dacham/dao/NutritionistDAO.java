package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Nutritionist;

public interface NutritionistDAO {
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
}
