package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Nutritionist;
@Repository
public class NutritionistDAOImpl implements NutritionistDAO {
	private static final String namespace="com.wdb3a.NutritionistMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<Nutritionist> listSearch(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listSearch",nutritionist);
	}

}
