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

import com.wdb3a.dacham.bean.ChartList;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Diet;
import com.wdb3a.dacham.bean.FoodMAmountRead;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.FoodMaterial;
import com.wdb3a.dacham.bean.Member;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.service.AdminMainService;

@RestController
@RequestMapping(value = "adminSub")
public class AdminSubController {
	@Inject
	private AdminMainService service;

	// ȯ��
	@RequestMapping(value = "/orderList1", method = RequestMethod.PUT)
	public ResponseEntity<String> transportNum(@RequestBody OrderList order) {
		ResponseEntity<String> entity = null;
		System.out.println(order.getOrderCode());
		try {
			service.refundUpdate(order);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// �۾���û
	@RequestMapping(value = "/orderList2", method = RequestMethod.PUT)
	public ResponseEntity<String> transportNum1(@RequestBody OrderList order) {
		ResponseEntity<String> entity = null;
		try {
			service.workUpdate(order);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ����ȭ�� ��ü ����Ʈ ���
	@RequestMapping(value = "/all/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> all(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {

			Criteria criteria = new Criteria();
			criteria.setPage(page);
			int totalCount = service.orderListCount();
			criteria.setTotalCount(totalCount);
			List<OrderList> list = service.all(criteria);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// orderList ����Ʈ ���
	@RequestMapping(value = "/orderAll/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> orderAll(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			System.out.println(page);
			criteria.setPage(page);
			int totalCount = service.orderCount();
			System.out.println(totalCount);
			criteria.setTotalCount(totalCount); 
			List<OrderList> list = service.orderAll(criteria);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria);  
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ���� �˻�
	@RequestMapping(value = "/{searchType}/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<OrderList>> listAll(@PathVariable("searchType") String searchType,
			@PathVariable("keyword") String keyword) {
		ResponseEntity<List<OrderList>> entity = null;

		try {
			OrderList orderList = new OrderList();
			orderList.setSearchType(searchType);
			orderList.setKeyword(keyword);
			List<OrderList> list = service.orderListAll(orderList);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// orderList �˻�
	@RequestMapping(value = "orderList/{searchType}/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<OrderList>> orderListSearch(@PathVariable("searchType") String searchType,
			@PathVariable("keyword") String keyword) {
		ResponseEntity<List<OrderList>> entity = null;

		try {
			OrderList orderList = new OrderList();
			orderList.setSearchType(searchType);
			orderList.setKeyword(keyword);
			List<OrderList> list = service.orderAllSearch(orderList);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "orderList/orderItemNameCount", method = RequestMethod.GET)
	public ResponseEntity<List<OrderList>> orderItemNameCount() {
		ResponseEntity<List<OrderList>> entity = null;

		try {
			List<OrderList> list = service.orderItemNameCount(); 
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// orderSort1 ����Ʈ ���
	@RequestMapping(value = "/orderSort1/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> orderSort1(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			System.out.println(page);
			criteria.setPage(page);
			int totalCount = service.orderCount();
			criteria.setTotalCount(totalCount); 
			List<OrderList> list = service.orderSort1(criteria);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria);  
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// orderSort2 ����Ʈ ���
	@RequestMapping(value = "/orderSort2/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> orderSort2(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			System.out.println(page);
			criteria.setPage(page);
			int totalCount = service.orderCount();
			criteria.setTotalCount(totalCount); 
			List<OrderList> list = service.orderSort2(criteria);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria); 
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// orderSort3 ����Ʈ ���
	@RequestMapping(value = "/orderSort3/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> orderSort3(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			System.out.println(page);
			criteria.setPage(page);
			int totalCount = service.orderCount();
			criteria.setTotalCount(totalCount); 
			List<OrderList> list = service.orderSort3(criteria);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria); 
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// orderSort4 ����Ʈ ���
	@RequestMapping(value = "/orderSort4/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> orderSort4(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			System.out.println(page);
			criteria.setPage(page);
			int totalCount = service.orderCount();
			criteria.setTotalCount(totalCount); 
			List<OrderList> list = service.orderSort4(criteria);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria); 
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/orderSort5/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> orderSort5(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			System.out.println(page); 
			criteria.setPage(page);
			int totalCount = service.orderCount();
			criteria.setTotalCount(totalCount); 
			List<OrderList> list = service.orderSort5(criteria);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria); 
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// foodStock ����Ʈ ���
	@RequestMapping(value = "/foodStockAll/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> foodStockAll(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			
			Criteria criteria = new Criteria();
			int totalCount = service.foodStockListCount();
			criteria.setPage(page);
			criteria.setTotalCount(totalCount); 
			List<FoodMInven> list = service.foodStockListAll(criteria);
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria);   
			entity = new ResponseEntity<>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} 
		return entity;
	}

	// foodStock ����Ʈ �˻� ���
	@RequestMapping(value = "/foodOrder/{searchType}/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<FoodMInven>> foodStockSearch(@PathVariable("searchType") String searchType,
			@PathVariable("keyword") String keyword) {
		ResponseEntity<List<FoodMInven>> entity = null;
		System.out.println("asdasd");
		try {
			FoodMInven foodMInven = new FoodMInven();
			foodMInven.setSearchType(searchType);
			foodMInven.setKeyword(keyword);
			List<FoodMInven> list = service.foodStockList(foodMInven);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// foodStock ����� ����Ʈ ���
	@RequestMapping(value = "/foodStockStopAll/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> foodStockStopAll(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			int totalCount = service.foodStockListStopCount();
			criteria.setPage(page);
			criteria.setTotalCount(totalCount); 
			List<FoodMInven> list = service.foodStockListStop(criteria);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria);    
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// �Ĵ� �� ������
	@RequestMapping(value = "/dietAll/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> dietAll(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			int totalCount = service.dietAllCount();
			criteria.setPage(page);
			criteria.setTotalCount(totalCount); 
			List<Diet> list = service.dietAll(criteria);
			Map<String, Object> map = new HashMap<>();  
			map.put("list", list);
			map.put("criteria", criteria); 
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ���� ������Ʈ
	@RequestMapping(value = "/priceUp", method = RequestMethod.PUT)
	public ResponseEntity<String> priceUp(@RequestBody Diet diet) {
		ResponseEntity<String> entity = null;
		System.out.println(diet.getPrice());
		try {
			service.dietPriceUp(diet);
			System.out.println("��");
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/disease1", method = RequestMethod.GET)
	public ResponseEntity<List<Diet>> disease1() {
		ResponseEntity<List<Diet>> entity = null;
		try {
			List<Diet> list = service.disease1();
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/disease2", method = RequestMethod.GET)
	public ResponseEntity<List<Diet>> disease2() {
		ResponseEntity<List<Diet>> entity = null;
		try {
			List<Diet> list = service.disease2();
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/disease3", method = RequestMethod.GET)
	public ResponseEntity<List<Diet>> disease3() {
		ResponseEntity<List<Diet>> entity = null;
		try {
			List<Diet> list = service.disease3();
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/disease4", method = RequestMethod.GET)
	public ResponseEntity<List<Diet>> disease4() {
		ResponseEntity<List<Diet>> entity = null;
		try {
			List<Diet> list = service.disease4();
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/memberAll", method = RequestMethod.GET)
	public ResponseEntity<List<Member>> memberAll() {
		ResponseEntity<List<Member>> entity = null;
		try {
			List<Member> list = service.memberAll();
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/memberNomal", method = RequestMethod.GET)
	public ResponseEntity<List<Member>> memberNomal() {
		ResponseEntity<List<Member>> entity = null;
		try {
			List<Member> list = service.memberNomal();
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/userMemberInfo/{id}", method = RequestMethod.GET)
	public ResponseEntity<Member> memberAll(@PathVariable("id") String id) {
		System.out.println(id);
		ResponseEntity<Member> entity = null;
		try {
			Member member = service.memberUserInfo(id);
			entity = new ResponseEntity<>(member, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ȸ������
	@RequestMapping(value = "/empUpdate", method = RequestMethod.PUT)
	public ResponseEntity<String> empUpdate(@RequestBody Member member) {
		ResponseEntity<String> entity = null;
		try {
			service.empUpdate(member);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/empUpdate/{id}", method = RequestMethod.PUT)
	public ResponseEntity<String> empOut(@PathVariable("id") String id) {
		ResponseEntity<String> entity = null;
		try {
			service.joinOut(id);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ����� �ֹ�
	@RequestMapping(value = "/foodMaterial/{searchType}/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<FoodMaterial>> foodMaterialSearch(@PathVariable("searchType") String searchType,
			@PathVariable("keyword") String keyword) {
		ResponseEntity<List<FoodMaterial>> entity = null;
		System.out.println("asdasd");
		try {
			FoodMaterial foodMaterial = new FoodMaterial();
			foodMaterial.setSearchType(searchType);
			foodMaterial.setKeyword(keyword);
			List<FoodMaterial> list = service.foodMaterialSearch(foodMaterial);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ȸ�� �˻�
	@RequestMapping(value = "/customer/{searchType}/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<Member>> customerSearch(@PathVariable("searchType") String searchType,
			@PathVariable("keyword") String keyword) {
		ResponseEntity<List<Member>> entity = null;
		System.out.println("asdasd");
		try {
			Member member = new Member();
			member.setSearchType(searchType);
			member.setKeyword(keyword);
			List<Member> list = service.memberSearch(member);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
