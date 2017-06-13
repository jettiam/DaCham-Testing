package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.FoodMAmountRead;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;
@Repository
public class AdminMainDAOImpl implements AdminMainDAO {
	private static final String namespace="com.wdb3a.AdminMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<OrderList> orderListAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listAll");
	}

	@Override
	public List<OrderList> datailview(String orderCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".read", orderCode);
	}

	@Override
	public List<FoodMInven> foodStockList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodStockList");
	}

	@Override
	public void refundUpdate(OrderList list) throws Exception {
		sqlSession.update(namespace+".refundupdate", list);
	}

	@Override
	public void workUpdate(OrderList list) throws Exception {
		sqlSession.update(namespace+".workupdate", list);
		
	}

	@Override
	public List<FoodMAmountRead> foodMAmountRead(int orderCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodMAmountRead", orderCode);
	}

	

	
}
