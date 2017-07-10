package com.wdb3a.dacham.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;
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
	public List<Nutritionist> materialAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".materialAmount",criteria);
	}
	//반찬 템플릿의 개수를 구합니다.
	@Override
	public int optionTemplateCount(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".optionTemplateCount",nutritionist);
	}

	@Override
	public List<Nutritionist> sideAll(String foodGCode,Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("foodGCode", foodGCode);
		map.put("criteria", criteria);
		return sqlSession.selectList(namespace+".sideAll",map);
	}

	@Override
	public List<Nutritionist> diseaseDietOverview(String diseaseName, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("diseaseName", diseaseName);
		map.put("criteria", criteria);
		return sqlSession.selectList(namespace+".diseaseDietOverview",map);
	}

	@Override
	public List<Nutritionist> categorySearch(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".categorySearch",nutritionist);
	}

	@Override
	public List<OrderList> orderList(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderList",criteria);
	}

	@Override
	public List<OrderList> thisMonth(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".thisMonth",criteria);
	}

	@Override
	public Nutritionist allNutri(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".allNutri",sideDCode);
	}

	@Override
	public int orderList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".orderListCount");
	}

	@Override
	public int diseaseDietCount(String diseaseName) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".diseaseDietCount",diseaseName);
	}

	@Override
	public int sideAllCount(String foodGCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".sideAllCount",foodGCode);
	}

	@Override
	public int thisMonthCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".thisMonthCount");
	}

	@Override
	public List<OrderList> specialList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".specialList");
	}

	@Override
	public int materialTotal() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".materialTotal");
	}

	

}
