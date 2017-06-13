package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Nutritionist;

public interface NutritionistService {
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
	public List<Nutritionist> materialSearch(Nutritionist nutritionist) throws Exception;
	public Nutritionist materialView(String sideDCode) throws Exception;
	public void create(Nutritionist nutritionist) throws Exception;
	public void createSide(Nutritionist nutritionist) throws Exception;
	public void createAmount(Nutritionist nutritionist) throws Exception;
	public Nutritionist openAPI(String foodMName) throws Exception;
	public void createDiet(Nutritionist nutritionist) throws Exception;
	public List<Nutritionist> choiceDisease() throws Exception;
	public void createDietInfo(Nutritionist nutritionist) throws Exception;
	public Nutritionist showKcal(String sideDCode) throws Exception;
	public List<Nutritionist> optionTemplate(Nutritionist nutritionist) throws Exception;
}
