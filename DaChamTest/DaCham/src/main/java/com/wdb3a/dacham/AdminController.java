package com.wdb3a.dacham;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdb3a.dacham.bean.ChartList;
import com.wdb3a.dacham.bean.ChartPrice;
import com.wdb3a.dacham.bean.Customer;
import com.wdb3a.dacham.bean.FoodMAmountRead;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.OrderList;
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
	public String getadminMain(Model model, OrderList orderList) throws Exception{
		List<OrderList> list=service.orderListAll(orderList);
		model.addAttribute("list",list);
		model.addAttribute("orderList",orderList);
		return "mate/admin/adminMain";
	}
	//도넛차트 컨트롤러
	@RequestMapping(value="/adminMain1", method=RequestMethod.GET)
	@ResponseBody
	public List<ChartList> getadminMain1(Model model) throws Exception{
		List<ChartList> chartList = service.chartList(); 
		model.addAttribute("chartList", chartList);
		return chartList;
	}
	//막대그래프 컨트롤러{디폴트}
	@RequestMapping(value="/adminMain2", method=RequestMethod.GET)
	@ResponseBody
	public List<ChartPrice> getadminMain2(Model model) throws Exception{
		List<ChartPrice> chartPrice = service.chartPrice(); 
		model.addAttribute("chartPrice", chartPrice);
		return chartPrice;
	}
	//막대그래프 버튼클릭시
	@RequestMapping(value="/adminMain3", method=RequestMethod.POST)
	@ResponseBody
	public List<ChartPrice> getadminMain3(Model model, @RequestBody ChartPrice dates) throws Exception{
		System.out.println(dates.getStartdate());
		List<ChartPrice> chartPrice = service.chartPrice1(dates);
		model.addAttribute("chartPrice", chartPrice);
		return chartPrice;
	}
	//디테일뷰
	@RequestMapping(value="/adminMain4", method=RequestMethod.POST)
	@ResponseBody
	public List<OrderList> getadminMain4(@RequestParam(value="orderCode") String orderCode) throws Exception{
		System.out.println(orderCode);
		List<OrderList> orderList = service.datailview(orderCode);
		return orderList;
	}
	
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
	@RequestMapping(value="/foodOrder", method=RequestMethod.GET)
	public String getfoodOrder(Model model, FoodMInven foodMInven) throws Exception{
		List<FoodMInven> invenlist = service.foodStockList(foodMInven);
		model.addAttribute("invenlist", invenlist);
		return "mate/admin/foodOrder";
	}
	@RequestMapping(value="/foodStock", method=RequestMethod.GET)
	public String getfoodStock(Model model, FoodMInven foodMInven) throws Exception{
		List<FoodMInven> list= service.foodStockList(foodMInven);
		model.addAttribute("list", list); 
		model.addAttribute("foodMInven", foodMInven);
		return "mate/admin/foodStock";
	}
	//체크박스 된 식단에 대한 orderCode에 맞는 식재료 넘기기
	@RequestMapping(value="/foodOrder", method=RequestMethod.POST)
	public String getfoodStock1(Model model, String orderCode) throws Exception{
		//System.out.println(orderCode);
		Map<Integer, Object> map = new HashMap<Integer, Object>();
		//List<FoodMAmountRead> list = new ArrayList<FoodMAmountRead>();
		JSONParser jsonParser = new JSONParser(); 
		JSONObject jsonObj = (JSONObject) jsonParser.parse(orderCode);
		//JSONObject jsonObjTest = (JSONObject) jsonObj.get(0+"");	
		//System.out.println(Integer.parseInt(jsonObjTest.get("orderCode").toString()));
		for(int i=0; i<jsonObj.size(); i++){
			
			JSONObject jsonObj1 = (JSONObject) jsonObj.get(i+"");
			System.out.println("이건돌아가냐?1");
			List<FoodMAmountRead> foodMAmountRead1 = new ArrayList<FoodMAmountRead>();
			System.out.println("이건돌아가냐?2");
			//foodMAmountRead1.setOrderCode(Integer.parseInt(jsonObj1.get("orderCode").toString()));
			System.out.println(Integer.parseInt(jsonObj1.get("orderCode").toString()));
			int a = Integer.parseInt(jsonObj1.get("orderCode").toString());
			foodMAmountRead1 = service.foodMAmountRead(a);
			
			map.put(i ,foodMAmountRead1);   
		 
		}
		 
		model.addAttribute("map", map);
		
		
		return "mate/admin/foodOrder";
	}
	
	@RequestMapping(value="/orderList",method=RequestMethod.GET)
	public String getorderList(Model model, OrderList order) throws Exception{
		List<OrderList> list=service.orderListAll(order);
		model.addAttribute("list",list);
		model.addAttribute("order", order);
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
