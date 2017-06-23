package com.wdb3a.dacham.dao;

import java.util.HashMap;
import java.util.List;

import com.wdb3a.dacham.bean.Customer;

public interface CustomerDAO {

	public List<Customer> dietList(int diseaseCode) throws Exception;

	public List<Customer> detailOrder(int dietCode) throws Exception;

	public List<Customer> sideDDetail(String foodGCode) throws Exception;


	public List<Customer> cartList(String id) throws Exception;
	
	public List<Customer> myOrderList(String id) throws Exception;


	public void orderRegist(Customer customer) throws Exception;
	
	public void cartRegist(Customer customer) throws Exception;

	public void orderCart(Customer customer) throws Exception;

	public int recentlyOrderCode(String id) throws Exception;
	public void orderOptionRegist(HashMap options) throws Exception;
	public List<Customer> orderOption(int orderCode) throws Exception;
	public int getOneDCode(String rName, String rJudg) throws Exception;

}
