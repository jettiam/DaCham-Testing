package com.wdb3a.dacham;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * 
 * �������� ��Ʈ�ѷ�
 *
 */
@Controller
public class CunstomerController {
@RequestMapping(value="/dachamInfo",method = RequestMethod.GET)
/**
 * 
 * @return �����Ұ��� �̵�
 */
public String dachamInfo(){
	return "customer/dachamInfo/dachamInfo";
}
@RequestMapping(value="/dietOrder",method = RequestMethod.GET)
/**
 * 
 * @return �Ĵ��ֹ����� �̵�
 */
public String dietOrder(){
	return "customer/dietOrder/dietOrder";
} 
@RequestMapping(value="/menuShow",method = RequestMethod.GET)
/**
 * 
 * @return �̴��� �޴��� �̵�
 */
public String menuShow(){
	return "customer/menu/menuShow";
}

@RequestMapping(value="/nutritionInfo",method = RequestMethod.GET)
/**
 * 
 * @return ����Ұ��� �̵�
 */
public String nutritionInfo(){
	return "customer/nutrientInfo/nutritionInfo";
}

@RequestMapping(value="/nutritionInfoDetail",method = RequestMethod.GET)
/**
 * 
 * @return ����Ұ� �󼼷� �̵�
 */
public String nutritionInfoDetail(){
	return "customer/nutrientInfo/nutritionInfoDetail";
}

@RequestMapping(value="/counsel",method = RequestMethod.GET)
/**
 * 
 * @return �����ϱ�� �̵�
 */
public String getCounsel(){
	return "customer/counsel/counsel";
}
@RequestMapping(value="/write",method = RequestMethod.GET)
/**
 * 
 * @return ���Ǳ۾���� �̵�
 */
public String writeCounsel(){
	return "customer/counsel/counselWrite";
}
@RequestMapping(value="customer/counsel/counselWrite",method = RequestMethod.POST)
/**
 * 
 * @return ���Ǳ� ���� �� �����̷�Ʈ
 */
public String postWriteCounsel(){
	return "redirect:customer/counsel/counsel";
}
@RequestMapping(value="/read",method = RequestMethod.GET)
/**
 * 
 * @return ���Ǳ� �б� 
 */
public String readCounsel(){
	return "customer/counsel/counselRead";
}
@RequestMapping(value="/main",method = RequestMethod.GET)
/**
 * 
 * @return ����ȭ��. �ΰ� Ŭ���� �̵��� ȭ��
 */
public String clientMain(){
	return "main";
}
}
