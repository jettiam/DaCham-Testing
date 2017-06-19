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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Customer;
import com.wdb3a.dacham.service.CustomerService;

@RestController
@RequestMapping(value = "customerAjax")
public class CustomerAjaxController {
	@Inject
	private CustomerService service;

	@RequestMapping(value = "dietList/{diseaseCode}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> dietList(@PathVariable("diseaseCode") int diseaseCode) {
		ResponseEntity<Map<String, Object>> entity = null;
		List<Customer> list;
		try {
			list = service.dietList(diseaseCode);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	@RequestMapping(value="getfoodG/{foodGCode}",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getDetailSideD(@PathVariable("foodGCode") String foodGCode){
		System.out.println("식품군 "+foodGCode);
		ResponseEntity<Map<String, Object>> entity = null;
		List<Customer> list;
		try {
			list = service.sideDDetail(foodGCode);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;		
	}
	/**
	 * 
	 * @param cu
	 * @return 장바구니로 이동
	 */
	@RequestMapping(value="myCart",method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> getMyCart(@RequestBody Customer cu){
		
		ResponseEntity<Map<String, Object>> entity = null;
		List<Customer> list;
		try {
			list = service.cartList(cu.getId());
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		}
	
	
	/**
	 * 
	 * @return 결제 컨트롤러
	 */
	@RequestMapping(value="/payment",method=RequestMethod.POST)
	public ResponseEntity<String> payment(@RequestBody List<Customer> list){
		System.out.println(list.size());
		ResponseEntity<String> entity = null;
		try {
			for(int i=0;i<list.size();i++){
				service.orderCart(list.get(i));
			}			
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
}
