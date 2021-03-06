package com.wdb3a.dacham;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		@ResponseBody
		@RequestMapping(value="mLogin",method=RequestMethod.GET)
		public void mLogin(HttpServletRequest req, HttpServletResponse res, HttpSession session,Model model) throws Exception{
			req.setCharacterEncoding("utf-8");
			String callback = req.getParameter("callback");
			String id = req.getParameter("id");
			System.out.println(id);
			String pw = req.getParameter("passwd");	
			System.out.println(pw);
			int result = -3;
			try {
				result = service.checkMemberLogin(id, pw);
				if(result == 1){
					Member dbResult = service.getMember(id);
					session.setAttribute("memberName", dbResult.getName());
					session.setAttribute("customerId", dbResult.getId());
					session.setAttribute("passwd", dbResult.getPasswd());
					session.setAttribute("address", dbResult.getAddress());
					session.setAttribute("recentlyAddress", dbResult.getRecentlyAddress());
					session.setAttribute("tel", dbResult.getTel());
					session.setAttribute("email", dbResult.getEmail());
					session.setAttribute("joinDate", dbResult.getJoinDate());
					session.setAttribute("gradeCode", dbResult.getGradeCode());
					session.setAttribute("deptCode", dbResult.getDeptCode());					
				}else if(result == 3 ){
					Member dbResult = service.getMember(id);
					session.setAttribute("memberName", dbResult.getName());
					session.setAttribute("customerId", dbResult.getId());
					session.setAttribute("passwd", dbResult.getPasswd());
					session.setAttribute("recentlyAddress", dbResult.getRecentlyAddress());
					session.setAttribute("address", dbResult.getAddress());
					session.setAttribute("tel", dbResult.getTel());
					session.setAttribute("email", dbResult.getEmail());
					session.setAttribute("joinDate", dbResult.getJoinDate());
					session.setAttribute("gradeCode", dbResult.getGradeCode());
					session.setAttribute("deptCode", dbResult.getDeptCode());	
				}
			} catch (Exception e) {								
				e.printStackTrace();
				
			}
			res.setContentType("text/html;charset=UTF-8");
	         PrintWriter out = res.getWriter();
	         out.write(callback+"(" + result + ")");
		}
		
		@ResponseBody
		@RequestMapping(value="insertToken")
		public void insertToken(Member member,HttpServletRequest req, HttpServletResponse res) throws Exception{
			req.setCharacterEncoding("utf-8");
			String callback = req.getParameter("callback");
			int result=0;
			String id = req.getParameter("id");
			System.out.println("토큰아이디:"+member.getId());
			String token = req.getParameter("token");	
			System.out.println("토큰:"+member.getToken());
			
			service.insertToken(member);
			
			res.setContentType("text/html;charset=UTF-8");
	         PrintWriter out = res.getWriter();
	         out.write(callback+"(" + result + ")");
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
					session.setAttribute("recentlyAddress", dbResult.getRecentlyAddress());
					session.setAttribute("address", dbResult.getAddress());
					session.setAttribute("tel", dbResult.getTel());
					session.setAttribute("email", dbResult.getEmail());
					session.setAttribute("joinDate", dbResult.getJoinDate());
					session.setAttribute("gradeCode", dbResult.getGradeCode());
					session.setAttribute("deptCode",dbResult.getDeptCode());
					model.addAttribute("result", result);					
					return "main";
				}else if(result==3){
					Member dbResult = service.getMember(id);
					session.setAttribute("deptCode", dbResult.getDeptCode());
					session.setAttribute("memberName", dbResult.getName());
					session.setAttribute("customerId", dbResult.getId());
					return "mate/wholesaler";
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
		@RequestMapping(value="memberLogout")
		public String memberLogout(HttpSession session){ //로그아웃
			session.invalidate();
			return "main";			
		}
		@RequestMapping(value="mLogout")
		public void mLogout(HttpServletRequest req, HttpServletResponse res,HttpSession session) throws Exception{ //로그아웃
			req.setCharacterEncoding("utf-8");
			String callback = req.getParameter("callback");
			session.invalidate();
			int result=1;
			res.setContentType("text/html;charset=UTF-8");
	         PrintWriter out = res.getWriter();
	         out.write(callback+"(" + result + ")");			
		}
		
		@RequestMapping(value="empLogin")
		public String empLogin(Model model, String emp_id, String emp_pw,HttpSession session){
			int result=-3;
			try {
				result = service.checkEmpLogin(emp_id, emp_pw);
				System.out.println("........"+result);
				if(result==1){ //로그인 성공시
					Emp dbResult = service.getEmp(emp_id);

					session.setAttribute("EmpName", dbResult.getName());
					session.setAttribute("EmpDept", dbResult.getDeptCode());
					session.setAttribute("EmpGrade", dbResult.getGradeCode());
					session.setAttribute("deptCode", dbResult.getDeptCode());
					model.addAttribute("result",dbResult);
					
					if(dbResult.getDeptCode().equals("영양사")){
						return "/mate/nutritionist/nutritionistMain";
					}
					else if(dbResult.getDeptCode().equals("조리팀")){
						return "/mate/cooker/cookerMain";
					}
					else if(dbResult.getDeptCode().equals("관리자")){
						return "/mate/admin/adminMain";
					}
					else if(dbResult.getDeptCode().equals("배송팀")){
						return "/mate/deliver/deliverMain";
					}
					else if(dbResult.getDeptCode().equals("고객대응팀")){
						return "/mate/counselor/counselorMain";
					}else if(dbResult.getDeptCode().equals("도매상")){
						return "/mate/wholesaler";
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
		@RequestMapping(value="empLogout",method = RequestMethod.GET)
		public String empLogout(HttpSession session){
			session.invalidate();
			return "main2";			
		}
		
		@RequestMapping(value="join",method = RequestMethod.GET)
		public String join(){
			return "customer/join";
		}
		
		@ResponseBody
		@RequestMapping(value = "idCheck/{id}", method = RequestMethod.GET)
		public ResponseEntity<Map<String, Object>> idCheck(@PathVariable("id") String id)throws Exception{
			ResponseEntity<Map<String, Object>> entity = null;
			System.out.println(id);
			
			try {
				int idCheck = service.idCheck(id);
				Map<String, Object> map = new HashMap<>();
				map.put("idCheck",idCheck);
				entity = new ResponseEntity<>(map, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;			
		}
		
		@RequestMapping(value="join",method = RequestMethod.POST)
		public String joinPost(Member member){
			try {
				service.join(member);
				return "main";
			} catch (Exception e) {				
				e.printStackTrace();
				return "customer/join";
			}			
		}
		
}
