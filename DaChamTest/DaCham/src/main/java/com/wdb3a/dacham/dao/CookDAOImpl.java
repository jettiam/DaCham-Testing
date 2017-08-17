package com.wdb3a.dacham.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.CookingItem;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;
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
	@Override
	public List<Cook> cookList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".cookList");
	}
	public List<Cook> readycook() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".readycook");
	}
	
	@Override
	public void transportNum2(OrderList orderList) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".transportNum2",orderList);
	}
	@Override
	public List<Cook> finishcook() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".finishcook");
	}
	@Override
	public List<Cook> readyScreen() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".readyScreen");
	}
	@Override
	public List<Cook> cookScreen() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".cookScreen");
	}
	@Override
	public List<Cook> endScreen() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".endScreen");
	}
	
	
	@Override
	public List<CookingItem> getCookingItemList() throws Exception {
		// DB에서 조리해야할 반찬목록 가져옴.
		return sqlSession.selectList(namespace+".selectCookingItem");
	}
	
	@Override
	public void updateOptionsItemCode(int orderItemCode, int sideDCode) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("orderItemCode", orderItemCode);
		map.put("sideDCode", sideDCode);
		sqlSession.update(namespace+".updateOptionsItemCode", map);		
	}
	@Override
	public List<FoodMInven> foodStockAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodStockAll",criteria);
	}
	@Override
	public int foodStockAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".foodStockAllCount");
	}

}
