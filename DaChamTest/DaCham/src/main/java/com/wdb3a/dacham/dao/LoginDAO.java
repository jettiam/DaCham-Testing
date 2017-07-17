package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Emp;
import com.wdb3a.dacham.bean.Member;

public interface LoginDAO {
	public int checkLogin(String emp_id, Emp emp) throws Exception;
	
	//전체 리스트를 빼보기 위해서 설정.
	public List<Emp> empListAll() throws Exception;
	
	//일반 회원용
	public Member getMember(String id) throws Exception;
	
	
	//관리자용
	public Emp getEmp(String id) throws Exception;
	
	//중복아이디 체크용
	public int idCheck(String id) throws Exception;
	
	//모바일 로그인시 토큰 업데이트
	public void insertToken(Member member) throws Exception;
}
