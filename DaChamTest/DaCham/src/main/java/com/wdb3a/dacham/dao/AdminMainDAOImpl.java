package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.orderList;
@Repository
public class AdminMainDAOImpl implements AdminMainDAO {
	private static final String namespace="com.wdb3a.AdminMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<orderList> orderListAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listAll");
	}

	@Override
	public List<orderList> datailview(String orderCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".read", orderCode);
	}

	@Override
	public List<FoodMInven> foodStockList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodStockList");
	}

	
}
