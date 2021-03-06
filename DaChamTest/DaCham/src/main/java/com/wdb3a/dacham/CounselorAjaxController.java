package com.wdb3a.dacham;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Counselor;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.service.CounselorService;

@RestController
@RequestMapping("counselAjax")
public class CounselorAjaxController {
	@Inject
	private CounselorService service;
	@RequestMapping(value = "/views/{counselCode}", method = RequestMethod.GET)
	public ResponseEntity<Counselor> viewCounsel(@PathVariable("counselCode")int counselCode){
		ResponseEntity<Counselor> entity = null;
		try {
			Counselor counselor = service.viewCounsel(counselCode);
			entity = new ResponseEntity<>(counselor,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@RequestMapping(value = "/linkCounsel/{customer}",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> linkCounsel(@PathVariable("customer")String customer){
		ResponseEntity<List<Counselor>> entity = null;
		try {
			List<Counselor> list = service.linkCounsel(customer);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/linkCounsel2/{customer}",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> linkCounsel2(@PathVariable("customer")String customer){
		ResponseEntity<List<Counselor>> entity = null;
		try {
			List<Counselor> list = service.linkCounsel2(customer);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/selectCounsel/{couselCode}",method = RequestMethod.GET)
	public ResponseEntity<Counselor> selectCounsel(@PathVariable("couselCode")int couselCode){
		ResponseEntity<Counselor> entity = null;
		try {
			Counselor counselor = service.selectCounsel(couselCode);
			entity = new ResponseEntity<>(counselor,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	@RequestMapping(value = "/selectMember/{couselCode}",method = RequestMethod.GET)
	public ResponseEntity<Counselor> selectMember(@PathVariable("couselCode")int couselCode){
		ResponseEntity<Counselor> entity = null;
		try {
			Counselor counselor = service.counselMember(couselCode);
			entity = new ResponseEntity<>(counselor,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/orderList/{page}/{couselCode}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> orderList(@PathVariable("couselCode")int couselCode,@PathVariable("page")int page){
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			int totalCount = service.orderListCount(couselCode);
			criteria.setPage(page);
			criteria.setTotalCount(totalCount);
			List<Counselor> list = service.orderList(couselCode,criteria);
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
	@RequestMapping(value = "/counselUpdate/{couselCode}/{answer}",method = RequestMethod.PUT)
	public ResponseEntity<String> counselUpdate(@PathVariable("couselCode")int couselCode,@PathVariable("answer")String answer){
		ResponseEntity<String> entity = null;
		Counselor counselor = new Counselor();
		counselor.setCouselCode(couselCode);
		counselor.setAnswer(answer);
		System.out.println("답변내용:"+answer);
		try {
			service.counselUpdate(counselor);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/listAll/{searchType}/{keyword}",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> listAll(@PathVariable("searchType")String searchType,@PathVariable("keyword")String keyword){
		ResponseEntity<List<Counselor>> entity = null;
		Counselor counselor = new Counselor();
		counselor.setSearchType(searchType);
		counselor.setKeyword(keyword);
		try {
			List<Counselor> list = service.listAll(counselor);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;		
	}
	@RequestMapping(value = "/counselorseList2/{searchType}/{keyword}",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> counselorseList(@PathVariable("searchType")String searchType, @PathVariable("keyword")String keyword){
		ResponseEntity<List<Counselor>> entity = null;
		Counselor counselor = new Counselor();
		counselor.setSearchType2(searchType);
		counselor.setKeyword2(keyword);
		try {
			List<Counselor> list = service.counselorseList2(counselor);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/counselorListAll",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> counselorListAll(){
		ResponseEntity<List<Counselor>> entity = null;
		try {
			List<Counselor> list = service.counselorListAll();
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	/**
	 * 미상담 목록
	 * @return
	 */
	@RequestMapping(value = "/unfinCounselList/{page}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> unfinCounselList(@PathVariable("page")int page){
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			int totalCount = service.counselorseList2AllCount();
			criteria.setPage(page);
			criteria.setTotalCount(totalCount);
			
			List<Counselor> list = service.counselorseList2All(criteria);
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
	/**
	 * 상담완료 목록
	 * @return
	 */
	@RequestMapping(value = "/finCounselList/{page}",method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> finCounselList(@PathVariable("page")int page){
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			Criteria criteria = new Criteria();
			int totalCount = service.finCounselListCount();
			criteria.setPage(page);
			criteria.setTotalCount(totalCount);
			List<Counselor> list = service.finCounselList(criteria);
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
	@RequestMapping(value = "/counselInsert/{customer}/{answer}/{counselTitle}",method = RequestMethod.POST)
	public ResponseEntity<String> counselInsert(@PathVariable("customer")String customer,@PathVariable("answer")String answer, @PathVariable("counselTitle")String counselTitle){
		ResponseEntity<String> entity = null;
		Date d = new Date();
        
        String s = d.toString();
        System.out.println("현재날짜 : "+ s);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("현재날짜 : "+ sdf.format(d));
        
        String dateTitle = sdf.format(d);
        String counselContent = dateTitle + " 전화 상담입니다."; 


		Counselor counselor = new Counselor();
		counselor.setCounselTitle(counselTitle);
	    counselor.setCounselContent(counselContent);
		counselor.setCustomer(customer);
		counselor.setAnswer(answer);
		try {
			service.counselInsert(counselor);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/orderListSearch/{couselCode}/{keyword}",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> orderListSearch(@PathVariable("couselCode")int couselCode,@PathVariable("keyword")String keyword){
		ResponseEntity<List<Counselor>> entity = null;
		Counselor counselor = new Counselor();
		counselor.setKeyword(keyword);
		counselor.setCouselCode(couselCode);
		try {
			List<Counselor> list = service.orderListSearch(counselor);
			System.out.println("식단 검색 목록:"+list);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/optionTuning/{orderCode}",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> optionTuning(@PathVariable("orderCode")int orderCode){
		ResponseEntity<List<Counselor>> entity = null;
		try {
			List<Counselor> list = service.optionTuning(orderCode);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/listAll/{counselItemCode}",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> listAll(@PathVariable("counselItemCode")int counselItemCode){
		ResponseEntity<List<Counselor>> entity = null;
		try {
			List<Counselor> list = service.listAll(counselItemCode);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
