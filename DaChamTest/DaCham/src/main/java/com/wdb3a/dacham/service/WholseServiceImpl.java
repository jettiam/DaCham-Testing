package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.dao.WholseDAO;

@Service
public class WholseServiceImpl implements WholseService {
@Inject
private WholseDAO dao;

	@Override
	public List<FoodMInven> foodMOrderList() throws Exception {
		// TODO Auto-generated method stub
		return dao.foodMOrderList();
	}

}
