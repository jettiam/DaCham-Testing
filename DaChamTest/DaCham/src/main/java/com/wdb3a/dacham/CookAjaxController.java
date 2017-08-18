package com.wdb3a.dacham;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.FoodMInven;
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
	@RequestMapping(value = "/foodStockAll/{page}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> foodStockAll(@PathVariable("page")int page){
		ResponseEntity<Map<String,Object>> entity = null;
		Criteria criteria = new Criteria();
		
		try {
			int totalCount = service.foodStockAll();
			criteria.setPage(page);
			criteria.setTotalCount(totalCount);
			List<FoodMInven> list = service.foodStockAll(criteria);
			Map<String,Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/foodStockSearch/{keyword}",method = RequestMethod.GET)
	public ResponseEntity<List<FoodMInven>> foodStock(@PathVariable("keyword")String keyword){
		ResponseEntity<List<FoodMInven>> entity = null;
		
		try {
			FoodMInven foodInv = new FoodMInven();
			foodInv.setKeyword(keyword);
			List<FoodMInven> list = service.CookStock(foodInv);
			System.out.println("¸®½ºÆ®:"+list);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
