package com.wdb3a.dacham;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.runner.Request;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.orderList;
import com.wdb3a.dacham.service.AdminMainService;


@RestController
@RequestMapping(value="adminSub")
public class AdminSubController {
	
	@Inject
	private AdminMainService service; 
	
	@RequestMapping(value="/detailView/{orderCode}", method = RequestMethod.GET)
	public ResponseEntity<String> detailView(@PathVariable("orderCode") String orderCode){
		ResponseEntity<String> entity = null;
		System.out.println("¼º°ø");
		try {
			//List<orderList> list = service.detailview(orderCode);
			entity = new ResponseEntity<String> ("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return entity;
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
