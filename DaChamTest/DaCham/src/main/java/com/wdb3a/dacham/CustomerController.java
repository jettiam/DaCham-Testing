package com.wdb3a.dacham;

import java.util.List;
import java.util.ServiceConfigurationError;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String myInfo(){
		
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
	System.out.println("리스트 출력"+list);
	model.addAttribute("list",list);
	
	return "customer/dietOrder/detailOrder";
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
