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

}
