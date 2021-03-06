package com.wdb3a.dacham.service;

import java.util.HashMap;
import java.util.List;

import com.wdb3a.dacham.bean.Customer;
import com.wdb3a.dacham.bean.Measure;

public interface CustomerService {

	public List<Customer> dietList(int diseaseCode) throws Exception;
	public List<Customer> cartList(String id) throws Exception;	
	public List<Customer> myOrderList(String id) throws Exception;
	public List<Customer> detailOrder(int dietCode) throws Exception;
	public List<Customer> sideDDetail(Customer customer) throws Exception;
	public void orderRegist(Customer customer) throws Exception ;
	public void cartRegist(Customer customer) throws Exception;	
	public void orderCart(Customer customer) throws Exception;
	
	public int recentlyOrderCode(String id) throws Exception;
	public void orderOptionRegist(HashMap options) throws Exception;
	public List<Customer> orderOption(int orderCode) throws Exception;
	public int getOneDCode(HashMap rInfo) throws Exception;
	
	public List<Customer> myNutri(String id) throws Exception;
	public int insertMeasure(Measure measure) throws Exception;
	public List<Measure> measureRead(String id) throws Exception;
	public List<Customer> menuShow(int diseaseCode) throws Exception;
	
	public void recentlyAddress(Customer customer) throws Exception;
}
