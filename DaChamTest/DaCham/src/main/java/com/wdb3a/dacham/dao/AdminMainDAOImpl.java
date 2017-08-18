package com.wdb3a.dacham.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.AppTest;
import com.wdb3a.dacham.bean.ChartList;
import com.wdb3a.dacham.bean.ChartPrice;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Diet;
import com.wdb3a.dacham.bean.FoodMAmountRead;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.FoodMaterial;
import com.wdb3a.dacham.bean.Member;
import com.wdb3a.dacham.bean.OrderList;
@Repository
public class AdminMainDAOImpl implements AdminMainDAO {
	private static final String namespace="com.wdb3a.AdminMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override

	public List<OrderList> orderListAll(OrderList orderList) throws Exception {

		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listAll",orderList);
	}

	@Override
	public List<OrderList> datailview(String orderCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".read", orderCode);
	}

	@Override
	public List<FoodMInven> foodStockList(FoodMInven foodMInven) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodStockListSearch", foodMInven);
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

	@Override
	public List<ChartList> chartList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".chartList");
	}

	@Override
	public List<ChartPrice> chartPrice() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".chartprice");
	}

	@Override
	public List<ChartPrice> chartPrice1(ChartPrice dates) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".chartprice1", dates);
	}

	@Override
	public List<OrderList> all(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".all", criteria); 
	}

	@Override
	public List<OrderList> orderAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderAll", criteria); 
	}

	@Override
	public List<FoodMInven> foodStockListAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodStockList", criteria);
	}

	@Override
	public int orderListCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".orderALlCount");
	}

	/*@Override
	public List<OrderList> orderAll(OrderList orderList) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace+".orderAll", orderList);  
	}*/

	@Override
	public List<OrderList> orderAllSearch(OrderList orderist) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace+".orderAllSearch", orderist);
	}

	@Override
	public String appTest(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao됨");
		return sqlSession.selectOne(namespace+".AppTest", id);
	}

	@Override
	public List<Diet> dietAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".DietAll", criteria);
	}

	@Override
	public void dietPriceUp(Diet diet) throws Exception {
		System.out.println("되니나?");
		sqlSession.update(namespace+".dietPriceUp", diet);
		System.out.println("되니?");
	}

	@Override
	public void dietSell(int dietCode) throws Exception {
		sqlSession.update(namespace+".dietSell", dietCode);
		
	}

	@Override
	public void dietSellStop(int dietCode) throws Exception {
		sqlSession.update(namespace+".dietSellStop", dietCode);
		
	}

	@Override
	public List<Diet> disease1() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".disease1");
	}

	@Override
	public List<Diet> disease2() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".disease2");
	}

	@Override
	public List<Diet> disease3() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".disease3");
	}

	@Override
	public List<Diet> disease4() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".disease4");
	}

	@Override
	public void empjoin(Member member) throws Exception {
		sqlSession.insert(namespace+".empjoin", member);
		
	}

	@Override
	public List<Member> memberAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".memberAll");
	}

	@Override
	public Member memberUserInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".memberUserInfo", id); 
	}

	@Override
	public void joinOut(String id) throws Exception {
		sqlSession.update(namespace+".joinOut", id);  
	}

	@Override
	public void empUpdate(Member member) throws Exception {
		sqlSession.update(namespace+".empUpdate", member);
		
	}

	@Override
	public void insertFoodM(FoodMAmountRead foodMAmountRead) throws Exception {
		sqlSession.insert(namespace+".insertFoodM", foodMAmountRead);
		
	}

	@Override
	public void foodMUpdate(int orderCode) throws Exception {
		sqlSession.insert(namespace+".foodMUpdate", orderCode); 
		
	}

	@Override
	public List<FoodMaterial> foodMaterialSearch(FoodMaterial foodMaterial) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodMaterial", foodMaterial);
	}

	@Override
	public List<Member> memberSearch(Member member) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".memberSearch", member); 
	}

	@Override
	public void insertFoodMAdd(FoodMAmountRead foodMAmountRead) throws Exception {
		sqlSession.insert(namespace+".insertFoodMAdd", foodMAmountRead);
		
	}

	@Override
	public List<FoodMInven> foodStockListStop(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".foodStockListStop", criteria);
	}

	@Override
	public List<OrderList> orderSort1(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderSort1", criteria);
	}

	@Override
	public List<OrderList> orderSort2(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderSort2", criteria);
	}

	@Override
	public List<OrderList> orderSort3(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderSort3", criteria);
	}

	@Override
	public List<OrderList> orderSort4(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderSort4", criteria);
	}

	@Override
	public int orderCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".orderListCount");
	}

	@Override
	public int foodStockListCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".foodStockListCount");
	}

	@Override
	public int foodStockListStopCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".foodStockListStopCount");
	}

	@Override
	public int dietAllCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".dietAllCount");
	}

	@Override
	public List<OrderList> orderSort5(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderSort5", criteria);
	}

	@Override
	public List<OrderList> orderItemNameCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderItemNameCount");
	}

	@Override
	public List<Member> memberNomal() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".memberNomal");
	}

	@Override
	public List<OrderList> orderAllCountTd() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderAllCountTd"); 
	}

	

	

	

	 

	

	

	
}
