package com.wdb3a.dacham;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wdb3a.dacham.bean.Counsel;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.bean.Testing5;
import com.wdb3a.dacham.dao.MongoDAO;
import com.wdb3a.dacham.service.NutritionistService;

import com.wdb3a.dacham.util.MediaUtils;

import com.wdb3a.dacham.util.UploadFileUtils;



/*
 * ����������� ��Ʈ�ѷ�
 */
@Controller

public class NutritionController {
	private static final Logger logger = LoggerFactory.getLogger(NutritionController.class);

	@Resource(name="uploadPath")
	private String uploadPath;
   @Inject
   private NutritionistService service;
   
   @RequestMapping(value = "/nutriMain", method = RequestMethod.GET)
   /*
    * @return ����� ������������ �̵�
    */
   public String getMain(){
      return "mate/nutritionist/nutritionistMain";
   }
   @RequestMapping(value="/wizard", method = RequestMethod.GET)
   /*
    * @return �Ĵ����ڵ�� �̵�
    */
   public String getWizard(){
	   return "mate/nutritionist/dietWizard";
   }
   /*
    * @return �Ĵ����ڵ� ����������� �̵�
    */
   @RequestMapping(value="/wizardMod",method = RequestMethod.GET)
   public String getMod(){
	   return "mate/nutritionist/dietWizardMod";
   }
  
   /*
    * @return �Ĵܰ��� �������� �̵�
    */
   @RequestMapping(value="/diet",method=RequestMethod.GET)
   public String getDiet(){
      return "mate/nutritionist/dietManagement";
   }
   /*
    * @return �Ĵܵ�� �������� �̵�
    */
   @RequestMapping(value="/dietRegist",method=RequestMethod.GET)
   public String getDietRegist(Model model,Nutritionist nutritionist) throws Exception{
	   List<Nutritionist> list = service.listSearch(nutritionist);
	   List<Nutritionist> overList = service.choiceDisease();
	   model.addAttribute("overList",overList);
	   model.addAttribute("list",list);
	   model.addAttribute("nutritionist",nutritionist);
	  
	   return "mate/nutritionist/dietRegist";
   }
   /*
    * @return �������� �������� �̵�
    */
   @RequestMapping(value="/side",method = RequestMethod.GET)
   public String getSide(){
	   return "mate/nutritionist/sideDManagement";
   }
   /*
    * @return ������� �������� �̵�
    */
   @RequestMapping(value="/sideDRegist",method = RequestMethod.GET)
   public String getSideRegist(Model model, Nutritionist nutritionist) throws Exception{
	   List<Nutritionist> list = service.materialSearch(nutritionist);
	   
	   model.addAttribute("list",list);
	   
	  
	   return "mate/nutritionist/sideDRegist";
   }
   
