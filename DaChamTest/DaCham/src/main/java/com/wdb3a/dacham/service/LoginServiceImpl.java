package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Emp;
import com.wdb3a.dacham.bean.Member;
import com.wdb3a.dacham.dao.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {
	@Inject
	private LoginDAO dao;
	
	@Override
	public int checkMemberLogin(String id, String pw) throws Exception {
		Member dbResult = dao.getMember(id);
		if(dbResult != null){
			if(pw.equals(dbResult.getPasswd())){
				return 1; //로그인 성공.
			}else{
				return 0; // 아이디 있으나 비밀번호 틀림
			}
		}else{
			return -1; // 아이디 없음
		}
	}
	
	@Override
	public Member getMember(String id) throws Exception {
		return dao.getMember(id);
	}

	
	
	
	
	
	
	@Override
	public List<Emp> empListAll() throws Exception {
		return dao.empListAll();
	}

	@Override
	public int checkEmpLogin(String id, String pw) throws Exception {	
		Emp dbResult = dao.getEmp(id);
		int result;
		if(dbResult!=null){
			if(pw.equals(dbResult.getPasswd())){
				result=1;
				return result; //로그인 성공.
			}else{
				result=0;
				return result; //비밀번호 틀림.
			}
		}else{
			result=-1;
			return result;//아이디 없음.
		}
	}

	@Override
	public Emp getEmp(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getEmp(id);
	}

	@Override
	public int idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(id);
	}

	@Override
	public void insertToken(Member member) throws Exception {
		// TODO Auto-generated method stub
		dao.insertToken(member);
	}

	

}
