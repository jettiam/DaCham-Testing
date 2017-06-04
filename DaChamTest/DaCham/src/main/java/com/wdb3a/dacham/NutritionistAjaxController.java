package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.service.NutritionistService;

@RestController
@RequestMapping(value = "nutriAjax")
public class NutritionistAjaxController {
	@Inject
	private NutritionistService service;
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public ResponseEntity<List<Nutritionist>> getAll(){
		ResponseEntity<List<Nutritionist>> entity = null;
		return null;
	}
}
