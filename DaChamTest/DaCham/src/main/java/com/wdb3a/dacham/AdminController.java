package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.orderList;
import com.wdb3a.dacham.service.AdminMainService;


/**
 * 커밋을 위한 주석 수정(5월 24일)
 * @author 김가은
 * 
 *
 */
@Controller
public class AdminController {
	@Inject
	private AdminMainService service; 
	@RequestMapping(value="/adminMain", method=RequestMethod.GET)
	public String getadminMain(Model model) throws Exception{
		List<orderList> list=service.orderListAll();
		model.addAttribute("list",list);
		
		return "mate/admin/adminMain";
	}
	
	
	/* @RequestMapping(value="/adminRead", method=RequestMethod.GET)
	   public String read(@RequestParam(value="orderCode")String orderCode, Model model) throws Exception{
	      
	      orderList board = service.read(orderCode);
	      model.addAttribute("board",board);
	      return "mate/admin/adminMain";
	   }*/

	@RequestMapping(value="/customer")
	public String getcustomer(){
		return "mate/admin/customer";
	}
	@RequestMapping(value="/customerInfo")
	public String getcustomerInfo(){
		return "mate/admin/customerInfo";
	}
	@RequestMapping(value="/dietManagement")
	public String getdietManagement(){
		return "mate/admin/dietManagement";
	}
	@RequestMapping(value="/emp")
	public String getemp(){
		return "mate/admin/emp";
	}
	@RequestMapping(value="/empInfo")
	public String getempInfo(){
		return "mate/admin/empInfo";
	}
	@RequestMapping(value="/empRegist")
	public String getempRegist(){
		return "mate/admin/empRegist";
	}
	@RequestMapping(value="/foodOrder")
	public String getfoodOrder(){
		return "mate/admin/foodOrder";
	}
	@RequestMapping(value="/foodStock")
	public String getfoodStock(Model model) throws Exception{
		List<FoodMInven> list= service.foodStockList();
		model.addAttribute(list);
		return "mate/admin/foodStock";
	}
	@RequestMapping(value="/orderList",method=RequestMethod.GET)
	public String getorderList(Model model, orderList order) throws Exception{
		List<orderList> list=service.orderListAll();
		model.addAttribute("list",list);
		
		return "mate/admin/orderList";
	}
	@RequestMapping(value="/statistics")
	public String getstatistics(){
		return "mate/admin/statistics";
	}
	@RequestMapping(value="/notice")
	public String getnotice(){
		return "mate/admin/notice";
	}
}
