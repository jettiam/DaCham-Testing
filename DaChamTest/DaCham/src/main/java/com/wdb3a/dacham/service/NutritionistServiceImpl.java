package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	public Nutritionist openAPI(String foodMName) throws Exception {
		// TODO Auto-generated method stub
		return dao.openAPI(foodMName);
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
	public List<Nutritionist> materialAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.materialAll();
	}
	//반찬 템플릿의 개수를 구합니다.
	@Override
	public int optionTemplateCount(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return dao.optionTemplateCount(nutritionist);
	}

	@Override
	public List<Nutritionist> sideAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.sideAll();
	}

	@Override
	public List<Nutritionist> diseaseDietOverview(String diseaseName, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.diseaseDietOverview(diseaseName,criteria);
	}

	@Override
	public List<Nutritionist> categorySearch(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return dao.categorySearch(nutritionist);
	}

	@Override
	public List<OrderList> orderList(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList(criteria);
	}

	@Override
	public List<OrderList> thisMonth() throws Exception {
		// TODO Auto-generated method stub
		return dao.thisMonth();
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

	

}
