package com.wdb3a.dacham;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("mate/nutritionist")
public class NutritionController {
   @RequestMapping(value = "/main", method = RequestMethod.GET)
   public String getMain(){
      return "mate/nutritionist/nutritionistMain";
   }
   @RequestMapping(value="/diet",method=RequestMethod.GET)
   public String getDiet(){
      return "mate/nutritionist/dietManagement";
   }
   @RequestMapping(value="/dietRegist",method=RequestMethod.GET)
   public String getDietRegist(){
	   return "mate/nutritionist/dietRegist";
   }
   @RequestMapping(value="/side",method = RequestMethod.GET)
   public String getSide(){
	   return "mate/nutritionist/sideDManagement";
   }
   
   @RequestMapping(value="/sideDRegist",method = RequestMethod.GET)
   public String getSideRegist(){
	   return "mate/nutritionist/sideDRegist";
   }
}