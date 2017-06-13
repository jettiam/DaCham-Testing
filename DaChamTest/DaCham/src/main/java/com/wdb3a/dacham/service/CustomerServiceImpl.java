package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Customer;
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
	public List<Customer> sideDDetail(String foodGCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.sideDDetail(foodGCode);

	}
	@Override
	public void orderRegist(Customer customer) throws Exception {
		dao.orderRegist(customer);
		
	}

}
