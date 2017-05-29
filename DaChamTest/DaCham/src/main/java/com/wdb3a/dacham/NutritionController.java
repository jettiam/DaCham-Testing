package com.wdb3a.dacham;

import java.io.FileInputStream;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.service.NutritionistService;

import com.wdb3a.dacham.util.MediaUtils;



/*
 * 영양사페이지 컨트롤러
 */
@Controller
@RequestMapping("mate/nutritionist")
public class NutritionController {
	private static final Logger logger = LoggerFactory.getLogger(NutritionController.class);

	@Resource(name="uploadPath")
	private String uploadPath;
   @Inject
   private NutritionistService service;
   
   @RequestMapping(value = "/main", method = RequestMethod.GET)
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
	   model.addAttribute("list",list);
	   
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
	
}