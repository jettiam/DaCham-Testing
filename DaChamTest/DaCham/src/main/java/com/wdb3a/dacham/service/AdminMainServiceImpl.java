package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.ChartList;
import com.wdb3a.dacham.bean.ChartPrice;
import com.wdb3a.dacham.bean.FoodMAmountRead;
import com.wdb3a.dacham.bean.FoodMInven;
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

	
	
	

	

	

	

}
