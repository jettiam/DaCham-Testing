package com.wdb3a.dacham.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Deliver;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;

@Repository
public class DeliverDAOImpl implements DeliverDAO{
	private static final String namespace="com.wdb3a.DeliverMapper";
	
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<OrderList> listAll(OrderList orderList) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".deliverList", orderList);
	}
	@Override
	public List<Nutritionist> listMaterial() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".deliverName");
	}
	@Override
	public void createDeliver(Deliver deliver) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".createDeliver",deliver);
	}
	@Override
	public List<Deliver> showDeliver(Deliver deliver) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".showDeliver",deliver);
	}
	@Override
	public void transportNum(OrderList orderList) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".transportNum",orderList);
	}
	@Override
	public List<OrderList> all(String orderItemCode,Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderItemCode", orderItemCode);
		map.put("criteria", criteria);
		return sqlSession.selectList(namespace+".all",map);
	}
	@Override
	public int allCount(String orderItemCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".allCount",orderItemCode);
	}
	@Override
	public int showDeliverCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".showCount");
	}
	@Override
	public List<Deliver> showDeliverAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".showDeliverAll");
	}
	@Override
	public void changer(int orderCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".changer",orderCode);
	}
	@Override
	public void todaySynchro(int orderCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".todaySynchro",orderCode);
	}
	@Override
	public List<Deliver> completeAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".completeAll",criteria);
	}
	@Override
	public int completeAllCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".completeAllCount");
	}
	@Override
	public void overButton(int foodMICode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".overButton",foodMICode);
	}
	@Override
	public void changer0(int foodMICode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".changer0",foodMICode);
	}

}
