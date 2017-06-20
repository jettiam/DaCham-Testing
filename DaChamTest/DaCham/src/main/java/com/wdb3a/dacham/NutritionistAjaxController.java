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
	@RequestMapping(value = "/materialAll",method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> materialView(){
		ResponseEntity<List<Nutritionist>> entity = null;
		try {
			List<Nutritionist> list = service.materialAll();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
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
			System.out.println("����� �̵�");
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
	@RequestMapping(value = "/show/{foodMName}",method = RequestMethod.GET)
	public ResponseEntity<Nutritionist> openAPI(@PathVariable("foodMName")String foodMName){
		ResponseEntity<Nutritionist> entity = null;
		try {
			Nutritionist nutritionist = service.openAPI(foodMName);
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
		System.out.println("1��");
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
	//���� ���ø��� ������ ���մϴ�.
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
	//���� ����� �˻��մϴ�.
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
	
	//���� ����� ��ȸ�մϴ�.
	@RequestMapping(value = "/sideAll",method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> sideAll(){
		 ResponseEntity<List<Nutritionist>> entity = null;
		 try {
			List<Nutritionist> list = service.sideAll();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//�ش� ������ ������ �Ĵ� ��ȸ
	@RequestMapping(value = "/diseaseDietOverview/{diseaseName}",method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> diseaseDietOverview(@PathVariable("diseaseName")String diseaseName){
		ResponseEntity<List<Nutritionist>> entity = null;
		Nutritionist nutritionist = new Nutritionist();
		try {
			nutritionist.setDiseaseName(diseaseName);
			List<Nutritionist> list = service.diseaseDietOverview(nutritionist);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//�ش� ������ ���� ī�װ� �˻�
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
	//�ش� ������������ �ֹ���� ǥ��
	@RequestMapping(value = "/orderList",method = RequestMethod.GET)
	public ResponseEntity<List<OrderList>> orderList(){
		ResponseEntity<List<OrderList>> entity = null;
		try {
			List<OrderList> list = service.orderList();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//�ش� ���� ���� �޴� ǥ��
	@RequestMapping(value=  "/thisMonth",method = RequestMethod.GET)
	public ResponseEntity<List<OrderList>> thisMonth(){
		ResponseEntity<List<OrderList>> entity = null;
		try {
			List<OrderList> list = service.thisMonth();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//�ش� ������ ���� �������� ǥ��
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
}
