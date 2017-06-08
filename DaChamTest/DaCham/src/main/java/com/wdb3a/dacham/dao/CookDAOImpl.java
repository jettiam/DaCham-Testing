package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.FoodMInven;
@Repository
public class CookDAOImpl implements CookDAO {
	private static final String namespace="com.wdb3a.CookerMapper";
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<FoodMInven> CookStock(FoodMInven foodInv) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodStock",foodInv);
	}

}
