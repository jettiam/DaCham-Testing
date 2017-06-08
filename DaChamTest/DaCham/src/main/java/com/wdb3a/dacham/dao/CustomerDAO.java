package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Customer;

public interface CustomerDAO {
public List<Customer> dietList(int diseaseCode) throws Exception;
}
