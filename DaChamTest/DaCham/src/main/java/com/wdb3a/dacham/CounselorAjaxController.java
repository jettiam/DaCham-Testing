package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Counselor;
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
	@RequestMapping(value = "/linkCounsel",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> linkCounsel(){
		ResponseEntity<List<Counselor>> entity = null;
		try {
			List<Counselor> list = service.linkCounsel();
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
	@RequestMapping(value = "/orderList/{couselCode}",method = RequestMethod.GET)
	public ResponseEntity<List<Counselor>> orderList(@PathVariable("couselCode")int couselCode){
		ResponseEntity<List<Counselor>> entity = null;
		try {
			List<Counselor> list = service.orderList(couselCode);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
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
		System.out.println("Á¤´ä:"+answer);
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
}
