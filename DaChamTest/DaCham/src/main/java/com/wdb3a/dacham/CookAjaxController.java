package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.service.CookService;

@RestController
@RequestMapping("cookAjax")
public class CookAjaxController {
	@Inject
	private CookService service;
	
	
	@RequestMapping(value = "/{orderCode}",method = RequestMethod.PUT)
	public ResponseEntity<String> transportNum(@PathVariable("orderCode")String orderCode){
		ResponseEntity<String> entity = null;
		try {
			OrderList order = new OrderList();
			order.setOrderCode(orderCode);
			service.transportNum2(order);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
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
	@RequestMapping(value = "/readyScreen",method = RequestMethod.GET)
	public ResponseEntity<List<Cook>> readyScreen(){
		ResponseEntity<List<Cook>> entity = null;
		try{
			List<Cook> list = service.readyScreen();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/cookScreen",method = RequestMethod.GET)
	public ResponseEntity<List<Cook>> cookScreen(){
		ResponseEntity<List<Cook>> entity = null;
		
		try {
			List<Cook> list = service.cookScreen();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/endScreen",method = RequestMethod.GET)
	public ResponseEntity<List<Cook>> endScreen(){
		ResponseEntity<List<Cook>> entity = null;
		
		try {
			List<Cook> list = service.endScreen();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="updateOptionsItemCode")
	public ResponseEntity<String> updateOptionsItem(int orderItemCode, int sideDCode){
		ResponseEntity<String> entity = null;	
		try {
			service.updateOptionsItemCode(orderItemCode, sideDCode);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}		
		return entity;		
	}
}
