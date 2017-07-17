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
				return 1; //�α��� ����.
			}else{
				return 0; // ���̵� ������ ��й�ȣ Ʋ��
			}
		}else{
			return -1; // ���̵� ����
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
				return result; //�α��� ����.
			}else{
				result=0;
				return result; //��й�ȣ Ʋ��.
			}
		}else{
			result=-1;
			return result;//���̵� ����.
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
