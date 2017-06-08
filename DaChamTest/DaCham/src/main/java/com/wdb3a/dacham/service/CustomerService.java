package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Customer;

public interface CustomerService {
	public List<Customer> dietList(int diseaseCode) throws Exception; 
}
