package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.orderList;
import com.wdb3a.dacham.dao.DeliverDAO;
import com.wdb3a.dacham.dao.NutritionistDAO;


@Service
public class DeliverServiceImpl implements DeliverService {
	@Inject
	private DeliverDAO dao;
	@Override
	public List<orderList> listAll(orderList orderList) throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll(orderList);
	}

}
