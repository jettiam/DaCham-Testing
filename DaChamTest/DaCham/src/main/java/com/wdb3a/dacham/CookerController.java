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

import com.wdb3a.dacham.bean.Cook;
import com.wdb3a.dacham.bean.CookingItem;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.bean.FoodMInven;
import com.wdb3a.dacham.service.CookService;
import com.wdb3a.dacham.util.MediaUtils;

@Controller

public class CookerController {
	@Inject
	private CookService service;
	private static final Logger logger= LoggerFactory.getLogger(CookerController.class);
	@Resource(name="uploadPath")
	private String uploadPath;
	@RequestMapping(value="/cookMain", method=RequestMethod.GET)
	public String getMain(){
		return "mate/cooker/cookerMain";
	}

	@RequestMapping(value="/cookList", method=RequestMethod.GET)
	public String getList(Model model,Criteria criteria,Criteria criteria2) throws Exception{
		criteria2 = new Criteria();
		List<CookingItem> list = service.anotherSelectCookingItem3(criteria);
		List<CookingItem> list2 = service.anotherSelectCookingItem5(criteria2);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("criteria",criteria);
		model.addAttribute("criteria2",criteria2);
		
		int totalCount = service.anotherSelectCookingItemCount();
		criteria.setTotalCount(totalCount);
		int totalCount2 = service.anotherSelectCookingItemCount2();
		criteria2.setTotalCount(totalCount2);
		
		return "/mate/cooker/cookingList";
	}
	@RequestMapping(value="/cookFood", method=RequestMethod.GET)
	public String getFood(Model model, FoodMInven foodInv) throws Exception{
		return "/mate/cooker/foodStock";
	}
	@RequestMapping(value="/cook", method=RequestMethod.GET)
	public String getcook(Model model)throws Exception{
		List<Cook> list = service.readycook();		
		model.addAttribute("list",list);
	
		return "/mate/cooker/cook";
	}
	
	@RequestMapping(value = "/cookScreen",method = RequestMethod.GET)
	public String cookScreen(Model model) throws Exception{
		List<CookingItem> list = service.getCookingItemList();
		model.addAttribute("list", list);
		return "/mate/cooker/cookScreen";
	}
	
	@ResponseBody
	@RequestMapping("displayCookFile")
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
