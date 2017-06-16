package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Nutritionist;

public interface NutritionistService {
	//반찬 검색용
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
	//반찬 전체 조회하기용
	public List<Nutritionist> sideAll() throws Exception;
	public List<Nutritionist> materialSearch(Nutritionist nutritionist) throws Exception;
	public Nutritionist materialView(String sideDCode) throws Exception;
	public List<Nutritionist> materialAll() throws Exception;
	public void create(Nutritionist nutritionist) throws Exception;
	public void createSide(Nutritionist nutritionist) throws Exception;
	public void createAmount(Nutritionist nutritionist) throws Exception;
	public Nutritionist openAPI(String foodMName) throws Exception;
	public void createDiet(Nutritionist nutritionist) throws Exception;
	public List<Nutritionist> choiceDisease() throws Exception;
	public void createDietInfo(Nutritionist nutritionist) throws Exception;
	public Nutritionist showKcal(String sideDCode) throws Exception;
	public List<Nutritionist> optionTemplate(Nutritionist nutritionist) throws Exception;
//	반찬 템플릿의 개수를 구합니다.
	public int optionTemplateCount(Nutritionist nutritionist) throws Exception;
}
