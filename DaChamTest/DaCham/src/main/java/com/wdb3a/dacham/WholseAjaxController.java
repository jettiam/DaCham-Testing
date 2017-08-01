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

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.service.WholseService;

@RestController
@RequestMapping(value = "wholesale")
public class WholseAjaxController {
	@Inject
	private WholseService service;
	
	@RequestMapping(value = "/foodMOrderList", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> foodMOrderList(){
		ResponseEntity<Map<String, Object>> entity = null;	
		List<FoodMInven> list;		
		try {
			list = service.foodMOrderList();
						
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {		
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;		
	}
	
	
	

}
