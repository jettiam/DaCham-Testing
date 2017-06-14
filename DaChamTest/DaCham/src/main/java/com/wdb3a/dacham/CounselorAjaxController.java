package com.wdb3a.dacham;

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
}
