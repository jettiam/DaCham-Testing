package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Emp;

@Repository
public class LoginDAOImpl implements LoginDAO {

	private static final String namespace="com.wdb3a.LoginMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	
	@Override
	public int checkLogin(String emp_id, Emp emp) throws Exception {
		emp=sqlSession.selectOne(namespace+".emp", emp_id);
		if(emp!=null){
				}
		return 0;
	}



	@Override
	public List<Emp> empListAll() throws Exception {
		// emp 테이블의 모든 내용을 빼본다.
		return sqlSession.selectList(namespace+".select_emp");
	}



	@Override
	public Emp getEmp(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectEmp", id);
	}



	

}
