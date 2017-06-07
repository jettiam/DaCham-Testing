package com.wdb3a.dacham;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.service.NutritionistService;


@RestController
@RequestMapping(value = "nutriAjax")
public class NutritionistAjaxController {
	@Inject
	private NutritionistService service;
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getAll(Nutritionist nutritionist){
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			List<Nutritionist> list = service.listSearch(nutritionist);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody Nutritionist nutritionist){
		ResponseEntity<String> entity = null;
		try {
			service.create(nutritionist);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			System.out.println("식재료 이동");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
