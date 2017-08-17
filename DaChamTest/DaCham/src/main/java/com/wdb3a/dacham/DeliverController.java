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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdb3a.dacham.bean.Deliver;
import com.wdb3a.dacham.bean.Nutritionist;
import com.wdb3a.dacham.bean.OrderList;
import com.wdb3a.dacham.service.DeliverService;
import com.wdb3a.dacham.util.MediaUtils;

@Controller

public class DeliverController {
	@Inject
	private DeliverService service;
	private static final Logger logger = LoggerFactory.getLogger(DeliverController.class);
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/deliverMain", method=RequestMethod.GET)
	public String getMain(){
		return "mate/deliver/deliverMain";
	}
	@RequestMapping(value="/deliverList", method=RequestMethod.GET)
	public String getList(Model model,OrderList orderList) throws Exception{
		List<OrderList> list = service.listAll(orderList);
		model.addAttribute("list",list);
		model.addAttribute("orderList",orderList);
		return "/mate/deliver/deliverList";
	}
	@RequestMapping(value="/deliverFood", method=RequestMethod.GET)
	public String getFood(Model model,Deliver deliver) throws Exception{
		List<Nutritionist> list = service.listMaterial();
		
		model.addAttribute("list",list);
		
		model.addAttribute("deliver",deliver);
		return "/mate/deliver/foodStock";
	}
	@RequestMapping(value="/deliverRegist",method = RequestMethod.POST)
	public String createDeliver(Deliver deliver) throws Exception{
		service.createDeliver(deliver);
		return "redirect:deliverFood";
	}
	
//	@RequestMapping(value = "/changer",method = RequestMethod.POST)
//	public String changer(@RequestParam("orderCode")int[] orderCode,@RequestParam("foodMICode")int[] foodMICode,@RequestParam("length") int length) throws Exception{
//		for(int i = 0; i<length; i++){
//			service.changer0(foodMICode[i]);
//			service.changer(orderCode[i]);
//			service.todaySynchro(orderCode[i]);
//		}
//		return "redirect:deliverMain";
//	}
	
	 @ResponseBody
		@RequestMapping("deliverDisplayFile")
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
