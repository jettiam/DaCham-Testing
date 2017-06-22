package com.wdb3a.dacham;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ServiceConfigurationError;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wdb3a.dacham.bean.Counsel;

import com.wdb3a.dacham.bean.OrderList;

import com.wdb3a.dacham.bean.Customer;

import com.wdb3a.dacham.service.CounselService;
import com.wdb3a.dacham.service.CustomerService;
/**
 * 
 * 고객페이지 컨트롤러
 *
 */
@Controller
public class CustomerController {
	@Inject
	CounselService service;
	
	@Inject
	CustomerService serviceCu;
	
	@RequestMapping(value="/myPage",method = RequestMethod.GET)
	/**
	 * 
	 * @return 고객 마이페이지로 이동
	 */
	public String myInfo(String status,Model model){
		/*	status 0 = 내정보
		status 1 = 내건강정보
		status 2 = 장바구니
		status 3 = 주문내역*/
		model.addAttribute("status", status);
		return "customer/myPage";
	}

@RequestMapping(value="/dachamInfo",method = RequestMethod.GET)
/**
 * 
 * @return 다참소개로 이동
 */
public String dachamInfo(){
	return "customer/dachamInfo/dachamInfo";
}

@RequestMapping(value="/dietOrderWizard", method=RequestMethod.GET)
public String wizardOrder(){
	return "customer/dietOrder/dietOrderWizard";
}

@RequestMapping(value="/dietOrder",method = RequestMethod.GET)
/**
 * 
 * @return 식단주문으로 이동
 */
public String dietOrder(){
	return "customer/dietOrder/dietOrder";
}
/**
 * 
 * @return 식단 상세 주문으로 이동
 */
@RequestMapping(value="/detailOrder",method = RequestMethod.GET)
public String detailOrder(@RequestParam(value="dietCode") int dietCode, Model model) throws Exception{	
	List<Customer> list;
	list = serviceCu.detailOrder(dietCode);
	System.out.println("리스트 출력"+list.size());
	model.addAttribute("list",list);
	
	return "customer/dietOrder/detailOrder";
}
/**
 * 
 * @param customer
 * @param model
 * @return 상세주문에서 주문하기로 이동
 * @throws Exception
 */
@RequestMapping(value="/doOrder",method=RequestMethod.GET)
public String doOrder(Customer customer,Model model)throws Exception{
	//serviceCu.orderRegist(customer);
	System.out.println("오더에 들어감");
	model.addAttribute("order", customer);
	return "customer/dietOrder/orderRegister";
}
/**
 * 
 * @param cartInfo
 * @param model
 * @return 장바구니에서 결제로 넘어감
 * @throws Exception
 */
@RequestMapping(value="/cartOrderRegister",method=RequestMethod.POST)
public String cartOrder(String cartInfo,Model model) throws Exception{
	System.out.println(cartInfo);
	List<Customer> cartOrder = new ArrayList<Customer>() ;
	JSONParser jsonParser = new JSONParser();
	JSONObject jsonObj = (JSONObject) jsonParser.parse(cartInfo);
	
	
	JSONObject jsonObjTest = (JSONObject) jsonObj.get(0+"");	
	System.out.println(Integer.parseInt(jsonObjTest.get("price").toString()));
	
	System.out.println("커스터머 만듬");
for(int i=0; i< jsonObj.size();i++){
		JSONObject jsonObj2 = (JSONObject) jsonObj.get(i+"");
		System.out.println(i+" 반복문 돔");
		Customer customer = new Customer();
		System.out.println(i+" 커스터머 만듬");
		System.out.println(Integer.parseInt(jsonObj2.get("dietCode").toString()));
		customer.setDietCode(Integer.parseInt(jsonObj2.get("dietCode").toString()));		
		customer.setOrderCode(Integer.parseInt(jsonObj2.get("orderCode").toString()));
		customer.setPrice(Integer.parseInt(jsonObj2.get("price").toString()));
		customer.setDietAmount(Integer.parseInt(jsonObj2.get("dietAmount").toString()));
		customer.setDietImg(jsonObj2.get("dietImg").toString());
		customer.setDietName(jsonObj2.get("dietName").toString());
		System.out.println("커스터머에 넣기전");
		cartOrder.add(customer);
		System.out.println("커스터머에 넣음");
	}
	model.addAttribute("cartOrder",cartOrder);
	
	return "customer/dietOrder/orderRegister";	
}
/**
 * 
 * @param customer
 * @param model
 * @return 주문 결제
 * @throws Exception
 */
@RequestMapping(value="/payment",method=RequestMethod.POST)
public String payment(RedirectAttributes rttr,Customer customer)throws Exception{	
	serviceCu.orderRegist(customer);	
	rttr.addAttribute("status","3");
	//결제후 마이페이지로
	return "redirect:myPage";
}
@RequestMapping(value="/cartPayment",method=RequestMethod.GET)
public String cartPayment(RedirectAttributes rttr)throws Exception{	
	rttr.addAttribute("status","3");
	//결제후 마이페이지로
	return "redirect:myPage";
}
/**
 * 
 * @param customer
 * @param model
 * @return 장바구니에 넣고 장바구니로 가기
 * @throws Exception
 */
@RequestMapping(value="/goMyCart",method=RequestMethod.GET)
public String goMyCart(@RequestParam(value="sideDish") List<String> sideDish, Customer customer)throws Exception{
	serviceCu.cartRegist(customer);
	int recentCode = serviceCu.recentlyOrderCode(customer.getId());
	for(String sCode : sideDish){
	int code = Integer.parseInt(sCode);
	HashMap options = new HashMap();
	options.put("recentCode", recentCode);
	options.put("sideCode", code);
	serviceCu.orderOptionRegist(options);
	}	
	return "redirect:goCartList";
}

/** 
 * @return 장바구니 리다이렉트용
 * @throws Exception
 */
@RequestMapping(value="/goCartList",method=RequestMethod.GET)
public String inputOrderInfo(Model model)throws Exception{
	model.addAttribute("status","2");
	return "customer/myPage";
}
/**
 * 
 * @return 마이페이지 가기
 * @throws Exception
 */
@RequestMapping(value="/goOrderInfo",method=RequestMethod.GET)
public String goOrderInfo()throws Exception{
	
	return "customer/myPage";
}



@RequestMapping(value="/menuShow",method = RequestMethod.GET)
/**
 * 
 * @return 이달의 메뉴로 이동
 */
public String menuShow(){
	return "customer/menu/menuShow";
}

@RequestMapping(value="/nutritionInfo",method = RequestMethod.GET)
/**
 * 
 * @return 영양소개로 이동
 */
public String nutritionInfo(){
	return "customer/nutrientInfo/nutritionInfo";
}

@RequestMapping(value="/nutritionInfoDetail",method = RequestMethod.GET)
/**
 * 
 * @return 영양소개 상세로 이동
 */
public String nutritionInfoDetail(){
	return "customer/nutrientInfo/nutritionInfoDetail";
}

@RequestMapping(value="/nutritionInfoDetail2",method = RequestMethod.GET)
/**
 * 
 * @return 영양소개 상세로 이동
 */
public String nutritionInfoDetail2(){
	return "customer/nutrientInfo/nutritionInfoDetail2";
}
@RequestMapping(value="/counsel",method = RequestMethod.GET)
/**
 * 
 * @return 문의하기로 이동
 */
public String getCounsel(Model model) throws Exception{	
	List<Counsel> list = service.counselList();
	model.addAttribute("list",list);
	return "customer/counsel/counsel";
}
@RequestMapping(value="/write",method = RequestMethod.GET)
/**
 * 
 * @return 문의글쓰기로 이동
 */
public String writeCounsel(){
	return "customer/counsel/counselWrite";
}
@RequestMapping(value="/write",method = RequestMethod.POST)
public String writeCounsel(Counsel counsel) throws Exception{
	service.write(counsel);
	return "redirect:counsel";
}

@RequestMapping(value="/read",method = RequestMethod.GET)
/**
 * 
 * @return 문의글 읽기 
 */
public String readCounsel(@RequestParam(value="counselCode",defaultValue="-1")int code,Model model) throws Exception{
	model.addAttribute("read",service.couselRead(code));
	return "customer/counsel/counselRead";
}
@RequestMapping(value="/main",method = RequestMethod.GET)
/**
 * 
 * @return 메인화면. 로고 클릭시 이동할 화면
 */
public String clientMain(){
	return "main";
}

@RequestMapping(value="/counselDelete",method = RequestMethod.POST)
/**
 * 
 * @return 고객 게시글 삭제 후 게시글 목록으로 리다이렉트
 */
public String delete(@RequestParam(value="counselCode")int code,RedirectAttributes rttr) throws Exception{
	service.delete(code);
	rttr.addFlashAttribute("msg","SUCCESS");
	return "redirect:counsel";
	
}
@RequestMapping(value="/counselUpdate",method = RequestMethod.GET)
/**
 * 
 * @return 고객 게시글 수정
 */
	public void updateGET(int code, Model model) throws Exception{
	model.addAttribute(service.couselRead(code));
	
}

@RequestMapping(value="/counselUpdate",method = RequestMethod.POST)
/**
 * 
 * @return 고객 게시글 수정 후 게시글 목록으로 리다이렉트 
 */
	public String updatePOST(Counsel counsel,RedirectAttributes rttr) throws Exception {
	
	service.update(counsel);
	
	return "redirect:counsel";
}


}
