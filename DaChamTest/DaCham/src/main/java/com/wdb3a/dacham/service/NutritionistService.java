package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;

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
	//식단을 해당 질병과 관련하여 조회합니다.
	public List<Nutritionist> diseaseDietOverview(Nutritionist nutritionist) throws Exception;
	//해당 반찬에 대한 카테고리 검색
	public List<Nutritionist> categorySearch(Nutritionist nutritionist) throws Exception;
	//해당 메인 페이지에 주문목록 표시
	public List<OrderList> orderList() throws Exception;
}
