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

}