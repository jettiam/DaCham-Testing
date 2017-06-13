package com.wdb3a.dacham.dao;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.xml.crypto.Data;

import org.springframework.data.mongodb.core.MongoTemplate;

import com.wdb3a.dacham.bean.Testing5;


public class MongoDAO {
	private MongoTemplate mongoTemplate;
	public void setMongoTemplate(MongoTemplate mongoTemplate){
		this.mongoTemplate = mongoTemplate;
	}
	/**
	 * wizard(json형태), block(xml)형태를 받아와서 "testing5"테이블에 삽입하는 mongodb 쿼리.
	 * 서비스와의 연동성은 차후에 생각..! 
	 * @param wizard
	 * @param block
	 */
	public void wizardInsert(String wizard, String block){
		System.out.println("DAO의 위자드"+wizard);
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeTime = new SimpleDateFormat("HH:mm:ss");
		String dateStr = dayTime.format(new Date(time));		
		String timeStr = timeTime.format(new Date(time));
		String jsonData = "{ date: '"+dateStr+"' , time : '"+timeStr+"', wizard : "+wizard+", block : '"+block+"'}";
		//System.out.println(jsonData);		
		mongoTemplate.insert(jsonData, "testing5");		
	}
	
	public List<Testing5> getTestingWizard(){
		List<Testing5> tt = mongoTemplate.findAll(Testing5.class, "testing5");
		return tt;
	}
	public void wizardFindTest(){
	}
	
	
}
