package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Nutritionist;

public interface NutritionistDAO {
//	반찬 목록을 검색합니다.
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
// 반찬 전체를 조회합니다.(with 식품군, 조리법)
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
