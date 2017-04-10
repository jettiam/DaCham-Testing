package com.wdb3a.dacham;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wdb3a.dacham.bean.Emp;
import com.wdb3a.dacham.service.LoginService;

@Controller
public class LoginController {
		@Inject
		private LoginService service;
	
		@RequestMapping(value="/main2")
		public String getMain2(){
			return "main2";
		}
				
		//테스팅용 
		@RequestMapping(value="test")
		public String selectEmpAll(Model model){
			try {
				List<Emp> list = service.empListAll();
				model.addAttribute("list", list);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return "main2";
			
		}
		
		@RequestMapping(value="empLogin")
		public String empLogin(Model model, String emp_id, String emp_pw){
			try {
				int result = service.checkEmpLogin(emp_id, emp_pw);
				System.out.println("........"+result);
				if(result==1){ //로그인 성공시
					Emp dbResult = service.getEmp(emp_id);
					model.addAttribute("EmpName", dbResult.getEmp_name());
					model.addAttribute("EmpDept", dbResult.getDept());
					return "loginSuccess";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "main2";
			
		}
}
