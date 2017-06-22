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
 * �������� ��Ʈ�ѷ�
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
	 * @return �� ������������ �̵�
	 */
	public String myInfo(String status,Model model){
		/*	status 0 = ������
		status 1 = ���ǰ�����
		status 2 = ��ٱ���
		status 3 = �ֹ�����*/
		model.addAttribute("status", status);
		return "customer/myPage";
	}

@RequestMapping(value="/dachamInfo",method = RequestMethod.GET)
/**
 * 
 * @return �����Ұ��� �̵�
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
 * @return �Ĵ��ֹ����� �̵�
 */
public String dietOrder(){
	return "customer/dietOrder/dietOrder";
}
/**
 * 
 * @return �Ĵ� �� �ֹ����� �̵�
 */
@RequestMapping(value="/detailOrder",method = RequestMethod.GET)
public String detailOrder(@RequestParam(value="dietCode") int dietCode, Model model) throws Exception{	
	List<Customer> list;
	list = serviceCu.detailOrder(dietCode);
	System.out.println("����Ʈ ���"+list.size());
	model.addAttribute("list",list);
	
	return "customer/dietOrder/detailOrder";
}
/**
 * 
 * @param customer
 * @param model
 * @return ���ֹ����� �ֹ��ϱ�� �̵�
 * @throws Exception
 */
@RequestMapping(value="/doOrder",method=RequestMethod.GET)
public String doOrder(Customer customer,Model model)throws Exception{
	//serviceCu.orderRegist(customer);
	System.out.println("������ ��");
	model.addAttribute("order", customer);
	return "customer/dietOrder/orderRegister";
}
/**
 * 
 * @param cartInfo
 * @param model
 * @return ��ٱ��Ͽ��� ������ �Ѿ
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
	
	System.out.println("Ŀ���͸� ����");
for(int i=0; i< jsonObj.size();i++){
		JSONObject jsonObj2 = (JSONObject) jsonObj.get(i+"");
		System.out.println(i+" �ݺ��� ��");
		Customer customer = new Customer();
		System.out.println(i+" Ŀ���͸� ����");
		System.out.println(Integer.parseInt(jsonObj2.get("dietCode").toString()));
		customer.setDietCode(Integer.parseInt(jsonObj2.get("dietCode").toString()));		
		customer.setOrderCode(Integer.parseInt(jsonObj2.get("orderCode").toString()));
		customer.setPrice(Integer.parseInt(jsonObj2.get("price").toString()));
		customer.setDietAmount(Integer.parseInt(jsonObj2.get("dietAmount").toString()));
		customer.setDietImg(jsonObj2.get("dietImg").toString());
		customer.setDietName(jsonObj2.get("dietName").toString());
		System.out.println("Ŀ���͸ӿ� �ֱ���");
		cartOrder.add(customer);
		System.out.println("Ŀ���͸ӿ� ����");
	}
	model.addAttribute("cartOrder",cartOrder);
	
	return "customer/dietOrder/orderRegister";	
}
/**
 * 
 * @param customer
 * @param model
 * @return �ֹ� ����
 * @throws Exception
 */
@RequestMapping(value="/payment",method=RequestMethod.POST)
public String payment(RedirectAttributes rttr,Customer customer)throws Exception{	
	serviceCu.orderRegist(customer);	
	rttr.addAttribute("status","3");
	//������ ������������
	return "redirect:myPage";
}
@RequestMapping(value="/cartPayment",method=RequestMethod.GET)
public String cartPayment(RedirectAttributes rttr)throws Exception{	
	rttr.addAttribute("status","3");
	//������ ������������
	return "redirect:myPage";
}
/**
 * 
 * @param customer
 * @param model
 * @return ��ٱ��Ͽ� �ְ� ��ٱ��Ϸ� ����
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
 * @return ��ٱ��� �����̷�Ʈ��
 * @throws Exception
 */
@RequestMapping(value="/goCartList",method=RequestMethod.GET)
public String inputOrderInfo(Model model)throws Exception{
	model.addAttribute("status","2");
	return "customer/myPage";
}
/**
 * 
 * @return ���������� ����
 * @throws Exception
 */
@RequestMapping(value="/goOrderInfo",method=RequestMethod.GET)
public String goOrderInfo()throws Exception{
	
	return "customer/myPage";
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

@RequestMapping(value="/nutritionInfoDetail2",method = RequestMethod.GET)
/**
 * 
 * @return ����Ұ� �󼼷� �̵�
 */
public String nutritionInfoDetail2(){
	return "customer/nutrientInfo/nutritionInfoDetail2";
}
@RequestMapping(value="/counsel",method = RequestMethod.GET)
/**
 * 
 * @return �����ϱ�� �̵�
 */
public String getCounsel(Model model) throws Exception{	
	List<Counsel> list = service.counselList();
	model.addAttribute("list",list);
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
@RequestMapping(value="/write",method = RequestMethod.POST)
public String writeCounsel(Counsel counsel) throws Exception{
	service.write(counsel);
	return "redirect:counsel";
}

@RequestMapping(value="/read",method = RequestMethod.GET)
/**
 * 
 * @return ���Ǳ� �б� 
 */
public String readCounsel(@RequestParam(value="counselCode",defaultValue="-1")int code,Model model) throws Exception{
	model.addAttribute("read",service.couselRead(code));
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

@RequestMapping(value="/counselDelete",method = RequestMethod.POST)
/**
 * 
 * @return �� �Խñ� ���� �� �Խñ� ������� �����̷�Ʈ
 */
public String delete(@RequestParam(value="counselCode")int code,RedirectAttributes rttr) throws Exception{
	service.delete(code);
	rttr.addFlashAttribute("msg","SUCCESS");
	return "redirect:counsel";
	
}
@RequestMapping(value="/counselUpdate",method = RequestMethod.GET)
/**
 * 
 * @return �� �Խñ� ����
 */
	public void updateGET(int code, Model model) throws Exception{
	model.addAttribute(service.couselRead(code));
	
}

@RequestMapping(value="/counselUpdate",method = RequestMethod.POST)
/**
 * 
 * @return �� �Խñ� ���� �� �Խñ� ������� �����̷�Ʈ 
 */
	public String updatePOST(Counsel counsel,RedirectAttributes rttr) throws Exception {
	
	service.update(counsel);
	
	return "redirect:counsel";
}


}
