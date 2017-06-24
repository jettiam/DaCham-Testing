package com.wdb3a.dacham;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

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

import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.Testing5;
import com.wdb3a.dacham.dao.MongoDAO;
import com.wdb3a.dacham.service.NutritionistService;

import com.wdb3a.dacham.util.MediaUtils;

import com.wdb3a.dacham.util.UploadFileUtils;



/*
 * 영양사페이지 컨트롤러
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
    * @return 영양사 메인페이지로 이동
    */
   public String getMain(){
      return "mate/nutritionist/nutritionistMain";
   }
   @RequestMapping(value="/wizard", method = RequestMethod.GET)
   /*
    * @return 식단위자드로 이동
    */
   public String getWizard(){
	   return "mate/nutritionist/dietWizard";
   }
   /*
    * @return 식단위자드 등록페이지로 이동
    */
   @RequestMapping(value="/wizardMod",method = RequestMethod.GET)
   public String getMod(){
	   return "mate/nutritionist/dietWizardMod";
   }
  
   /*
    * @return 식단관리 페이지로 이동
    */
   @RequestMapping(value="/diet",method=RequestMethod.GET)
   public String getDiet(){
      return "mate/nutritionist/dietManagement";
   }
   /*
    * @return 식단등록 페이지로 이동
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
    * @return 반찬관리 페이지로 이동
    */
   @RequestMapping(value="/side",method = RequestMethod.GET)
   public String getSide(){
	   return "mate/nutritionist/sideDManagement";
   }
   /*
    * @return 반찬등록 페이지로 이동
    */
   @RequestMapping(value="/sideDRegist",method = RequestMethod.GET)
   public String getSideRegist(Model model, Nutritionist nutritionist) throws Exception{
	   List<Nutritionist> list = service.materialSearch(nutritionist);
	   
	   model.addAttribute("list",list);
	   
	  
	   return "mate/nutritionist/sideDRegist";
   }
   
   @RequestMapping(value = "/side", method = RequestMethod.POST)
   public String postSideRegist(Model model, Nutritionist nutritionist, MultipartFile file, @RequestParam("foodMCode")String[] foodMCode,@RequestParam("cnt")int cnt,@RequestParam("foodMAmount")int[] foodMAmount) throws Exception{
	   System.out.println("파일 업로드");
	   String savedName = UploadFileUtils.uploadFile(file.getOriginalFilename() ,uploadPath,file.getBytes());
		model.addAttribute("savedName", savedName);
		System.out.println("총합:"+cnt);
		nutritionist.setSideDImg(savedName);
		service.createSide(nutritionist);
		for(int i = 0; i< cnt; i++){
			System.out.println("코드번호 : "+foodMCode[i]);
			nutritionist.setFoodMCode(foodMCode[i]);
			nutritionist.setFoodMAmount(foodMAmount[i]);
			service.createAmount(nutritionist);
		}
		
	    return "redirect:side";
   }
   @RequestMapping(value = "/diet",method = RequestMethod.POST)
   public String postDietRegist(Model model, Nutritionist nutritionist, MultipartFile file, @RequestParam("sideDCode")String[] sideDCode,@RequestParam("count")int count) throws Exception{
	   System.out.println("이제 등록되려 합니다.");
	   String savedName = UploadFileUtils.uploadFile(file.getOriginalFilename(), uploadPath, file.getBytes());
	   model.addAttribute("savedName",savedName);
	   System.out.println("총합:"+count);
	   nutritionist.setDietImg(savedName);
	   service.createDiet(nutritionist);
	   for(int i = 0; i<count; i++){
		   System.out.println("코드번호 : " + sideDCode[i]);
		   nutritionist.setSideDCode(sideDCode[i]);
		   service.createDietInfo(nutritionist);
		   System.out.println("정보 등록 완료" + (i+1) + "개");
	   }
	   return "redirect:diet";
   }
   /*
    * @return 스페셜식단 관리 페이지로 이동
    */
   @RequestMapping(value="/special",method = RequestMethod.GET)
   public String getSpecial(){
	   return "mate/nutritionist/SPDietMain";
   }
   /*
    * @return 스페셜식단 등록 페이지로 이동
    */
   @RequestMapping(value="/SPRegist", method = RequestMethod.GET)
   public String getSPRegist(){
	   return "mate/nutritionist/SPDietRegist";
   }
   
    @ResponseBody
	@RequestMapping("displayFile")
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

	/**
	 * 몽고 DB 사용을 위한 DAO 객체 생성과 ctx를 통한 Bean 가져옴.
	 */
	WebApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
	MongoDAO mongoDAO = ctx.getBean("mongoDAO", MongoDAO.class);	
	
	/**
	 * param을 불러온 뒤 mongoDB에 insert를 수행한다. 
	 * @param wizard json형태의 String
	 * @param block xml 형태의 String
	 * @return success 문자열 반환
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