package com.wdb3a.dacham;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/*
 * ����������� ��Ʈ�ѷ�
 */
@Controller
@RequestMapping("mate/nutritionist")
public class NutritionController {
   @RequestMapping(value = "/main", method = RequestMethod.GET)
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
   public String getDietRegist(){
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
   public String getSideRegist(){
	   return "mate/nutritionist/sideDRegist";
   }
   /*
    * @return ����ȽĴ� ���� �������� �̵�
    */
   @RequestMapping(value="/special",method = RequestMethod.GET)
   public String getSpecial(){
	   return "mate/nutritionist/SPDietMain";
   }
   /*
    * @return ����ȽĴ� ��� �������� �̵�
    */
   @RequestMapping(value="/SPRegist", method = RequestMethod.GET)
   public String getSPRegist(){
	   return "mate/nutritionist/SPDietRegist";
   }
}