package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.orderList;

public interface AdminMainDAO {
	//orderList 전체 출력
	public List<orderList> orderListAll() throws Exception;
	public orderList datailview(String orderCode) throws Exception;
}
