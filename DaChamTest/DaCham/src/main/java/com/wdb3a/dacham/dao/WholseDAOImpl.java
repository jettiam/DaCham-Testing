package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.FoodMInven;

@Repository
public class WholseDAOImpl implements WholseDAO {
	private static final String namespace="com.wdb3a.WholseMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<FoodMInven> foodMOrderList() throws Exception {		
		return sqlSession.selectList(namespace+".foodMOrderList");
	}

	@Override
	public List<FoodMInven> foodMOrderListDetail(String orderDate) throws Exception {
		System.out.println("식재료 디테일");
		System.out.println(orderDate);
		return sqlSession.selectList(namespace+".foodMOrderListDetail",orderDate);
	}
}
