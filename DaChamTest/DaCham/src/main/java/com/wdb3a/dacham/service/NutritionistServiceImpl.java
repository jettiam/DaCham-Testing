package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Nutritionist;
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

	

}
