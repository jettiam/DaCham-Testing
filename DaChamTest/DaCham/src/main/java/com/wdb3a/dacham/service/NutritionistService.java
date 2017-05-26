package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Nutritionist;

public interface NutritionistService {
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
}
