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

}
