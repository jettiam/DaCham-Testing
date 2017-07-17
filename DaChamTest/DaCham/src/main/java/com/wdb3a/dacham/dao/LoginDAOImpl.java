package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Emp;
import com.wdb3a.dacham.bean.Member;

@Repository
public class LoginDAOImpl implements LoginDAO {

	private static final String namespace="com.wdb3a.LoginMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	
	@Override
	public int checkLogin(String emp_id, Emp emp) throws Exception {
		emp=sqlSession.selectOne(namespace+".emp", emp_id);
		return 0;
	}

	@Override
	public Member getMember(String id) throws Exception {
		// id를 통해 멤버 *을 불러옴
		return sqlSession.selectOne(namespace+".selectMember", id);
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

	@Override
	public int idCheck(String id) throws Exception {
		// TODO Auto-generated method stub		
		int idCheck=0;
		String idConfirm =sqlSession.selectOne(namespace+".idChecked",id)+"";
		System.out.println("아이디"+idConfirm);
		//member.setId(sqlSession.selectOne(namespace+".idCheck",id));
		//idCheck 1이면 중복, 0이면 중복아님)
		if(idConfirm.equals("null")){
			idCheck=0;
		}else{
			idCheck=1;
		}
		return idCheck;
	}

	@Override
	public void insertToken(Member member) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".insertToken",member);
	}

	@Override
	public void join(Member member) throws Exception {
		sqlSession.update(namespace+".join",member);
		
	}



	



	

}
