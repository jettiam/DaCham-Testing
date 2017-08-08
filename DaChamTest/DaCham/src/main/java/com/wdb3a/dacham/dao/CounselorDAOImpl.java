package com.wdb3a.dacham.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Counselor;
import com.wdb3a.dacham.bean.Criteria;
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
	public List<Counselor> linkCounsel(String customer) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".linkCounsel",customer);
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
	public List<Counselor> orderList(int couselCode,Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<>();
		map.put("couselCode", couselCode);
		map.put("criteria", criteria);
		return sqlSession.selectList(namespace+".orderList",map);
	}

	@Override
	public void counselUpdate(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".counselUpdate",counselor);
	}

	@Override
	public List<Counselor> counselorListAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".counselorListAll");
	}

	@Override
	public List<Counselor> counselorseList2All() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".counselorseList2All");
	}

	@Override
	public int orderListCount(int couselCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".orderListCount",couselCode);
	}

	@Override
	public void counselInsert(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".counselInsert",counselor);
	}

	@Override
	public List<Counselor> orderListSearch(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".orderListSearch",counselor);
	}

	@Override
	public List<Counselor> finCounselList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".finCounselList");
	}

	@Override
	public List<Counselor> optionTuning(int orderCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".optionTuning",orderCode);
	}

	@Override
	public List<Counselor> listAll(int counselItemCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listAll",counselItemCode);
	}

	@Override
	public List<Counselor> linkCounsel2(String customer) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".linkCounsel2",customer);
	}
}
