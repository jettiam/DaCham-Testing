package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Emp;
import com.wdb3a.dacham.bean.Member;

public interface LoginDAO {
	public int checkLogin(String emp_id, Emp emp) throws Exception;
	
	//��ü ����Ʈ�� ������ ���ؼ� ����.
	public List<Emp> empListAll() throws Exception;
	
	//�Ϲ� ȸ����
	public Member getMember(String id) throws Exception;
	
	
	//�����ڿ�
	public Emp getEmp(String id) throws Exception;
	
	//�ߺ����̵� üũ��
	public int idCheck(String id) throws Exception;
	
	//����� �α��ν� ��ū ������Ʈ
	public void insertToken(Member member) throws Exception;
}
