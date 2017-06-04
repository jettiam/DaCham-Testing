package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.orderList;

@Repository
public class DeliverDAOImpl implements DeliverDAO{
	private static final String namespace="com.wdb3a.DeliverMapper";
	
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<orderList> listAll(orderList orderList) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".deliverList", orderList);
	}

}
