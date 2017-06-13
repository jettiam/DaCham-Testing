package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Deliver;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.dao.DeliverDAO;
import com.wdb3a.dacham.dao.NutritionistDAO;


@Service
public class DeliverServiceImpl implements DeliverService {
	@Inject
	private DeliverDAO dao;
	@Override
	public List<OrderList> listAll(OrderList orderList) throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll(orderList);
	}
	@Override
	public List<Nutritionist> listMaterial() throws Exception {
		// TODO Auto-generated method stub
		return dao.listMaterial();
	}
	@Override
	public void createDeliver(Deliver deliver) throws Exception {
		// TODO Auto-generated method stub
		dao.createDeliver(deliver);
	}
	@Override
	public List<Deliver> showDeliver(Deliver deliver) throws Exception {
		// TODO Auto-generated method stub
		return dao.showDeliver(deliver);
	}

}
