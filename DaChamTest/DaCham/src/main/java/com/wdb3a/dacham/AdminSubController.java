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
