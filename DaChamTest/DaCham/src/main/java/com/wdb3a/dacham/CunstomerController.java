package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdb3a.dacham.bean.Counsel;
import com.wdb3a.dacham.service.CounselService;
/**
 * 
 * 고객페이지 컨트롤러
 *
 */
@Controller
public class CunstomerController {
	@Inject
	CounselService service;
@RequestMapping(value="/dachamInfo",method = RequestMethod.GET)
/**
 * 
 * @return 다참소개로 이동
 */
public String dachamInfo(){
	return "customer/dachamInfo/dachamInfo";
}
@RequestMapping(value="/dietOrder",method = RequestMethod.GET)
/**
 * 
 * @return 식단주문으로 이동
 */
public String dietOrder(){
	return "customer/dietOrder/dietOrder";
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
@RequestMapping(value="customer/counsel/counselWrite",method = RequestMethod.POST)
/**
 * 
 * @return 문의글 쓰기 후 리다이렉트
 */
public String postWriteCounsel(){
	return "redirect:customer/counsel/counsel";
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
}
