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

import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Deliver;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.service.DeliverService;

@RestController
@RequestMapping("deliverAjax")
public class DeliverAjaxController {
	@Inject
	private DeliverService service;
	
	@RequestMapping(value = "/{searchType}/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<OrderList>> listAll(@PathVariable("searchType")String searchType,@PathVariable("keyword")String keyword){
		ResponseEntity<List<OrderList>> entity = null;
		
		try {
			OrderList orderList = new OrderList();
			orderList.setSearchType(searchType);
			orderList.setKeyword(keyword);
			List<OrderList> list = service.listAll(orderList);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value = "/{orderCode}",method = RequestMethod.PUT)
	public ResponseEntity<String> transportNum(@PathVariable("orderCode")String orderCode, @RequestBody OrderList order){
		ResponseEntity<String> entity = null;
		try {
			order.setOrderCode(orderCode);
			service.transportNum(order);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/all/{page}/{orderItemCode}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> all(@PathVariable("orderItemCode")String orderItemCode,@PathVariable("page")int page){
		ResponseEntity<Map<String,Object>> entity = null;
		try {	
			Criteria criteria = new Criteria();
			criteria.setPage(page);
			int totalCount = service.allCount(orderItemCode);
			criteria.setTotalCount(totalCount);
			
			List<OrderList> list = service.all(orderItemCode,criteria);
			Map<String,Object> map = new HashMap<>();
			map.put("list",list);
			map.put("criteria", criteria);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/showDeliver/{searchType}/{keyword}",method = RequestMethod.GET)
	public ResponseEntity<List<Deliver>> showDeliver(@PathVariable("searchType")String searchType, @PathVariable("keyword")String keyword){
		ResponseEntity<List<Deliver>> entity = null;
		Deliver deliver = new Deliver();
		
		try {
			
			deliver.setSearchType(searchType);
			deliver.setKeyword(keyword);
			List<Deliver> list = service.showDeliver(deliver);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/showDeliverAll",method = RequestMethod.GET)
	public ResponseEntity<List<Deliver>> showDeliverAll(){
		ResponseEntity<List<Deliver>> entity = null;
		try {
			List<Deliver> list = service.showDeliverAll();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/changer/{orderCode}",method = RequestMethod.PUT)
	public ResponseEntity<String> changer(@PathVariable("orderCode")int orderCode){
		ResponseEntity<String> entity = null;
		try {
			service.changer(orderCode);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/completeAll/{page}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> completeAll(@PathVariable("page")int page){
		ResponseEntity<Map<String,Object>> entity = null;
		Criteria criteria = new Criteria();
		criteria.setPage(page);
		
		
		try {
			int totalCount = service.completeAllCount();
			criteria.setTotalCount(totalCount);
			List<Deliver> list = service.completeAll(criteria);
			Map<String,Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria);
			System.out.println("list:"+list);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/overButton/{foodMCode}",method = RequestMethod.PUT)
	public ResponseEntity<String> overButton(@PathVariable("foodMCode")int foodMCode){
		ResponseEntity<String> entity = null;
		try {
			service.overButton(foodMCode);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}

