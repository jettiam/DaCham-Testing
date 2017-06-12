package com.wdb3a.dacham.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wdb3a.dacham.bean.Counsel;
@Repository
public class CounselDAOImpl implements CounselDAO {
	private static final String namespace="com.wdb3a.CounselMapper";
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<Counsel> counselList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".counselList");
	}
	@Override

	public void write(Counsel counsel) throws Exception {
		// TODO Auto-generated method stub
		 sqlSession.insert(namespace+".write",counsel);
	}

	public Counsel couselRead(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".counselRead",counselCode);
	}
	@Override
	public void delete(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".delete",counselCode);
	}
	@Override
	public void update(Counsel counsel) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".update",counsel);
		
	}	


}
