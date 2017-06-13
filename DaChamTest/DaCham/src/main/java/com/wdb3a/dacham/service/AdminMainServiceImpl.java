package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

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
	public List<OrderList> orderListAll() throws Exception {
		return dao.orderListAll();
	}

	@Override
	public List<OrderList> datailview(String orderCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.datailview(orderCode);
	}

	@Override
	public List<FoodMInven> foodStockList() throws Exception {
		// TODO Auto-generated method stub
		return dao.foodStockList();
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
	public boolean send(String subject, String text, String from, String to) throws Exception {
		// javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);

            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
		return false;
	}

	

	

}
