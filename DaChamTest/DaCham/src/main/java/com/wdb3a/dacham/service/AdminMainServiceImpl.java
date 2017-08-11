package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import com.wdb3a.dacham.dao.AdminMainDAO;

@Service
public class AdminMainServiceImpl implements AdminMainService {
	private JavaMailSender javaMailSender;
	
	public void setJavaMailSender(JavaMailSender javaMailSender) {
	        this.javaMailSender = javaMailSender;
	    }
	@Inject
	private AdminMainDAO dao;
	@Override
	public List<OrderList> orderListAll(OrderList orderList) throws Exception {
		return dao.orderListAll(orderList);
	}

	@Override
	public List<OrderList> datailview(String orderCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.datailview(orderCode);
	}

	@Override
	public List<FoodMInven> foodStockList(FoodMInven foodMInven) throws Exception {
		// TODO Auto-generated method stub
		return dao.foodStockList(foodMInven);
	}

	@Override
	public void refundUpdate(OrderList list) throws Exception {
		dao.refundUpdate(list);
		
	}

	@Override
	public void workUpdate(OrderList list) throws Exception {
		dao.workUpdate(list);
		
	}

	@Override
	public List<FoodMAmountRead> foodMAmountRead(int orderCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.foodMAmountRead(orderCode);
	}

	@Override
	public List<ChartList> chartList() throws Exception {
		// TODO Auto-generated method stub
		return dao.chartList();
	}

	@Override
	public List<ChartPrice> chartPrice() throws Exception {
		// TODO Auto-generated method stub
		return dao.chartPrice();
	}

	@Override
	public List<ChartPrice> chartPrice1(ChartPrice dates) throws Exception {
		// TODO Auto-generated method stub
		return dao.chartPrice1(dates);
	}

	@Override
	public List<OrderList> all(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.all(criteria);  
	}

	@Override
	public List<OrderList> orderAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderAll(criteria);
	}

	@Override
	public List<FoodMInven> foodStockListAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.foodStockListAll(criteria);  
	}

	@Override
	public int orderListCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.orderListCount();
	}

	/*@Override
	public List<OrderList> orderAll(OrderList orderList) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderAll(orderList);
	}*/    

	@Override
	public List<OrderList> orderAllSearch(OrderList orderList) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderAllSearch(orderList);
	}

	@Override
	public String appTest(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스됨");
		return dao.appTest(id);
	}

	@Override
	public List<Diet> dietAll(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.dietAll(criteria);
	}

	@Override
	public void dietPriceUp(Diet diet) throws Exception {
		System.out.println("되니1?");
		dao.dietPriceUp(diet);
		System.out.println("되니2?");
	}

	@Override
	public void dietSell(int dietCode) throws Exception {
		dao.dietSell(dietCode);
		
	}

	@Override
	public void dietSellStop(int dietCode) throws Exception {
		dao.dietSellStop(dietCode);
		
	}

	@Override
	public List<Diet> disease1() throws Exception {
		// TODO Auto-generated method stub
		return dao.disease1();
	}

	@Override
	public List<Diet> disease2() throws Exception {
		// TODO Auto-generated method stub
		return dao.disease2();
	}

	@Override
	public List<Diet> disease3() throws Exception {
		// TODO Auto-generated method stub
		return dao.disease3();
	}

	@Override
	public List<Diet> disease4() throws Exception {
		// TODO Auto-generated method stub
		return dao.disease4();
	}

	@Override
	public void empjoin(Member member) throws Exception {
		dao.empjoin(member);
	}

	@Override
	public List<Member> memberAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.memberAll(); 
	}

	@Override
	public Member memberUserInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberUserInfo(id);
	}

	@Override
	public void joinOut(String id) throws Exception {
		dao.joinOut(id);
	}

	@Override
	public void empUpdate(Member member) throws Exception {
		dao.empUpdate(member);
		
	}

	@Override
	public void insertFoodM(FoodMAmountRead foodMAmountRead) throws Exception {
		dao.insertFoodM(foodMAmountRead); 		
	}

	@Override
	public void foodMUpdate(int orderCode) throws Exception {
		dao.foodMUpdate(orderCode); 
	}

	@Override
	public List<FoodMaterial> foodMaterialSearch(FoodMaterial foodMaterial) throws Exception {
		// TODO Auto-generated method stub
		return dao.foodMaterialSearch(foodMaterial);
	}

	@Override
	public List<Member> memberSearch(Member member) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberSearch(member);
	}

	@Override
	public void insertFoodMAdd(FoodMAmountRead foodMAmountRead) throws Exception {
		dao.insertFoodMAdd(foodMAmountRead);
		
	}

	@Override
	public List<FoodMInven> foodStockListStop(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.foodStockListStop(criteria);
	}

	@Override
	public List<OrderList> orderSort1(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderSort1(criteria);
	}

	@Override
	public List<OrderList> orderSort2(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderSort2(criteria);
	}

	@Override
	public List<OrderList> orderSort3(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderSort3(criteria);
	}

	@Override
	public List<OrderList> orderSort4(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderSort4(criteria);
	}

	@Override
	public int orderCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.orderCount();
	}

	@Override
	public int foodStockListCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.foodStockListCount();
	}

	@Override
	public int foodStockListStopCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.foodStockListStopCount();
	}

	@Override
	public int dietAllCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.dietAllCount();  
	}

	
	
	
	

	

	

	

}
