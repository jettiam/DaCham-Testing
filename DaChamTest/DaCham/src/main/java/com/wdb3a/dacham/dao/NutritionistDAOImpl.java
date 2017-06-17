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

	@Override
	public void createAmount(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".createAmount",nutritionist);
	}

	@Override
	public Nutritionist openAPI(String foodMName) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".openAPI",foodMName);
	}

	@Override
	public void createDiet(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".createDiet",nutritionist);
	}

	@Override
	public List<Nutritionist> choiceDisease() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".choiceDisease");
	}

	@Override
	public void createDietInfo(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".createDietInfo",nutritionist);
	}

	@Override
	public Nutritionist showKcal(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".showKcal",sideDCode);
	}

	@Override
	public List<Nutritionist> optionTemplate(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".optionTemplate",nutritionist);
	}

	@Override
	public List<Nutritionist> materialAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".materialAmount");
	}
	//반찬 템플릿의 개수를 구합니다.
	@Override
	public int optionTemplateCount(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".optionTemplateCount",nutritionist);
	}

	@Override
	public List<Nutritionist> sideAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".sideAll");
	}

	@Override
	public List<Nutritionist> diseaseDietOverview(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".diseaseDietOverview",nutritionist);
	}

	

}
