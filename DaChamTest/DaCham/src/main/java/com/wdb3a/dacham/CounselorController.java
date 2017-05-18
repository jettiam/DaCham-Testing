package com.wdb3a.dacham;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("mate/counselor")
public class CounselorController {
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String getMain(){
		return "mate/counselor/counselorMain";
	}
	
	@RequestMapping(value="/list", method =RequestMethod.GET)
	public String getList(){
		return "mate/counselor/counselorList";
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String getDetail(){
		return "mate/counselor/counselorDetail";
	}
}
