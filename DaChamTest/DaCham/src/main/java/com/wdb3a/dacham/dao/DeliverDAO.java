package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Deliver;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;

public interface DeliverDAO {
	public List<OrderList> listAll(OrderList orderList) throws Exception;
	public List<Nutritionist> listMaterial() throws Exception;
	public void createDeliver(Deliver deliver) throws Exception;
	public List<Deliver> showDeliver(Deliver deliver) throws Exception;
	public void transportNum(OrderList orderList) throws Exception;
	public List<OrderList> all(String orderItemCode,Criteria criteria) throws Exception;
	public int allCount(String orderItemCode) throws Exception;
	public int showDeliverCount() throws Exception;
	public List<Deliver> showDeliverAll(Criteria criteria) throws Exception;
	public void changer(int orderCode) throws Exception;
	public void todaySynchro(int orderCode) throws Exception;
	public List<Deliver> completeAll(Criteria criteria) throws Exception;
	public int completeAllCount() throws Exception;
	public void overButton(int foodMICode) throws Exception;
	public void changer0(String foodMName) throws Exception;
	public List<Deliver> doing(Criteria criteria) throws Exception;
	public int doingCount() throws Exception;
	public int showDeliverAllCount() throws Exception;
}
