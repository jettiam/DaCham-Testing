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

	@Override
	public List<Nutritionist> materialSearch(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".materialSearch",nutritionist);
	}

	@Override
	public Nutritionist materialView(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".materialAmount",sideDCode);
	}

	@Override
	public void create(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".createAmount",nutritionist);
	}

	@Override
	public void createSide(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".createSide",nutritionist);
	}

}
