package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.service.WholseService;


@Controller
public class WholseController {
	@Inject
	private WholseService service;
	
	@RequestMapping(value="/foodMOrderListDetail",method=RequestMethod.GET)
	public String foodMOrderListDetail(@RequestParam("orderDate") String orderDate,Model model) throws Exception{
		List<FoodMInven> list = service.foodMOrderListDetail(orderDate);
		System.out.println(list.get(0).getFoodMName());
		model.addAttribute("list",list);
		return "mate/wholesaleDetail";
	}
	@RequestMapping(value="/foodMOrderListDetailAdd",method=RequestMethod.GET)
	public String foodMOrderListDetailAdd(@RequestParam("orderDate") String orderDate,Model model) throws Exception{
		List<FoodMInven> list = service.foodMOrderListDetailAdd(orderDate);
		
		model.addAttribute("list",list);
		return "mate/wholesaleDetail";
	}
	@RequestMapping(value="/wholesaler",method=RequestMethod.GET)
	public String wholesaler() throws Exception{
		System.out.println("µÇ¶ó");
		return "mate/wholesaler";
	}	
	
	/*public void read(@RequestParam(value="bno",defaultValue="-1")int bno,
			@ModelAttribute Criteria criteria,Model model)throws Exception{
		Board board=service.read(bno);
		model.addAttribute("board",board);
	}*/
	
}
