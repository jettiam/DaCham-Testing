package com.wdb3a.dacham;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.runner.Request;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.FoodMAmountRead;
import com.wdb3a.dacham.bean.orderList;
import com.wdb3a.dacham.service.AdminMainService;




@RestController
@RequestMapping(value="adminSub")
public class AdminSubController {
	
	@Inject
	private AdminMainService service; 
	
   @RequestMapping(value="/detailView/{orderCode}", method=RequestMethod.POST)
   @ResponseBody
   public List<orderList> detailView(@PathVariable("orderCode") String orderCode, Model model )throws Exception {			
	   System.out.println("dddd");
	   List<orderList> list= service.datailview(orderCode);
	   
	 
	  
		return  list;
	}
   

	/*@RequestMapping(value="/orderList3",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> getorderList3(@RequestBody FoodMAmountRead fooda) throws Exception{
		System.out.println("dddd");
		ResponseEntity<Map<String,Object>> entity = null;
		List<FoodMAmountRead> list;
		try {
		      list = service.foodMAmountRead(fooda.getOrderCode());
		      Map<String,Object> map = new HashMap<>();
		      map.put("list", list);
		      entity = new ResponseEntity<>(map,HttpStatus.OK);
		      System.out.println("Á¦¹ß");
		   } catch (Exception e) {      
		      e.printStackTrace();
		      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		   }
		
		List<FoodMAmountRead> list=service.FoodMAmountRead(order);
		model.addAttribute("list", list);
		return entity;
	}*/
   
	
	   
	
	/*   public ResponseEntity<String> removeReply(@PathVariable("rno") int rno) {
      ResponseEntity<String> entity = null;
      try {
         service.delete(rno);
         entity = new ResponseEntity<String> ("SUCCESS", HttpStatus.OK);
      } catch(Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<String> (e.getMessage(), HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
		
*/
}
