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

import com.wdb3a.dacham.bean.Counsel;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Customer;
import com.wdb3a.dacham.bean.Measure;
import com.wdb3a.dacham.service.CounselService;
import com.wdb3a.dacham.service.CustomerService;

@RestController
@RequestMapping(value = "customerAjax")
public class CustomerAjaxController {
	@Inject
	private CustomerService service;
	
	@Inject
	private CounselService serviceCO;
	
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
	@RequestMapping(value="getfoodG/{foodGCode}/{dietCode}",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getDetailSideD(@PathVariable("foodGCode") String foodGCode,@PathVariable("dietCode") String dietCode,Customer customer){
		System.out.println("식품군:"+foodGCode+" 식단코드:"+dietCode);
		ResponseEntity<Map<String, Object>> entity = null;
		List<Customer> list;		
		customer.setFoodGCode(foodGCode);
		customer.setDietCode(Integer.parseInt(dietCode));
		try {			
			list = service.sideDDetail(customer);
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
		List<Customer> options;
		try {
			list = service.cartList(cu.getId());
			Map<String, Object> map = new HashMap<>();
			for(int i=0; i<list.size(); i++){
				int orderCode = list.get(i).getOrderCode();
				String sCode = orderCode+"";
				options = service.orderOption(orderCode);
				map.put(sCode, options);
			}
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
	 * @param mo
	 * @return 주문내역으로 이동
	 */
	@RequestMapping(value="myOrderlist",method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> getOrderlist(@RequestBody Customer mo){
		
		ResponseEntity<Map<String, Object>> entity = null;
		List<Customer> list;
		try {
			list = service.myOrderList(mo.getId());
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
		Customer customer = new Customer();
		String id = list.get(0).getId();
		String recentlyAddress = list.get(0).getRecentlyAddress();
		System.out.println("아이디 "+id+" 주소 "+recentlyAddress);
		customer.setId(id);
		customer.setRecentlyAddress(recentlyAddress);
		try {
			service.recentlyAddress(customer);
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
	
	@RequestMapping(value="myNutri",method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> getMyNutri(@RequestBody Customer no){
		
		ResponseEntity<Map<String, Object>> entity = null;
		System.out.println("1");
		List<Customer> list;
		System.out.println(no.getId());
		try {
			list = service.myNutri(no.getId());
			System.out.println("3");
			Map<String, Object> map = new HashMap<>();
			System.out.println("4");
			map.put("list", list);
			System.out.println("4");
			entity = new ResponseEntity<>(map,HttpStatus.OK);
			System.out.println("5");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("6");
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			System.out.println("7");
		}
		return entity;
		}
	/**
	 * 건강정보 삽입
	 * @param measure
	 * @return 성공유무 문자열
	 */
	@RequestMapping(value="insertMeasure",method=RequestMethod.POST)
	public ResponseEntity<String> insertHealth(@RequestBody Measure measure ){
		ResponseEntity<String> entity = null;
		
		System.out.println("아이디 "+measure.getId());
		String lowBoloodP;
		String highBoloodP;
		String lowBoloodS;
		String highBoloodS;
		
		try {
			measure.setMeasureICode("01");
			measure.setReading(measure.getLowBooldP());
			int checkCode = service.insertMeasure(measure);
			if(checkCode==0){
				lowBoloodP = "lowBoloodP:SUCCESS";
			}else{
				lowBoloodP = "lowBoloodP:FAIL";
			}
			//0성공,1중복
			measure.setMeasureICode("02");
			measure.setReading(measure.getHighBooldP());
			checkCode = service.insertMeasure(measure);
			if(checkCode==0){
				highBoloodP = "highBoloodP:SUCCESS";
			}else{
				highBoloodP = "highBoloodP:FAIL";
			}
			measure.setMeasureICode("03");
			measure.setReading(measure.getLowBooldS());
			checkCode = service.insertMeasure(measure);
			if(checkCode==0){
				lowBoloodS = "lowBoloodS:SUCCESS";
			}else{
				lowBoloodS = "lowBoloodS:FAIL";
			}
			measure.setMeasureICode("04");
			measure.setReading(measure.getHighBooldS());
			checkCode = service.insertMeasure(measure);
			if(checkCode==0){
				highBoloodS = "highBoloodS:SUCCESS";
			}else{
				highBoloodS = "highBoloodS:FAIL";
			}
			String result = lowBoloodP+highBoloodP+lowBoloodS+highBoloodS;
			entity = new ResponseEntity<String>(result,HttpStatus.OK);
		} catch (Exception e) {			
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;		
	}
	@RequestMapping(value="measureRead",method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> measureRead(@RequestBody Customer cu){
		System.out.println(cu.getId());
		ResponseEntity<Map<String, Object>> entity = null;
		List<Measure> list;
		try {
			list = service.measureRead(cu.getId());
			Map<String, Object> map = new HashMap<>();
			System.out.println("건강정보 리스트 불러옴");
			map.put("list", list);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="menuShow/{diseaseCode}",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getDetailSideD(@PathVariable("diseaseCode") int diseaseCode, Customer customer){
		ResponseEntity<Map<String, Object>> entity = null;
		List<Customer> list;
		try {
			list = service.menuShow(diseaseCode);
			Map<String, Object> map = new HashMap<>();
			map.put("list",list);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	/**
	 * 
	 * @param page
	 * @return 문의하기 다른 페이지
	 */
	@RequestMapping(value="/counsel/{page}",method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> counselPage(@PathVariable("page")int page){
		ResponseEntity<Map<String, Object>> entity = null;
		List<Counsel> list;
		Criteria criteria = new Criteria();
		criteria.setPage(page);
		try {
			criteria.setTotalCount(serviceCO.couselListAll());
			list = serviceCO.counselList(criteria);
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
		
}
