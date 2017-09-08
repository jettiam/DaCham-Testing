package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Counsel;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.dao.NutritionistDAO;


@Service
public class NutritionistServiceImpl implements NutritionistService {
	@Inject
	private NutritionistDAO dao;
	
	@Override
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(nutritionist);
	}

	@Override
	public List<Nutritionist> materialSearch(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return dao.materialSearch(nutritionist);
	}

	@Override
	public Nutritionist materialView(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.materialView(sideDCode);
	}

	@Override
	public void create(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.create(nutritionist);
	}

	@Override
	public void createSide(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.createSide(nutritionist);
	}

	@Override
	public void createAmount(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.createAmount(nutritionist);
	}

	@Override
	public Nutritionist openAPI(String foodMCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.openAPI(foodMCode);
	}

	@Override
	public void createDiet(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.createDiet(nutritionist);
	}

	@Override
	public List<Nutritionist> choiceDisease() throws Exception {
		// TODO Auto-generated method stub
		return dao.choiceDisease();
	}

	@Override
	public void createDietInfo(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.createDietInfo(nutritionist);
	}

	@Override
	public Nutritionist showKcal(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.showKcal(sideDCode);
	}

	@Override
	public List<Nutritionist> optionTemplate(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return dao.optionTemplate(nutritionist);
	}

	@Override
	public List<Nutritionist> materialAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.materialAll(criteria);
	}
	//반찬 템플릿의 개수를 구합니다.
	@Override
	public int optionTemplateCount(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return dao.optionTemplateCount(nutritionist);
	}

	@Override
	public List<Nutritionist> sideAll(String foodGCode,Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.sideAll(foodGCode,criteria);
	}

	@Override
	public List<Nutritionist> diseaseDietOverview(String diseaseName, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.diseaseDietOverview(diseaseName,criteria);
	}

	@Override
	public List<Nutritionist> categorySearch(Nutritionist nutritionist,Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.categorySearch(nutritionist,criteria);
	}

	@Override
	public List<OrderList> orderList(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList(criteria);
	}

	@Override
	public List<OrderList> thisMonth(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.thisMonth(criteria);
	}

	@Override
	public Nutritionist allNutri(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.allNutri(sideDCode);
	}

	@Override
	public int orderList() throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList();
	}

	@Override
	public int diseaseDietCount(String diseaseName) throws Exception {
		// TODO Auto-generated method stub
		return dao.diseaseDietCount(diseaseName);
	}

	@Override
	public int sideAllCount(String foodGCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.sideAllCount(foodGCode);
	}

	@Override
	public int thisMonthCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.thisMonthCount();
	}

	@Override
	public List<OrderList> specialList() throws Exception {
		// TODO Auto-generated method stub
		return dao.specialList();
	}

	@Override
	public int materialTotal() throws Exception {
		// TODO Auto-generated method stub
		return dao.materialTotal();
	}

	@Override
	public Counsel specialView(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.specialView(counselCode);
	}

	@Override
	public void specialRegist(String customer) throws Exception {
		// TODO Auto-generated method stub
		dao.specialRegist(customer);
	}

	@Override
	public List<Nutritionist> specialToggle(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return dao.specialToggle(nutritionist);
	}

	@Override
	public void specialComplete(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		dao.specialComplete(counselCode);
	}

	@Override
	public List<Nutritionist> specialCode(String customer) throws Exception {
		// TODO Auto-generated method stub
		return dao.specialCode(customer);
	}

	@Override
	public void reRegist(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		dao.reRegist(counselCode);
	}

	@Override
	public void optionInsert(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.optionInsert(nutritionist);
	}

	@Override
	public String answer(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.answer(counselCode);
	}

	@Override
	public void answers(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.answers(nutritionist);
	}

	@Override
	public int maxDiet() throws Exception {
		// TODO Auto-generated method stub
		return dao.maxDiet();
	}

	@Override
	public void remove1(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		dao.remove1(sideDCode);
	}

	@Override
	public void remove2(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		dao.remove2(sideDCode);
	}

	@Override
	public void remove3(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		dao.remove3(sideDCode);
	}

	@Override
	public void remove0(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		dao.remove0(sideDCode);
	}

	@Override
	public void delete0(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		dao.delete0(dietCode);
	}

	@Override
	public void delete1(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		dao.delete1(dietCode);
	}

	@Override
	public void delete2(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		dao.delete2(dietCode);
	}

	@Override
	public void delete3(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		dao.delete3(dietCode);
	}

	@Override
	public List<Nutritionist> sideMaterial(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.sideMaterial(sideDCode);
	}

	@Override
	public Nutritionist sideOver(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.sideOver(sideDCode);
	}

	@Override
	public void sideModify(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.sideModify(nutritionist);
	}

	@Override
	public void modifyCross1(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		dao.modifyCross1(sideDCode);
	}

	@Override
	public void modifyCross2(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.modifyCross2(nutritionist);
	}

	@Override
	public Nutritionist dietOver(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.dietOver(dietCode);
	}

	@Override
	public void dietModify(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.dietModify(nutritionist);
	}

	@Override
	public List<Nutritionist> groupSide(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return dao.groupSide(nutritionist);
	}

	@Override
	public void updateCross1(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		dao.updateCross1(dietCode);
	}

	@Override
	public void updateCross2(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		dao.updateCross2(nutritionist);
	}

	@Override
	public List<Nutritionist> popup(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.popup(dietCode);
	}

	@Override
	public List<Nutritionist> callName(int sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.callName(sideDCode);
	}

	@Override
	public int categorySearchCount(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return dao.categorySearchCount(nutritionist);
	}


	

}
