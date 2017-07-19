package com.wdb3a.dacham;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.service.NutritionistService;
import com.wdb3a.dacham.util.MediaUtils;


@RestController
@RequestMapping(value = "nutriAjax")
public class NutritionistAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(NutritionController.class);

	@Resource(name="uploadPath")
	private String uploadPath;
	@Inject
	private NutritionistService service;
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getAll(Nutritionist nutritionist){
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			List<Nutritionist> list = service.listSearch(nutritionist);
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
	@RequestMapping(value = "/searching/{search}",method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> getSearch(@PathVariable("search")String search,Nutritionist nutritionist){
		ResponseEntity<List<Nutritionist>> entity = null;
		try {
			nutritionist.setSearch(search);
			List<Nutritionist> list = service.materialSearch(nutritionist);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/materialAll/{page}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> materialView(@PathVariable("page")int page){
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			
			Criteria criteria = new Criteria();
			int totalCount = service.materialTotal();
			criteria.setPage(page);
			criteria.setTotalCount(totalCount);
			List<Nutritionist> list = service.materialAll(criteria);
			Map<String,Object> map = new HashMap<>();
			map.put("criteria", criteria);
			map.put("list", list);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody Nutritionist nutritionist){
		ResponseEntity<String> entity = null;
		try {
			service.create(nutritionist);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			System.out.println("식재료 이동");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/{v}", method = RequestMethod.GET)
	public ResponseEntity<Integer> cntChange(@PathVariable("v")int v){
		ResponseEntity<Integer> entity = null;
		int cnt2 = v;
		entity = new ResponseEntity<>(cnt2,HttpStatus.OK);
		return entity;
	}
	@RequestMapping(value = "/show/{foodMCode}",method = RequestMethod.GET)
	public ResponseEntity<Nutritionist> openAPI(@PathVariable("foodMCode")String foodMCode){
		ResponseEntity<Nutritionist> entity = null;
		try {
			Nutritionist nutritionist = service.openAPI(foodMCode);
			entity = new ResponseEntity<>(nutritionist,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/showKcal/{sideDCode}",method = RequestMethod.GET)
	public ResponseEntity<Nutritionist> showKcal(@PathVariable("sideDCode")String sideDCode){
		ResponseEntity<Nutritionist> entity = null;
		try {
			Nutritionist nutritionist = service.showKcal(sideDCode);
			entity = new ResponseEntity<>(nutritionist,HttpStatus.OK);
			System.out.println(entity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/template/{diseaseCode}",method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> optionTemplate(@PathVariable("diseaseCode")int diseaseCode, Nutritionist nutritionist){
		System.out.println("1분");
		ResponseEntity<List<Nutritionist>> entity = null;
		
		try {
			List<Nutritionist> list = service.optionTemplate(nutritionist);
			System.out.println(list);
			
			entity = new ResponseEntity<>(list, HttpStatus.OK);
			System.out.println(entity);
			System.out.println("ok"+nutritionist.getDiseaseCode());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	//반찬 템플릿의 개수를 구합니다.
	@RequestMapping(value = "/templateCount/{diseaseCode}",method = RequestMethod.GET)
	public ResponseEntity<Integer> optionTemplateCount(@PathVariable("diseaseCode")int diseaseCode, Nutritionist nutritionist){
		ResponseEntity<Integer> entity = null;
		try {
			int count = service.optionTemplateCount(nutritionist);
			entity = new ResponseEntity<>(count,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//반찬 목록을 검색합니다.
	@RequestMapping(value = "/listSearch/{search}",method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> listSearch(@PathVariable("search")String search, Nutritionist nutritionist){
		ResponseEntity<List<Nutritionist>> entity = null;
		try {
			nutritionist.setSearch(search);
			List<Nutritionist> list = service.listSearch(nutritionist);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//반찬 목록을 조회합니다.
	@RequestMapping(value = "/sideAll/{page}/{foodGCode}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> sideAll(@PathVariable("page")int page,@PathVariable("foodGCode")String foodGCode){
		 ResponseEntity<Map<String,Object>> entity = null;
		 try {
			Criteria criteria = new Criteria();
			criteria.setPage(page);
			criteria.setRecordsPerPage(7);
			int totalCount = service.sideAllCount(foodGCode);
			criteria.setTotalCount(totalCount);
			List<Nutritionist> list = service.sideAll(foodGCode,criteria);
			Map<String,Object> map = new HashMap<>();
			map.put("list", list);
			map.put("criteria", criteria);
		
			entity = new ResponseEntity<>(map,HttpStatus.OK);
			
			System.out.println("리스트 출력"+list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//해당 질병에 관련한 식단 조회
	@RequestMapping(value = "/diseaseDietOverview/{page}/{diseaseName}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> diseaseDietOverview(@PathVariable("page")int page,@PathVariable("diseaseName")String diseaseName){
		ResponseEntity<Map<String,Object>> entity = null;
		
		try {
			Criteria criteria = new Criteria();
			criteria.setPage(page);
			int totalCount = service.diseaseDietCount(diseaseName);
			criteria.setTotalCount(totalCount);
			
			List<Nutritionist> list = service.diseaseDietOverview(diseaseName,criteria);
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
	//해당 반찬에 대한 카테고리 검색
	@RequestMapping(value = "/categorySearch/{foodGName}/{cookMName}",method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> categorySearch(@PathVariable("foodGName")String foodGName, @PathVariable("cookMName")String cookMName){
		ResponseEntity<List<Nutritionist>> entity = null;
		Nutritionist nutritionist = new Nutritionist();
		try {
			nutritionist.setFoodGName(foodGName);
			nutritionist.setCookMName(cookMName);
			List<Nutritionist> list = service.categorySearch(nutritionist);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//해당 메인페이지에 주문목록 표시
	@RequestMapping(value = "/orderList/{page}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> orderList(@PathVariable("page")int page){
		System.out.println("넘어옴"+page);
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			criteria.setPage(page);
			int totalCount = service.orderList();
			criteria.setTotalCount(totalCount);
			List<OrderList> list = service.orderList(criteria);
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
	//해당 월에 대한 메뉴 표시
	@RequestMapping(value=  "/thisMonth/{page}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> thisMonth(@PathVariable("page")int page){
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			criteria.setPage(page);
			int totalCount = service.thisMonthCount();
			criteria.setRecordsPerPage(5);
			criteria.setTotalCount(totalCount);
			List<OrderList> list = service.thisMonth(criteria);
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
	//해당 반찬에 대한 영양정보 표시
	@RequestMapping(value = "/allNutri/{sideDCode}",method = RequestMethod.GET)
	public ResponseEntity<Nutritionist> allNutri(@PathVariable("sideDCode")String sideDCode){
		ResponseEntity<Nutritionist> entity = null;
		try {
			Nutritionist nutritionist = service.allNutri(sideDCode);
			entity = new ResponseEntity<>(nutritionist,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//해당 특별고객에 대한 특별식단 표시
	@RequestMapping(value = "/specialToggle/{customer}/{dietCode}",method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> specialToggle(@PathVariable("customer")String customer,@PathVariable("dietCode")int dietCode){
		System.out.println("스페셜 토글 컨트롤러입니다.");
		ResponseEntity<List<Nutritionist>> entity = null;
		Nutritionist nutritionist = new Nutritionist();
		try {
			nutritionist.setCustomer(customer);
			nutritionist.setDietCode(dietCode);
			System.out.println("고객아이디:"+customer);
			List<Nutritionist> list = service.specialToggle(nutritionist);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
			System.out.println("the list"+list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//해당 특별식단에 대한 코드를 가져와 증북 방지
	@RequestMapping(value = "/specialCode/{customer}",method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> specialCode(@PathVariable("customer")String customer){
		ResponseEntity<List<Nutritionist>> entity = null;	
		try {			
			List<Nutritionist> list = service.specialCode(customer);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//해당 특별식단을 추가 등록하길 원할 때 페이지를 갱신함
	@RequestMapping(value = "/reRegist/{customer}",method = RequestMethod.PUT)
	public ResponseEntity<String> reRegist(@PathVariable("customer")String customer){
		ResponseEntity<String> entity = null;
		try {
			service.reRegist(customer);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//원래대로 되돌림
	@RequestMapping(value = "/rollback/{customer}",method = RequestMethod.PUT)
	public ResponseEntity<String> rollback(@PathVariable("customer")String customer){
		ResponseEntity<String> entity = null;
		try {
			service.specialComplete(customer);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//반찬 삭제
	@RequestMapping(value = "/delete/{sideDCode}",method = RequestMethod.DELETE)
	public ResponseEntity<String> deleter(@PathVariable("sideDCode")String sideDCode){
		ResponseEntity<String> entity = null;
		try {
			service.remove0(sideDCode);
			service.remove1(sideDCode);
			service.remove2(sideDCode);
			service.remove3(sideDCode);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//식단 삭제
	@RequestMapping(value = "/remove/{dietCode}",method = RequestMethod.DELETE)
	public ResponseEntity<String> remover(@PathVariable("dietCode")int dietCode){
		ResponseEntity<String> entity = null;
		try {
			service.delete0(dietCode);
			service.delete1(dietCode);
			service.delete2(dietCode);
			service.delete3(dietCode);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
