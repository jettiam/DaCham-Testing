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
		System.out.println("식재료리스트 여기까지옴");
		return sqlSession.selectList(namespace+".foodMOrderList");
	}
}
