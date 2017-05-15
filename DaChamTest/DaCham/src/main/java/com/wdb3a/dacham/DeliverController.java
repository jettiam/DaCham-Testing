package com.wdb3a.dacham;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("mate/deliver")
public class DeliverController {
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String getMain(){
		return "mate/deliver/deliverMain";
	}

}
