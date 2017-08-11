package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Criteria;
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
	@Override
	public void transportNum(OrderList orderList) throws Exception {
		// TODO Auto-generated method stub
		dao.transportNum(orderList);
	}
	@Override
	public List<OrderList> all(String orderItemCode,Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.all(orderItemCode,criteria);
	}
	@Override
	public int allCount(String orderItemCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.allCount(orderItemCode);
	}
	@Override
	public int showDeliverCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.showDeliverCount();
	}
	@Override
	public List<Deliver> showDeliverAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.showDeliverAll();
	}
	@Override
	public void changer(int orderCode) throws Exception {
		// TODO Auto-generated method stub
		dao.changer(orderCode);
	}
	@Override
	public void todaySynchro(int orderCode) throws Exception {
		// TODO Auto-generated method stub
		dao.todaySynchro(orderCode);
	}
	@Override
	public List<Deliver> completeAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.completeAll(criteria);
	}
	@Override
	public int completeAllCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.completeAllCount();
	}
	@Override
	public void overButton(int foodMICode) throws Exception {
		// TODO Auto-generated method stub
		dao.overButton(foodMICode);
	}
	@Override
	public void changer0(int foodMICode) throws Exception {
		// TODO Auto-generated method stub
		dao.changer0(foodMICode);
	}

}
