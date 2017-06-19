package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Customer;

public interface CustomerService {

	public List<Customer> dietList(int diseaseCode) throws Exception;

	public List<Customer> cartList(String id) throws Exception;

	public List<Customer> detailOrder(int dietCode) throws Exception;

	public List<Customer> sideDDetail(String foodGCode) throws Exception;

	public void orderRegist(Customer customer) throws Exception ;

	public void cartRegist(Customer customer) throws Exception;
	public void orderCart(Customer customer) throws Exception;
}
