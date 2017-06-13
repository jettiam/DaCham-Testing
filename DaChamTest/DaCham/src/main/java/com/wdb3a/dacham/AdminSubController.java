package com.wdb3a.dacham;

import java.io.Console;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;
	@Inject
	private AdminMainService service; 
	
   @RequestMapping(value="/detailView/{orderCode}", method=RequestMethod.POST)
   @ResponseBody
   public List<orderList> detailView(@PathVariable("orderCode") String orderCode, Model model )throws Exception {			
	   System.out.println("dddd");
	   List<orderList> list= service.datailview(orderCode);
	   
	 
	  
		return  list;
	}
   

   @RequestMapping(value="/foodOrder",method=RequestMethod.POST)
	public ResponseEntity<String> getfoodOrder(@RequestBody String foodMArray) throws Exception{
	   ResponseEntity<String> entity = null;
	   JSONObject jsonobj = (JSONObject) JSONValue.parse(foodMArray);
	   
	   String toString = "";
	   String foodMCode = null;
	   String foodMName = null;
	   String price = null;
	   String foodMAmount = null;
	   String unit = null;
	  JSONArray aaa = (JSONArray) jsonobj.get("foodMInfo");
	  System.out.println(aaa);
	  for(int i=0; i<aaa.size(); i++){    
          //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
          JSONObject bookObject = (JSONObject) aaa.get(i);
          toString = toString + "\n" + ("식재료명 :" + bookObject.get("foodMName") + " 단가 :"+bookObject.get("price") + " 주문량 :" + bookObject.get("foodMAmount") + " 단위 : " + bookObject.get("unit"));
      }
	  	System.out.println(toString);
	  	SimpleMailMessage  simpleMailMessage = new SimpleMailMessage();
	  	simpleMailMessage.setFrom("dudtka4971@naver.com");
	  	simpleMailMessage.setTo("dudtka4971@naver.com");
	  	simpleMailMessage.setSubject("제발");
	  	simpleMailMessage.setText(toString);
	  	System.out.println("돌아감");
	  	javaMailSenderImpl.send(simpleMailMessage);
	  	System.out.println("돌아감2");
	  	
	  	
	  	/*if(a){
	  		entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	  	}else{
	  		entity = new ResponseEntity<String>("실패",HttpStatus.BAD_REQUEST);
	  	}*/
		return entity;
	}
	   
   /*@RequestMapping(value = "/sendMail/auth", method = RequestMethod.POST, produces = "application/json")
   @ResponseBody
   public boolean sendMailAuth(HttpSession session, @RequestParam String email) {
       int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
       String joinCode = String.valueOf(ran);
       session.setAttribute("joinCode", joinCode);

       String subject = "회원가입 인증 코드 발급 안내 입니다.";
       StringBuilder sb = new StringBuilder();
       sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
       return mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
   }*/
   
   
   
   
   
   
   
   /*@RequestMapping(value="/{rno}",method=RequestMethod.DELETE)
	public ResponseEntity<String> removeReply(@PathVariable("rno") int rno){
		ResponseEntity<String> entity = null;
		try{
			service.delete(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}*/
	
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
		      System.out.println("제발");
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

