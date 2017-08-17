package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Emp;
import com.wdb3a.dacham.bean.Member;

public interface LoginService {
	
	public Member getMember(String id) throws Exception;
	public int checkMemberLogin(String id, String passwd) throws Exception;
	
	
	public List<Emp> empListAll() throws Exception;
	public int checkEmpLogin(String id, String pw) throws Exception;
	public Emp getEmp(String id) throws Exception;
	public int idCheck(String id) throws Exception;
	public void insertToken(Member member) throws Exception;
	public void join(Member member) throws Exception ;
}
