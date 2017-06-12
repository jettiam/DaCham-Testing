package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wdb3a.dacham.bean.Counselor;
import com.wdb3a.dacham.service.CounselorService;

@Controller

public class CounselorController {
	@Inject
	private CounselorService service;
	private static final Logger logger = LoggerFactory.getLogger(CounselorController.class); 
	@RequestMapping(value="/counselorMain", method=RequestMethod.GET)
	public String getMain(){
		return "mate/counselor/counselorMain";
	}
	
	@RequestMapping(value="/counselorList", method =RequestMethod.GET)
	public String getList(Model model,Counselor counselor)throws Exception{
		List<Counselor> list = service.listAll(counselor);
		model.addAttribute("list",list);
		model.addAttribute("Counselor",counselor);
		return "mate/counselor/counselorList";
	
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String getDetail(){
		return "mate/counselor/counselorDetail";
	}
}
