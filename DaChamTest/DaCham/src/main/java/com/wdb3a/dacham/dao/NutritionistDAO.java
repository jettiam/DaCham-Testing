package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;

public interface NutritionistDAO {
//	반찬 목록을 검색합니다.
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
// 반찬 전체를 조회합니다.(with 식품군, 조리법)
	public List<Nutritionist> sideAll(Criteria criteria) throws Exception;
	//반찬 전체의 수량을 구합니다.
	public int sideAllCount() throws Exception;
	//해당 메인페이지에 이달의 메뉴를 조회합니다.
	public List<OrderList> thisMonth(Criteria criteria) throws Exception;
	//이달의 메뉴의 개수를 구합니다.
	public int thisMonthCount() throws Exception;
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
	public List<Nutritionist> diseaseDietOverview(String diseaseName,Criteria criteria) throws Exception;
	//위의 목록결과의 수량을 구합니다.
	public int diseaseDietCount(String diseaseName) throws Exception;
	//해당 반찬에 대한 카테고리 검색
	public List<Nutritionist> categorySearch(Nutritionist nutritionist) throws Exception;
	//해당 메인 페이지에 주문목록 표시
	public List<OrderList> orderList(Criteria criteria) throws Exception;
	//해당 메인페이지 주문목록 개수 구하기
	public int orderList() throws Exception;
	//해당 반찬에 대한 영양정보
	public Nutritionist allNutri(String sideDCode) throws Exception;
}
