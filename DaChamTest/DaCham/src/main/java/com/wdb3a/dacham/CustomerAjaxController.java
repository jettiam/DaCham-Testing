package com.wdb3a.dacham;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Customer;
import com.wdb3a.dacham.service.CustomerService;

@RestController
@RequestMapping(value = "customerAjax")
public class CustomerAjaxController {
@Inject
private CustomerService service;

@RequestMapping(value ="dietList/{diseaseCode}", method = RequestMethod.GET)
public ResponseEntity<Map<String,Object>> dietList(@PathVariable("diseaseCode")int diseaseCode){
	ResponseEntity<Map<String,Object>> entity = null;
	List<Customer> list;
	try {
		list = service.dietList(diseaseCode);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		entity = new ResponseEntity<>(map,HttpStatus.OK);
	} catch (Exception e) {		
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	return entity;	
}
}
