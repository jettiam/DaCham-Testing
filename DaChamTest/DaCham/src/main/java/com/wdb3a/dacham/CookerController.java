package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.service.CookService;

@Controller

public class CookerController {
	@Inject
	private CookService service;
	private static final Logger logger= LoggerFactory.getLogger(CookerController.class);
	
	@RequestMapping(value="/cookMain", method=RequestMethod.GET)
	public String getMain(){
		return "mate/cooker/cookerMain";
	}

	@RequestMapping(value="/cookList", method=RequestMethod.GET)
	public String getList(Model model) throws Exception{
		List<Cook> list = service.cookList();
		List<Cook> list2 = service.finishcook();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "/mate/cooker/cookingList";
	}
	@RequestMapping(value="/cookFood", method=RequestMethod.GET)
	public String getFood(Model model, FoodMInven foodInv) throws Exception{
		List<FoodMInven> list = service.CookStock(foodInv);
		model.addAttribute("list",list);
		model.addAttribute("foodInv",foodInv);
		return "/mate/cooker/foodStock";
	}
	@RequestMapping(value="/cook", method=RequestMethod.GET)
	public String getcook(Model model)throws Exception{
		List<Cook> list = service.readycook();
		
		model.addAttribute("list",list);
	
		return "/mate/cooker/cook";
	}
}
