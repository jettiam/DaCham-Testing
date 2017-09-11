package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

@Service
public interface AdminMainService {
	public List<OrderList> orderListAll(OrderList orderList) throws Exception; 
	public List<OrderList> datailview(String orderCode) throws Exception;
	public List<FoodMInven> foodStockList(FoodMInven foodMInven) throws Exception;
	public void refundUpdate(OrderList list) throws Exception;
	public void workUpdate(OrderList list) throws Exception;
	public List<FoodMAmountRead> foodMAmountRead(int orderCode) throws Exception;
	public List<ChartList> chartList() throws Exception;
	public List<ChartList> chartList1() throws Exception; 
	public List<ChartPrice> chartPrice() throws Exception;
	public List<ChartPrice> chartPrice1(ChartPrice dates) throws Exception;
	public List<ChartPrice> adminMainUp() throws Exception;
	public List<OrderList> all(Criteria criteria) throws Exception;
	public List<OrderList> orderAll(Criteria criteria) throws Exception;
	public List<FoodMInven> foodStockListAll(Criteria criteria) throws Exception; 
	
	
	public int orderListCount() throws Exception;
	public int orderCount() throws Exception;
	public int foodStockListCount() throws Exception;
	public int foodStockListStopCount() throws Exception;
	public int dietAllCount() throws Exception;
	public List<OrderList> orderItemNameCount() throws Exception;
	public List<OrderList> orderAllCountTd() throws Exception; 
	public List<Diet> DietAllTdCount() throws Exception; 
	
	//public List<OrderList> orderAll(OrderList orderList) throws Exception;
	public List<OrderList> orderAllSearch(OrderList orderList) throws Exception;
	public List<OrderList> orderSort1(Criteria criteria) throws Exception;
	public List<OrderList> orderSort2(Criteria criteria) throws Exception;
	public List<OrderList> orderSort3(Criteria criteria) throws Exception; 
	public List<OrderList> orderSort4(Criteria criteria) throws Exception;
	public List<OrderList> orderSort5(Criteria criteria) throws Exception;
	
	public String appTest(String id) throws Exception;
	public List<Diet> dietAll(Criteria criteria) throws Exception;
	public void dietPriceUp(Diet diet) throws Exception;
	public void dietSell(int dietCode) throws Exception;
	public void dietSellStop(int dietCode) throws Exception;
	public List<Diet> disease1() throws Exception;
	public List<Diet> disease2() throws Exception;
	public List<Diet> disease3() throws Exception; 
	public List<Diet> disease4() throws Exception;
	public List<Diet> disease5() throws Exception;
	public void empjoin(Member member) throws Exception;
	public List<Member> memberAll() throws Exception;
	public List<Member> memberNomal() throws Exception; 
	public Member memberUserInfo(String id) throws Exception;  
	public void joinOut(String id) throws Exception; 
	public void empUpdate(Member member) throws Exception;
	public void insertFoodM(FoodMAmountRead foodMAmountRead) throws Exception;
	public void foodMUpdate(int orderCode) throws Exception;
	public List<FoodMaterial> foodMaterialSearch(FoodMaterial foodMaterial) throws Exception;
	public List<Member> memberSearch(Member member) throws Exception;
	public void insertFoodMAdd(FoodMAmountRead foodMAmountRead) throws Exception;
	public List<FoodMInven> foodStockListStop(Criteria criteria) throws Exception;
}
