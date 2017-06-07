package com.wdb3a.dacham;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class CookerController {
	@RequestMapping(value="/cookMain", method=RequestMethod.GET)
	public String getMain(){
		return "mate/cooker/cookerMain";
	}

	@RequestMapping(value="/cookList", method=RequestMethod.GET)
	public String getList(){
		return "/mate/cooker/cookingList";
	}
	@RequestMapping(value="/cookFood", method=RequestMethod.GET)
	public String getFood(){
		return "/mate/cooker/foodStock";
	}
}
