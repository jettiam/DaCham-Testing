package com.wdb3a.dacham.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Counsel;
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
	public Nutritionist openAPI(String foodMCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".openAPI",foodMCode);
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
	public List<Nutritionist> categorySearch(Nutritionist nutritionist,Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("nutritionist", nutritionist);
		map.put("criteria", criteria);
		return sqlSession.selectList(namespace+".categorySearch",map);
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

	@Override
	public Counsel specialView(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".specialView",counselCode);
	}

	@Override
	public void specialRegist(String customer) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".specialRegist",customer);
	}

	@Override
	public List<Nutritionist> specialToggle(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".specialToggle",nutritionist);
	}

	@Override
	public void specialComplete(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".specialComplete",counselCode);
	}

	@Override
	public List<Nutritionist> specialCode(String customer) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".specialCode",customer);
	}

	@Override
	public void reRegist(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".reRegist",counselCode);
	}

	@Override
	public void optionInsert(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".optionInsert",nutritionist);
	}

	@Override
	public String answer(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".answer",counselCode);
	}

	@Override
	public void answers(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".answers",nutritionist);
	}

	@Override
	public int maxDiet() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".maxDiet");
	}

	@Override
	public void remove1(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".remove1",sideDCode);
	}

	@Override
	public void remove2(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".remove2",sideDCode);
	}

	@Override
	public void remove3(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".remove3",sideDCode);
	}

	@Override
	public void remove0(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".remove0",sideDCode);
	}

	@Override
	public void delete0(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete0",dietCode);
	}

	@Override
	public void delete1(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete1",dietCode);
	}

	@Override
	public void delete2(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete2",dietCode);
	}

	@Override
	public void delete3(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete3",dietCode);
	}

	@Override
	public List<Nutritionist> sideMaterial(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".sideMaterial",sideDCode);
	}

	@Override
	public Nutritionist sideOver(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".sideOver",sideDCode);
	}

	@Override
	public void sideModify(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".sideModify",nutritionist);
	}

	@Override
	public void modifyCross1(String sideDCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".modifyCross1",sideDCode);
	}

	@Override
	public void modifyCross2(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".modifyCross2",nutritionist);
	}

	@Override
	public Nutritionist dietOver(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".dietOver",dietCode);
	}

	@Override
	public void dietModify(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".dietModify",nutritionist);
	}

	@Override
	public List<Nutritionist> groupSide(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".groupSide",nutritionist);
	}

	@Override
	public void updateCross1(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".updateCross1",dietCode);
	}

	@Override
	public void updateCross2(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".updateCross2",nutritionist);
	}

	@Override
	public List<Nutritionist> popup(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".popup",dietCode);
	}

	@Override
	public List<Nutritionist> callName(int sideDCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".callName",sideDCode);
	}

	@Override
	public int categorySearchCount(Nutritionist nutritionist) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".categorySearchCount",nutritionist);
	}
}
