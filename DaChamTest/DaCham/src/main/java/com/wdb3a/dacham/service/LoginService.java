package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Emp;

public interface LoginService {
	public List<Emp> empListAll() throws Exception;
	
	public int checkEmpLogin(String id, String pw) throws Exception;
	public Emp getEmp(String id) throws Exception;
}
