package com.wdb3a.dacham.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Customer;
import com.wdb3a.dacham.bean.Measure;
import com.wdb3a.dacham.dao.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {
@Inject
private CustomerDAO dao;
	@Override
	public List<Customer> dietList(int diseaseCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.dietList(diseaseCode);
	}
	@Override

	public List<Customer> cartList(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.cartList(id);}

	public List<Customer> detailOrder(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.detailOrder(dietCode);
	}
	@Override
	public List<Customer> sideDDetail(Customer customer) throws Exception {
		// TODO Auto-generated method stub
		return dao.sideDDetail(customer);

	}
	@Override
	public void orderRegist(Customer customer) throws Exception {
		dao.orderRegist(customer);
		
	}
	@Override
	public void cartRegist(Customer customer) throws Exception {
		dao.cartRegist(customer);
		
	}
	@Override

	public List<Customer> myOrderList(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.myOrderList(id);
	}

	public void orderCart(Customer customer) throws Exception {
		dao.orderCart(customer);
		

	}
	@Override
	public int recentlyOrderCode(String id) throws Exception {
		// 가장 최근의 주문번호를 가져오기 위한 함수
		return dao.recentlyOrderCode(id);
	}
	@Override
	public void orderOptionRegist(HashMap options) throws Exception {
		dao.orderOptionRegist(options);
	}
	@Override
	public List<Customer> orderOption(int orderCode) throws Exception {
		return dao.orderOption(orderCode);
	}
	
	@Override
	public int getOneDCode(HashMap rInfo) throws Exception {
		return dao.getOneDCode(rInfo);
	}
	@Override
	public List<Customer> myNutri(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.myNutri(id);
	}
	@Override
	public int insertMeasure(Measure measure) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertMeasure(measure);
	}
	@Override
	public List<Measure> measureRead(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.measureRead(id);
	}
	@Override
	public List<Customer> menuShow(int diseaseCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.menuShow(diseaseCode);
	}
	@Override
	public void recentlyAddress(Customer customer) throws Exception {
		// TODO Auto-generated method stub
		dao.recentlyAddress(customer);
	}

}
