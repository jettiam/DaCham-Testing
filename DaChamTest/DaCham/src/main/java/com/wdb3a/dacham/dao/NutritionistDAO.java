package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Counsel;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;

public interface NutritionistDAO {
//	반찬 목록을 검색합니다.
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception;
// 반찬 전체를 조회합니다.(with 식품군, 조리법)
	public List<Nutritionist> sideAll(String foodGCode,Criteria criteria) throws Exception;
	//해당 식단에서 가장 최신의 식단을 구합니다.
	public int maxDiet() throws Exception;
	//반찬 전체의 수량을 구합니다.
	public int sideAllCount(String foodGCode) throws Exception;
	//해당 메인페이지에 이달의 메뉴를 조회합니다.
	public List<OrderList> thisMonth(Criteria criteria) throws Exception;
	//이달의 메뉴의 개수를 구합니다.
	public int thisMonthCount() throws Exception;
	public List<Nutritionist> materialSearch(Nutritionist nutritionist) throws Exception;
	public Nutritionist materialView(String sideDCode) throws Exception;
	public List<Nutritionist> materialAll(Criteria criteria) throws Exception;
	public int materialTotal() throws Exception;
	public void create(Nutritionist nutritionist) throws Exception;
	public void createSide(Nutritionist nutritionist) throws Exception;
	public void createAmount(Nutritionist nutritionist) throws Exception;
	public Nutritionist openAPI(String foodMCode) throws Exception;
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
	public List<Nutritionist> categorySearch(Nutritionist nutritionist,Criteria criteria) throws Exception;
	//해당 반찬 카테고리 검색에 대한 카운트
	public int categorySearchCount(Nutritionist nutritionist) throws Exception;
	//해당 메인 페이지에 주문목록 표시
	public List<OrderList> orderList(Criteria criteria) throws Exception;
	//해당 메인페이지 주문목록 개수 구하기
	public int orderList() throws Exception;
	//해당 반찬에 대한 영양정보
	public Nutritionist allNutri(String sideDCode) throws Exception;
	//해당 특별식단 메인 페이지의 리스트
	public List<OrderList> specialList() throws Exception;
	//해당 특별식단의 고객 리스트를 view!
	public Counsel specialView(int counselCode) throws Exception;
	//해당 특별식단의 고객 정보와 함께 등록
	public void specialRegist(String customer) throws Exception;
	//해당 고객요청에 등록된 특별식단 toggle
	public List<Nutritionist> specialToggle(Nutritionist nutritionist) throws Exception;
	//해당 특별식단이 등록되면 표시
	public void specialComplete(int counselCode) throws Exception;
	//해당 특별식단의 코드를 조회하여 중복 체크
	public List<Nutritionist> specialCode(String customer) throws Exception;
	//해당 특별식단을 추가 등록하길 원할 때의 메소드
	public void reRegist(int counselCode) throws Exception;
	//해당 특별식단을 장바구니에서 볼 수 있게 옵션에 저장
	public void optionInsert(Nutritionist nutritionist) throws Exception;
	//해당 특별식단에 해당하는 게시판 번호에 있는 답변을 조회함
	public String answer(int counselCode) throws Exception;
	//해당 특별식단에 있는 답변에 링크를 걸어줌
	public void answers(Nutritionist nutritionist) throws Exception;
	//해당 반찬 지우기 1탄
	public void remove1(String sideDCode) throws Exception;
	//해당 반찬 지우기 2탄
	public void remove2(String sideDCode) throws Exception;
	//해당 반찬 지우기 3탄
	public void remove3(String sideDCode) throws Exception;
	//해당 반찬 지우기 0
	public void remove0(String sideDCode) throws Exception;
	//해당 식단 지우기0
	public void delete0(int dietCode) throws Exception;
	//해당 식단 지우기 1탄
	public void delete1(int dietCode) throws Exception;
	//해당 식단 지우기 2탄
	public void delete2(int dietCode) throws Exception;
	//해당 식단 지우기 3탄
	public void delete3(int dietCode) throws Exception;
	//해당 반찬코드에 속하는 식재료들 출력(수정)
	public List<Nutritionist> sideMaterial(String sideDCode) throws Exception;
	//해당 반찬코드에 속하는 값들 출력(수정)
	public Nutritionist sideOver(String sideDCode) throws Exception;
	//해당 반찬을 수정
	public void sideModify(Nutritionist nutritionist) throws Exception;
	//해당 반찬을 수정 2탄
	public void modifyCross1(String sideDCode) throws Exception;
	public void modifyCross2(Nutritionist nutritionist) throws Exception;
	//해당 식단코드에 속하는 값들 출력(수정)
	public Nutritionist dietOver(int dietCode) throws Exception;
	//해당 식단을 수정
	public void dietModify(Nutritionist nutritionist) throws Exception;
	//해당 식단 수정 페이지에서 수정을 위해 식품군별로 반찬 조회
	public List<Nutritionist> groupSide(Nutritionist nutritionist) throws Exception;
	//해당 식단 수정 페이지에서 수정을 위해 모든 반찬을 삭제
	public void updateCross1(int dietCode) throws Exception;
	//해당 식단 수정 페이지에서 수정을 위해 페이지에 있는 반찬을 재등록
	public void updateCross2(Nutritionist nutritionist) throws Exception;
	//해당 영양사 메인 페이지에서 식단 클릭하면 팝업을 띄울 수 있음
	public List<Nutritionist> popup(int dietCode) throws Exception;
	//해당 반찬 코드에 속한 식재료 정보를 불러옵니다.
	public List<Nutritionist> callName(int sideDCode) throws Exception;
}
