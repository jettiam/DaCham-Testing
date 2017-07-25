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

	@Override
	public List<Counselor> linkCounsel() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".linkCounsel");
	}

	@Override
	public Counselor selectCounsel(int couselCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectCounsel",couselCode);
	}

	@Override
	public Counselor counselMember(int couselCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".counselMember",couselCode);
	}

	@Override
	public List<Counselor> orderList(int couselCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderList",couselCode);
	}

	@Override
	public void counselUpdate(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".counselUpdate",counselor);
	}
}
