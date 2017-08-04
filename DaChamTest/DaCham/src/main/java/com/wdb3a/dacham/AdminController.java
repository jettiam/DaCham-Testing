package com.wdb3a.dacham;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wdb3a.dacham.bean.ChartList;
import com.wdb3a.dacham.bean.ChartPrice;
import com.wdb3a.dacham.bean.Customer;
import com.wdb3a.dacham.bean.FoodMAmountRead;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.bean.Member;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.service.AdminMainService;
import com.wdb3a.dacham.util.MediaUtils;
import com.wdb3a.dacham.util.UploadFileUtils;

/**
 * 커밋을 위한 주석 수정(5월 24일)
 * 
 * @author 김가은
 * 
 *
 */
@Controller
public class AdminController {
	@Inject
	private AdminMainService service;
	private static final Logger logger = LoggerFactory.getLogger(NutritionController.class);

	@Resource(name="uploadPath")
	private String uploadPath;
	@Autowired
	private JavaMailSender mailSender;
	public final static String AUTH_KEY_FCM = "AAAAnH0aVew:APA91bEQ6th6gQGJTZ9LqE_xLEct3i4CZgYLMEeL5K2EeCSJ8M8nZcAxFabBEWTVMJs6sWujl9-bdgicoUtXiJCW7FkuIfGr2xxxtYFBg65lR6WsQzOUExKCNtshqoNUuuam8DrLj_Gd";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";

	// 자바 메일 테스팅
	// mailForm
	@RequestMapping(value = "/mailForm")
	public String mailForm() {

		return "mate/admin/mailForm";
	}
	//식재료 추가 주문
	@RequestMapping(value= "/mailSendingSub", method = RequestMethod.POST)
	public String mailSendingSub (@RequestParam("StockAdd")int[] StockAdd, @RequestParam("foodMCodeAdd")String[] foodMCodeAdd, @RequestParam("foodMNameAdd")String[] foodMNameAdd, @RequestParam("priceAdd")int[] priceAdd,@RequestParam("unitAdd")String[] unitAdd, @RequestParam("cnt")int cnt) throws Exception {
		String authKey = AUTH_KEY_FCM; // You FCM AUTH key
		//System.out.println(authKey); 
		String FMCurl = API_URL_FCM;
		String token = service.appTest("whole");
		String toString = "";
		String setfrom = "dudtka4971@gmail.com";
		String tomail = "dudtka4971@naver.com";
		String title = "이번 식재료 주문 내역서입니다"; // 제목
		int totalPriceAdd=0;
		for(int z=0; z<cnt; z++){     
			 
			totalPriceAdd = priceAdd[z]*StockAdd[z];
			System.out.println(totalPriceAdd);
			System.out.println(foodMNameAdd[z]);
			System.out.println(priceAdd[z]);
			System.out.println(StockAdd[z]);
			System.out.println(unitAdd[z]); 
			FoodMAmountRead foodMAmountRead5 = new FoodMAmountRead();
			foodMAmountRead5.setFoodMCode(foodMCodeAdd[z]);
			foodMAmountRead5.setFoodMName(foodMNameAdd[z]);
			foodMAmountRead5.setInAmount(StockAdd[z]); 
			foodMAmountRead5.setUnit(unitAdd[z]);
			foodMAmountRead5.setPrice(priceAdd[z]);
			   
			service.insertFoodMAdd(foodMAmountRead5);
			
			System.out.println(cnt);     
		
			toString = toString + "\n" + "식재료명 : " + foodMNameAdd[z] + "단가 : "
					+ priceAdd[z] + " 주문량 :" + StockAdd[z] 
					+ unitAdd[z] + " 총가격 : " + totalPriceAdd + "원"; 
		}
		String content = toString; // 내용
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		URL url = new URL(FMCurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setUseCaches(false);
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "key=" + authKey);
		conn.setRequestProperty("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		JSONObject info = new JSONObject();

		info.put("body", "식재료 요청합니다 이메일 확인부탁드립니다"); // Notification body

		json.put("notification", info);
		json.put("to", token.trim()); // deviceID

		try (OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream(), "UTF-8")) {
			// 혹시나 한글 깨짐이 발생하면
			// try(OutputStreamWriter wr = new
			// OutputStreamWriter(conn.getOutputStream(), "UTF-8")){ 인코딩을 변경해준다.

			wr.write(json.toString());
			wr.flush();
		} catch (Exception e) {
		}

		if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
			throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

		String output;
		System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) {
			System.out.println(output);
		}