   @RequestMapping(value = "/side", method = RequestMethod.POST)
   public String postSideRegist(MultipartHttpServletRequest request,Model model, Nutritionist nutritionist, MultipartFile file, @RequestParam("foodMCode")String[] foodMCode,@RequestParam("cnt")int cnt,@RequestParam("foodMAmount")int[] foodMAmount) throws Exception{
	   System.out.println("���� ���ε� : "+uploadPath);
	   
	   String savedName = UploadFileUtils.uploadFile(request,file.getOriginalFilename() ,uploadPath,file.getBytes());
		model.addAttribute("savedName", savedName);
		System.out.println("����:"+cnt);
		nutritionist.setSideDImg(savedName);
		service.createSide(nutritionist);
		for(int i = 0; i< cnt; i++){
			System.out.println("�ڵ��ȣ : "+foodMCode[i]);
			nutritionist.setFoodMCode(foodMCode[i]);
			nutritionist.setFoodMAmount(foodMAmount[i]);
			service.createAmount(nutritionist);
		}
		
	    return "redirect:side";
   }
   @RequestMapping(value = "/diet",method = RequestMethod.POST)
   public String postDietRegist(MultipartHttpServletRequest request,Model model, Nutritionist nutritionist, MultipartFile file,@RequestParam("sideDType")String[] sideDType,@RequestParam("count")int count) throws Exception{
	   System.out.println("���� ��ϵǷ� �մϴ�.");
	  String savedName = UploadFileUtils.uploadFile(request,file.getOriginalFilename(), uploadPath, file.getBytes());
	   model.addAttribute("savedName",savedName);
	   System.out.println("����:"+count);
	   nutritionist.setDietImg(savedName);
	   service.createDiet(nutritionist);
	   /*for(int i = 0; i<count; i++){		   
		   System.out.println("�ڵ��ȣ : " + sideDCode[i]);
		   nutritionist.setSideDCode(sideDCode[i]);
		   service.createDietInfo(nutritionist);
		   System.out.println("���� ��� �Ϸ�" + (i+1) + "��");
	   }*/
	   for(int i=0; i<count;i++){
		   int sideDTypeUnDefault = sideDType[i].indexOf("_1");
		   if(sideDTypeUnDefault==-1){
			   int sideDTypeDefault = sideDType[i].indexOf("_0");
			   nutritionist.setSideDType("0");
			   nutritionist.setSideDCode(sideDType[i].substring(0,sideDTypeDefault));
			   System.out.println("����Ʈ �����ڵ�: "+sideDType[i].substring(0,sideDTypeDefault)+" ����Ʈ:"+nutritionist.getSideDType());
			   service.createDietInfo(nutritionist);
		   }else{
			   nutritionist.setSideDType("1");
			   nutritionist.setSideDCode(sideDType[i].substring(0,sideDTypeUnDefault));
			   System.out.println("�����Ʈ �����ڵ�: "+sideDType[i].substring(0,sideDTypeUnDefault)+" ����Ʈ:"+nutritionist.getSideDType());
			   service.createDietInfo(nutritionist);
		   }
	   }
	   return "redirect:diet";
   }
   /*
    * @return ����ȽĴ� ���� �������� �̵�
    */
   @RequestMapping(value="/special",method = RequestMethod.GET)
   public String getSpecial(Model model) throws Exception{
	   List<OrderList> list = service.specialList();
	   model.addAttribute("list",list);
	   return "mate/nutritionist/SPDietMain";
   }
   /*
    * @return ����ȽĴ� ��� �������� �̵�
    */
   @RequestMapping(value="/SPRegist", method = RequestMethod.GET)
   public String getSPRegist(Model model,@RequestParam("counselCode")int counselCode) throws Exception{
	   List<Nutritionist> overList = service.choiceDisease();
	   model.addAttribute("overList",overList);
	   Counsel counsel = service.specialView(counselCode);
	   model.addAttribute("counsel",counsel);
	   return "mate/nutritionist/SPDietRegist";
   }
   @RequestMapping(value = "/SPDiet",method = RequestMethod.POST)
   public String postSPDietRegist(MultipartHttpServletRequest request,Model model, Nutritionist nutritionist, MultipartFile file,@RequestParam("sideDType")String[] sideDType,@RequestParam("count")int count,@RequestParam("counselCode")int counselCode) throws Exception{
	   System.out.println("���� ��ϵǷ� �մϴ�.");
	  String savedName = UploadFileUtils.uploadFile(request,file.getOriginalFilename(), uploadPath, file.getBytes());
	   model.addAttribute("savedName",savedName);
	   System.out.println("����:"+count);
	   System.out.println("����ڵ�:"+counselCode);
	   String answer = service.answer(counselCode);
	   System.out.println("������ �亯:"+answer);
	   
	   
	   nutritionist.setDietImg(savedName);
	   service.createDiet(nutritionist);
	   service.specialRegist(nutritionist.getCustomer());
	   int maxDiet = service.maxDiet();
	   answer = answer + "<br><a href = 'detailOrder?dietCode="+maxDiet+"'>"+"Please click to enter your diet!"+"</a><br>";
	   System.out.println("�Ĵ��� �ڵ�:"+maxDiet);
	   nutritionist.setAnswer(answer);
	   nutritionist.setCounselCode(counselCode);
	   service.answers(nutritionist);
	   /*for(int i = 0; i<count; i++){		   
		   System.out.println("�ڵ��ȣ : " + sideDCode[i]);
		   nutritionist.setSideDCode(sideDCode[i]);
		   service.createDietInfo(nutritionist);
		   System.out.println("���� ��� �Ϸ�" + (i+1) + "��");
	   }*/
	   for(int i=0; i<count;i++){
		   int sideDTypeUnDefault = sideDType[i].indexOf("_1");
		   if(sideDTypeUnDefault==-1){
			   int sideDTypeDefault = sideDType[i].indexOf("_0");
			   nutritionist.setSideDType("0");
			   nutritionist.setSideDCode(sideDType[i].substring(0,sideDTypeDefault));
			   System.out.println("����Ʈ �����ڵ�: "+sideDType[i].substring(0,sideDTypeDefault)+" ����Ʈ:"+nutritionist.getSideDType());
			   service.createDietInfo(nutritionist);
			   service.optionInsert(nutritionist);
		   }else{
			   nutritionist.setSideDType("1");
			   nutritionist.setSideDCode(sideDType[i].substring(0,sideDTypeUnDefault));
			   System.out.println("�����Ʈ �����ڵ�: "+sideDType[i].substring(0,sideDTypeUnDefault)+" ����Ʈ:"+nutritionist.getSideDType());
			   service.createDietInfo(nutritionist);
		   }
	   }
	   //�Խ��ǿ� �ִ� text(answer)�� �����ͼ� String ������ �����Ű��(����1)
	   
	   //�������� ���� �ֱٿ� ��ϵ� �Ĵ� �ڵ带 �������� ����2
	   //a�±׸� �ؼ� String�� ���̰�, String�� ���� �Ĵ��ڵ� �ּҸ� a�±׿� 
	   service.specialComplete(nutritionist.getCustomer());
	   System.out.println("�����̵�:"+nutritionist.getCustomer());
	   return "redirect:special";
   }
   //������ ���� ���� ���� ���
   @RequestMapping(value = "sideModify",method = RequestMethod.GET)
   public String getSideModify(Model model,@RequestParam("sideDCode")String sideDCode) throws Exception{
	   Nutritionist nutritionist = service.sideOver(sideDCode);
	   model.addAttribute("nutritionist",nutritionist);
	   return "mate/nutritionist/sideModify";
   }
   //���� ����
   @RequestMapping(value = "sideModify",method = RequestMethod.POST)
   public String postSideModify(MultipartHttpServletRequest request,Model model,Nutritionist nutritionist,MultipartFile file,@RequestParam("cnt")int cnt,@RequestParam("foodMCode")String[] foodMCode, @RequestParam("foodMAmount")int[] foodMAmount) throws Exception{
	   String savedName = UploadFileUtils.uploadFile(request,file.getOriginalFilename() ,uploadPath,file.getBytes());
		model.addAttribute("savedName", savedName);
		System.out.println("����:"+cnt);
		nutritionist.setSideDImg(savedName);
	    service.sideModify(nutritionist);
	    service.modifyCross1(nutritionist.getSideDCode());
	    for(int i = 0; i< cnt;i++){
	    	System.out.println("�ڵ��ȣ : "+foodMCode[i]);
			nutritionist.setFoodMCode(foodMCode[i]);
			nutritionist.setFoodMAmount(foodMAmount[i]);
			service.modifyCross2(nutritionist);
	    }
	    return "redirect:side";
   }
   //������ ���� �Ĵ� ���� ���
   @RequestMapping(value = "dietModify",method = RequestMethod.GET)
   public String getDietModify(Model model, @RequestParam("dietCode")int dietCode,HttpServletRequest request) throws Exception{
	   Nutritionist nutritionist = service.dietOver(dietCode);
	   List<Nutritionist> overList = service.choiceDisease();
	   model.addAttribute("overList",overList);
	   model.addAttribute("nutritionist",nutritionist);
	   model.addAttribute("cloneDisease", nutritionist.getDiseaseCode());
	   return "mate/nutritionist/dietModify";
   }
   //�Ĵ� ����
   @RequestMapping(value = "dietModify",method = RequestMethod.POST)
<<<<<<< HEAD
   public String postDietModify(Model model, Nutritionist nutritionist, MultipartFile file,@RequestParam("length1")int length1,@RequestParam("length2")int length2,@RequestParam("length3")int length3,@RequestParam("length4")int length4,@RequestParam("length5")int length5,@RequestParam("length6")int length6,@RequestParam("sideDType1")String[] sideDType1,@RequestParam("sideDType2")String[] sideDType2,@RequestParam("sideDType3")String[] sideDType3,@RequestParam("sideDType4")String[] sideDType4,@RequestParam("sideDType5")String[] sideDType5,@RequestParam("sideDType6")String[] sideDType6, @RequestParam("sideDCode1")String[] sideDCode1, @RequestParam("sideDCode2")String[] sideDCode2, @RequestParam("sideDCode3")String[] sideDCode3, @RequestParam("sideDCode4")String[] sideDCode4, @RequestParam("sideDCode5")String[] sideDCode5, @RequestParam("sideDCode6")String[] sideDCode6) throws Exception{
	   String savedName = UploadFileUtils.uploadFile(file.getOriginalFilename() ,uploadPath,file.getBytes());
=======
   public String postDietModify(MultipartHttpServletRequest request,Model model, Nutritionist nutritionist, MultipartFile file) throws Exception{
	   String savedName = UploadFileUtils.uploadFile(request,file.getOriginalFilename() ,uploadPath,file.getBytes());
>>>>>>> branch 'master' of https://github.com/jettiam/DaCham-Testing.git
		model.addAttribute("savedName", savedName);
		nutritionist.setDietImg(savedName);
		service.dietModify(nutritionist);
		service.updateCross1(nutritionist.getDietCode());
		
		for(int i = 0; i<length1;i++){
			System.out.println("�� ��������:"+ sideDCode1[i]);
			System.out.println("�� Ÿ�Ե���:"+ sideDType1[i]);
			nutritionist.setSideDType(sideDType1[i]);
			nutritionist.setSideDCode(sideDCode1[i]);
			service.updateCross2(nutritionist);
		}
		for(int i = 0; i<length2;i++){
			System.out.println("�� ��������:"+ sideDCode2[i]);
			nutritionist.setSideDType(sideDType2[i]);
			nutritionist.setSideDCode(sideDCode2[i]);
			service.updateCross2(nutritionist);
		}
		for(int i = 0; i<length3;i++){
			System.out.println("�� ��������:"+ sideDCode3[i]);
			nutritionist.setSideDType(sideDType3[i]);
			nutritionist.setSideDCode(sideDCode3[i]);
			service.updateCross2(nutritionist);
		}
		for(int i = 0; i<length4;i++){
			System.out.println("�� ��������:"+ sideDCode4[i]);
			nutritionist.setSideDType(sideDType4[i]);
			nutritionist.setSideDCode(sideDCode4[i]);
			service.updateCross2(nutritionist);
		}
		for(int i = 0; i<length5;i++){
			System.out.println("�� ��������:"+ sideDCode5[i]);
			nutritionist.setSideDType(sideDType5[i]);
			nutritionist.setSideDCode(sideDCode5[i]);
			service.updateCross2(nutritionist);
		}
		for(int i = 0; i<length6;i++){
			System.out.println("�� ��������:"+ sideDCode6[i]);
			nutritionist.setSideDType(sideDType6[i]);
			nutritionist.setSideDCode(sideDCode6[i]);
			service.updateCross2(nutritionist);
		}
		return "redirect:diet";
   }
   
    @ResponseBody
	@RequestMapping("displayFile")
	public ResponseEntity<byte[]> displayFile(HttpServletRequest request,String fileName) throws Exception{
		ResponseEntity<byte[]> entity = null;
		System.out.println("�̹��� �ε�");
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		String path = request.getSession().getServletContext().getRealPath("");
		MediaType mediaType = MediaUtils.getMediaType(ext);
		
		InputStream in = null;
		
		logger.info("File Name: " + fileName);
		
		HttpHeaders headers = new HttpHeaders();
		//uploadPath : resources/upload
		//fileName : /2017/05/18/ThumbNail_rose_XXXXX.jpg
		System.out.println(path+uploadPath+fileName);
		try{
			in = new FileInputStream(path+uploadPath+fileName);
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

	/**
	 * ���� DB ����� ���� DAO ��ü ������ ctx�� ���� Bean ������.
	 */
	WebApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
	MongoDAO mongoDAO = ctx.getBean("mongoDAO", MongoDAO.class);	
	
	/**
	 * param�� �ҷ��� �� mongoDB�� insert�� �����Ѵ�. 
	 * @param wizard json������ String
	 * @param block xml ������ String
	 * @return success ���ڿ� ��ȯ
	 */
	@RequestMapping(value="/wizardInsert", method=RequestMethod.GET)
	public @ResponseBody String wizardInsert(String wizard, String block){
		mongoDAO.wizardInsert(wizard, block);		
		return "success";
	}
	
	@RequestMapping(value="/wizardTestGet", method=RequestMethod.GET)
	public String wizardTestGet(Model model){
		List<Testing5> tt = mongoDAO.getTestingWizard();
		int maxInx = tt.size()-1;
		String block = tt.get(maxInx).getBlock();
		model.addAttribute("block", block);
		model.addAttribute("tt", tt);
	return "mate/nutritionist/dietWizardMod";		
	}
	
	@RequestMapping(value="/wizardTestGetWizard", method=RequestMethod.GET)
	public @ResponseBody Object getWizardText(){
		List<Testing5> tt = mongoDAO.getTestingWizard();
		int maxInx = tt.size()-1;
		Object wizard = tt.get(maxInx).getWizard();
		return wizard;
	}
}