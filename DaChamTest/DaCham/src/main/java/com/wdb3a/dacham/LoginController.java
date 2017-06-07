package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wdb3a.dacham.bean.Emp;
import com.wdb3a.dacham.bean.Member;
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
		
	
		@RequestMapping(value="main" ,method = RequestMethod.POST)
		/**
		 * 
		 * @param model
		 * @param id 받아온 아이디
		 * @param pw 받아온 비밀번호
		 * result 1:로그인성공 2: ....
		 * @return
		 */
		public String memberLogin(Model model, String id, String pw, HttpSession session){
			int result=-3;
			try {
				result = service.checkMemberLogin(id, pw);
				if(result==1){
					Member dbResult = service.getMember(id);
					session.setAttribute("memberName", dbResult.getName());
					session.setAttribute("customerId", dbResult.getId());
					model.addAttribute("result", result);
					return "main";
				}else{
					model.addAttribute("result", result);
					return "main";
				}			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println("회원 로그인 결과: "+result);
			return "main";
			
		}
		
		@RequestMapping(value="empLogin")
		public String empLogin(Model model, String emp_id, String emp_pw,HttpSession session){
			int result=-3;
			try {
				result = service.checkEmpLogin(emp_id, emp_pw);
				System.out.println("........"+result);
				if(result==1){ //로그인 성공시
					Emp dbResult = service.getEmp(emp_id);
					session.setAttribute("EmpName", dbResult.getEmp_name());
					session.setAttribute("EmpDept", dbResult.getDept());
					model.addAttribute("result",dbResult);
					System.out.println(dbResult.getEmp_name());
					System.out.println(dbResult.getDept());
					if(dbResult.getDept().equals("영양사")){
						return "/mate/nutritionist/nutritionistMain";
					}
					else if(dbResult.getDept().equals("조리팀")){
						return "/mate/cooker/cookerMain";
					}
					else if(dbResult.getDept().equals("관리자")){
						return "/mate/admin/adminMain";
					}
					else if(dbResult.getDept().equals("배송팀")){
						return "/mate/deliver/deliverMain";
					}
					else if(dbResult.getDept().equals("고객응대팀")){
						return "/mate/counselor/counselorMain";
					}
					return "mate/mateMain";
				}else{
					model.addAttribute("result", result);
					return "main2";
				}
			} catch (Exception e) {				
				e.printStackTrace();
			}		
			return "main2";
			
		}
}
