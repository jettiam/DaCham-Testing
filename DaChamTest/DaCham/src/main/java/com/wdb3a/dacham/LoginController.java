package com.wdb3a.dacham;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
				
		//�׽��ÿ� 
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
		
	
		@RequestMapping(value="memberLogin")
		/**
		 * 
		 * @param model
		 * @param id �޾ƿ� ���̵�
		 * @param pw �޾ƿ� ��й�ȣ
		 * result 1:�α��μ��� 2: ....
		 * @return
		 */
		public String memberLogin(Model model, String id, String pw){
			int result=-3;
			try {
				result = service.checkMemberLogin(id, pw);
				if(result==1){
					Member dbResult = service.getMember(id);
					model.addAttribute("memberName", dbResult.getName());
					return "customer/client";
				}else{
					model.addAttribute("result", result);
					return "main";
				}			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println("ȸ�� �α��� ���: "+result);
			return "main";
			
		}
		
		@RequestMapping(value="empLogin")
		public String empLogin(Model model, String emp_id, String emp_pw){
			int result=-3;
			try {
				result = service.checkEmpLogin(emp_id, emp_pw);
				System.out.println("........"+result);
				if(result==1){ //�α��� ������
					Emp dbResult = service.getEmp(emp_id);
					model.addAttribute("EmpName", dbResult.getEmp_name());
					model.addAttribute("EmpDept", dbResult.getDept());
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
