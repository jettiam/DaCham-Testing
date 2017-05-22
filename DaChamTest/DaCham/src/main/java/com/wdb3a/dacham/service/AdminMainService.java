package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.orderList;

@Service
public interface AdminMainService {
	public List<orderList> orderListAll() throws Exception; 
	public orderList datailview(String orderCode) throws Exception;

}
