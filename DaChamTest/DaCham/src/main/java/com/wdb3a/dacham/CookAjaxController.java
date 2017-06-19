package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.service.CookService;

@RestController
@RequestMapping("cookAjax")
public class CookAjaxController {
	@Inject
	private CookService service;
	
	@RequestMapping(value = "/readycook", method = RequestMethod.GET)
	public ResponseEntity<List<Cook>> readycook(){
		ResponseEntity<List<Cook>> entity = null;
		try {
			List<Cook> list = service.readycook();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/cookingfood", method = RequestMethod.GET)
	public ResponseEntity<List<Cook>> cookingfood(){
		ResponseEntity<List<Cook>> entity = null;
		try {
			List<Cook> list = service.cookingfood();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/finishfood", method = RequestMethod.GET)
	public ResponseEntity<List<Cook>> finishfood(){
		ResponseEntity<List<Cook>> entity = null;
		try {
			List<Cook> list = service.finishcook();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
