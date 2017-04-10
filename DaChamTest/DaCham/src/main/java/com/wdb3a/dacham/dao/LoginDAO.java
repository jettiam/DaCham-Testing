package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Emp;

public interface LoginDAO {
	public int checkLogin(String emp_id, Emp emp) throws Exception;
	
	//전체 리스트를 빼보기 위해서 설정.
	public List<Emp> empListAll() throws Exception;
	public Emp getEmp(String id) throws Exception;
}
