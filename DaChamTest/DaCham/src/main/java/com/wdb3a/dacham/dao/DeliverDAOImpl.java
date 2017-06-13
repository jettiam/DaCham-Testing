package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