		conn.disconnect();
	return "redirect:orderList";
	}
	// mailSending 코드
	@RequestMapping(value = "/mailSending", method = RequestMethod.POST)
	public String mailSending(String foodMOrderInfo, @RequestParam("foodMOrder")String[] foodMOrder, @RequestParam("foodMName")String[] foodMName, @RequestParam("foodPrice")int[] foodPrice, @RequestParam("totalAmount")double[] totalAmount1, @RequestParam("unit")String[] unit,  @RequestParam("foodMCnt")int foodMCnt ) throws Exception {  
		
		
		
		String authKey = AUTH_KEY_FCM; // You FCM AUTH key
		//System.out.println(authKey); 
		String FMCurl = API_URL_FCM;
		String token = service.appTest("whole");
		String toString = "";
		String setfrom = "dudtka4971@gmail.com";
		String tomail = "dudtka4971@naver.com";
		String title = "이번 식재료 주문 내역서입니다"; // 제목
		int totalprice;
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(foodMOrderInfo);
		int orderCode;
	
		
		//System.out.println(jsonObj); 
		for (int i = 0; i < jsonObj.size(); i++) { 
			JSONObject jsonObj1 = (JSONObject) jsonObj.get(i + "");
			FoodMAmountRead foodMAmountRead4 = new FoodMAmountRead();   
			System.out.println(foodMOrderInfo);      
			foodMAmountRead4.setFoodMCode(jsonObj1.get("foodMCode").toString());
			foodMAmountRead4.setFoodMName(jsonObj1.get("foodMName").toString());
			foodMAmountRead4.setInAmount(Double.parseDouble(jsonObj1.get("totalAmount").toString()));
			foodMAmountRead4.setUnit(jsonObj1.get("unit").toString());  
			foodMAmountRead4.setPrice(Integer.parseInt(jsonObj1.get("price").toString()));
			foodMAmountRead4.setOrderCode(Integer.parseInt(jsonObj1.get("orderCode").toString()));
			orderCode = Integer.parseInt(jsonObj1.get("orderCode").toString());
			service.insertFoodM(foodMAmountRead4);
			service.foodMUpdate(orderCode);
			double totalAmount = Math.round((Double.parseDouble(jsonObj1.get("totalAmount").toString()))*1000d)/1000d;
			totalprice = (int) (Integer.parseInt(jsonObj1.get("price").toString())
					* Double.parseDouble(jsonObj1.get("totalAmount").toString()));
			//System.out.println(jsonObj1);
			//System.out.println(jsonObj1.get("foodMname").toString());
			/*toString = toString + "\n" + "식재료명 : " + jsonObj1.get("foodMName").toString() + "단가 : "
					+ jsonObj1.get("price").toString() + " 주문량 :"  + totalAmount
					+ jsonObj1.get("unit").toString() + " 총가격 : " + totalprice + "원";*/
			
			//System.out.println(toString);	
		}
		for(int i= 0; i<foodMCnt; i++){
		toString = toString + "\n" + "식재료명 : " + foodMName[i] + "단가 : "
				+ foodPrice[i] + " 주문량 :"  + totalAmount1[i]
				+ unit[i] + " 총가격 : " +  + foodPrice[i]*totalAmount1[i] +"원";
		}
		System.out.println("되니?");
		
		 
		String content = toString; // 내용
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		URL url = new URL(FMCurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setUseCaches(false);
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "key=" + authKey);
		conn.setRequestProperty("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		JSONObject info = new JSONObject();

		info.put("body", "식재료 요청합니다 이메일 확인부탁드립니다"); // Notification body

		json.put("notification", info);
		json.put("to", token.trim()); // deviceID

		try (OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream(), "UTF-8")) {
			// 혹시나 한글 깨짐이 발생하면
			// try(OutputStreamWriter wr = new
			// OutputStreamWriter(conn.getOutputStream(), "UTF-8")){ 인코딩을 변경해준다.

			wr.write(json.toString());
			wr.flush();
		} catch (Exception e) {
		}

		if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
			throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

		String output;
		System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) {
			System.out.println(output);
		}

		conn.disconnect();
		// ("식재료명 :" + bookObject.get("foodMName") + " 단가
		// :"+bookObject.get("price") + " 주문량 :" + bookObject.get("foodMAmount")
		// + " 단위 : " + bookObject.get("unit"));
		// String tomail = request.getParameter("tomail"); // 받는 사람 이메일

		// String title = request.getParameter("title"); // 제목
		// String content = request.getParameter("content"); // 내용

		/*
		 * try { MimeMessage message = mailSender.createMimeMessage();
		 * MimeMessageHelper messageHelper = new MimeMessageHelper(message,
		 * true, "UTF-8");
		 * 
		 * messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
		 * messageHelper.setTo(tomail); // 받는사람 이메일
		 * messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		 * messageHelper.setText(content); // 메일 내용
		 * 
		 * mailSender.send(message); } catch(Exception e){
		 * System.out.println(e); }
		 */

		return "redirect:orderList";
	}

	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String getadminMain() throws Exception {
		return "mate/admin/adminMain";
	}

	// 도넛차트 컨트롤러
	@RequestMapping(value = "/adminMain1", method = RequestMethod.GET)
	@ResponseBody
	public List<ChartList> getadminMain1(Model model) throws Exception {
		List<ChartList> chartList = service.chartList();
		model.addAttribute("chartList", chartList);
		return chartList;
	}

	// 막대그래프 컨트롤러{디폴트}
	@RequestMapping(value = "/adminMain2", method = RequestMethod.GET)
	@ResponseBody
	public List<ChartPrice> getadminMain2(Model model) throws Exception {
		List<ChartPrice> chartPrice = service.chartPrice();
		model.addAttribute("chartPrice", chartPrice);
		return chartPrice;
	}

	// 막대그래프 버튼클릭시
	@RequestMapping(value = "/adminMain3", method = RequestMethod.POST)
	@ResponseBody
	public List<ChartPrice> getadminMain3(Model model, @RequestBody ChartPrice dates) throws Exception {
		System.out.println(dates.getStartdate());
		List<ChartPrice> chartPrice = service.chartPrice1(dates);
		model.addAttribute("chartPrice", chartPrice);
		return chartPrice;
	}

	// 디테일뷰
	@RequestMapping(value = "/adminMain4", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderList> getadminMain4(@RequestParam(value = "orderCode") String orderCode) throws Exception {
		System.out.println(orderCode);
		List<OrderList> orderList = service.datailview(orderCode);
		return orderList;
	}

	@RequestMapping(value = "/customer")
	public String getcustomer(Model model, Member member) throws Exception{
		model.addAttribute("member", member);
		return "mate/admin/customer"; 
	}

	@RequestMapping(value = "/customerInfo")
	public String getcustomerInfo() {
		return "mate/admin/customerInfo";
	}

	@RequestMapping(value = "/dietManagement")
	public String getdietManagement() {
		return "mate/admin/dietManagement";
	}

	@RequestMapping(value = "/emp")
	public String getemp() {
		return "mate/admin/emp";
	}

	@RequestMapping(value = "/empInfo")
	public String getempInfo() {
		return "mate/admin/empInfo";
	}

	@RequestMapping(value = "/empRegist")
	public String getempRegist() {
		return "mate/admin/empRegist";
	}

	@RequestMapping(value = "/foodOrder", method = RequestMethod.GET)
	public String getfoodOrder(Model model, FoodMInven foodMInven) throws Exception {
		List<FoodMInven> invenlist = service.foodStockList(foodMInven);
		model.addAttribute("invenlist", invenlist);
		model.addAttribute("foodMInven", foodMInven);
		return "mate/admin/foodOrder";
	}

	@RequestMapping(value = "/foodStock", method = RequestMethod.GET)
	public String getfoodStock(Model model, FoodMInven foodMInven) throws Exception {
		List<FoodMInven> list = service.foodStockList(foodMInven);
		model.addAttribute("list", list);
		model.addAttribute("foodMInven", foodMInven);
		return "mate/admin/foodStock";
	}

	// 체크박스 된 식단에 대한 orderCode에 맞는 식재료 넘기기
	@RequestMapping(value = "/foodOrder", method = RequestMethod.POST)
	public String getfoodStock1(Model model, String orderCode) throws Exception {
		// System.out.println(orderCode);
		Map<Integer, Object> map = new HashMap<Integer, Object>();
		// List<FoodMAmountRead> list = new ArrayList<FoodMAmountRead>();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(orderCode);
		// JSONObject jsonObjTest = (JSONObject) jsonObj.get(0+"");
		// System.out.println(Integer.parseInt(jsonObjTest.get("orderCode").toString()));
		for (int i = 0; i < jsonObj.size(); i++) {

			JSONObject jsonObj1 = (JSONObject) jsonObj.get(i + "");
			System.out.println("이건돌아가냐?1");
			List<FoodMAmountRead> foodMAmountRead1 = new ArrayList<FoodMAmountRead>();
			System.out.println("이건돌아가냐?2");
			// foodMAmountRead1.setOrderCode(Integer.parseInt(jsonObj1.get("orderCode").toString()));
			System.out.println(Integer.parseInt(jsonObj1.get("orderCode").toString()));
			int a = Integer.parseInt(jsonObj1.get("orderCode").toString());
			foodMAmountRead1 = service.foodMAmountRead(a);

			map.put(i, foodMAmountRead1);
		}

		model.addAttribute("map", map);
		// 미완성 식재료 다중 합친거
		/*
		 * for(int i=0; i<jsonObj.size(); i++){
		 * 
		 * JSONObject jsonObj1 = (JSONObject) jsonObj.get(i+"");
		 * System.out.println("이건돌아가냐?1");
		 * 
		 * System.out.println("이건돌아가냐?2");
		 * 
		 * System.out.println(Integer.parseInt(jsonObj1.get("orderCode").
		 * toString()));
		 * 
		 * String a = jsonObj1.get("orderCode").toString(); oCode.add(a);
		 * 
		 * } List<FoodMAmountRead> foodMAmountRead1 = new
		 * ArrayList<FoodMAmountRead>(); //foodMAmountRead1 =
		 * service.foodMAmountRead(oCode); foodMAmountRead1 =
		 * service.foodMAmountReadex(oCode);
		 * 
		 * model.addAttribute("map", foodMAmountRead1);
		 * 
		 */

		return "mate/admin/foodOrder";
	}

	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String getorderList(Model model, OrderList order) throws Exception {
		List<OrderList> list = service.orderAll(order);
		model.addAttribute("list", list);
		model.addAttribute("order", order);
		return "mate/admin/orderList";
	}

	@RequestMapping(value = "/statistics")
	public String getstatistics() {
		return "mate/admin/statistics";
	}

	@RequestMapping(value = "/notice")
	public String getnotice() {
		return "mate/admin/notice";
	}
	 @ResponseBody
		@RequestMapping("displayFileAdmin")
		public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
			ResponseEntity<byte[]> entity = null;
			
			String ext = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mediaType = MediaUtils.getMediaType(ext);
			
			InputStream in = null;
			
			logger.info("File Name: " + fileName);
			
			HttpHeaders headers = new HttpHeaders();
			//uploadPath : resources/upload
			//fileName : /2017/05/18/ThumbNail_rose_XXXXX.jpg
			try{
				in = new FileInputStream(uploadPath+fileName);
				if(mediaType != null){
					headers.setContentType(mediaType);
				}else{
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					String fN = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
					headers.add("Content-Disposition", "attachment; filename=\""+fN+"\"");
				}
				byte[] data = IOUtils.toByteArray(in);
				entity = new ResponseEntity<byte[]>(data, headers, HttpStatus.CREATED);
			}catch(Exception e){
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}finally{
				in.close();
			}
			
			return entity;
		}
		@RequestMapping(value="/dietSell",method=RequestMethod.GET)
		public String dietSell(@RequestParam(value="dietCode") int dietCode[])throws Exception{
		   //serviceCu.orderRegist(customer);
		   System.out.println("오더에 들어감");
		   for(int i=0;i<dietCode.length;i++){
		      service.dietSell(dietCode[i]);  
		   }
		   
		   //model.addAttribute("order", customer);
		   //model.addAttribute("sideDCode",sideDish);
		   return "mate/admin/dietManagement";
		}
		
		@RequestMapping(value="/dietSellStop",method=RequestMethod.GET)
		public String dietSellStop(@RequestParam(value="dietCode") int dietCode[])throws Exception{
		   System.out.println("오더에 들어감");
		   for(int i=0;i<dietCode.length;i++){
		      service.dietSellStop(dietCode[i]);  
		   } 
		   return "mate/admin/dietManagement";
		}
		
		@RequestMapping(value="empjoin",method = RequestMethod.POST)
		public String joinPost(MultipartHttpServletRequest request,Member member, MultipartFile file) throws Exception{
			String savedName = UploadFileUtils.uploadFile(request,file.getOriginalFilename(), uploadPath, file.getBytes());
			member.setPhotoImg(savedName);
			service.empjoin(member);  
			return "mate/admin/adminMain";	
		}
		
		
}
