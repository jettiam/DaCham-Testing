package com.wdb3a.dacham;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/*
 * 영양사페이지 컨트롤러
 */
@Controller
@RequestMapping("mate/nutritionist")
public class NutritionController {
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
   public String getDietRegist(){
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
   public String getSideRegist(){
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
}