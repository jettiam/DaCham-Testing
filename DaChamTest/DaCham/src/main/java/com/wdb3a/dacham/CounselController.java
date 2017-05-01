package com.wdb3a.dacham;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CounselController {
	@RequestMapping(value="counsel",method = RequestMethod.GET)
	public String getCounsel(){
		return "counsel";
	}
	@RequestMapping(value="writeCounsel",method = RequestMethod.GET)
	public String writeCounsel(){
		return "writeCounsel";
	}
	@RequestMapping(value="writeCounsel",method = RequestMethod.POST)
	public String postWriteCounsel(){
		return "redirect:counsel";
	}
	@RequestMapping(value="read",method = RequestMethod.GET)
	public String readCounsel(){
		return "readCounsel";
	}
}
