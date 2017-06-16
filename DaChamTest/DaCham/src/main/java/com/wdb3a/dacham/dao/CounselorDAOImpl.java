package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Counselor;
@Repository
public class CounselorDAOImpl implements CounselorDAO {
	private static final String namespace="com.wdb3a.CounselorMapper";
	
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<Counselor> listAll(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".counselorList",counselor);
	}

	@Override
	public List<Counselor> listMaterial() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".deliverName");
	}

	@Override
	public void createCounselor(Counselor Counselor) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".createCounselor",Counselor);
	}

	@Override
	public List<Counselor> showCounselor(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".showCounselor",counselor);
	}
	public List<Counselor> counselorseList2(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".counselorseList2",counselor);
	}

	@Override
	public Counselor viewCounsel(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".viewCounsel",counselCode);
	}
}
