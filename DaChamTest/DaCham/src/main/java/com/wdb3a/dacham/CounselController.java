package com.wdb3a.dacham;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("customer")
public class CounselController {
	@RequestMapping(value="/counsel",method = RequestMethod.GET)
	public String getCounsel(){
		return "customer/counsel/counsel";
	}
	@RequestMapping(value="/write",method = RequestMethod.GET)
	public String writeCounsel(){
		return "customer/counsel/counselWrite";
	}
	@RequestMapping(value="/counsel/counselWrite",method = RequestMethod.POST)
	public String postWriteCounsel(){
		return "redirect:customer/counsel/counsel";
	}
	@RequestMapping(value="/read",method = RequestMethod.GET)
	public String readCounsel(){
		return "customer/counsel/counselRead";
	}
}
