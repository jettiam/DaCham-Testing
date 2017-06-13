package com.wdb3a.dacham.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.wdb3a.dacham.bean.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	private static final String namespace="com.wdb3a.CustomerMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<Customer> dietList(int diseaseCode) throws Exception {		
		return sqlSession.selectList(namespace+".dietList",diseaseCode);
	}

	@Override

	public List<Customer> cartList(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".cartList",id);}

	public List<Customer> detailOrder(int dietCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".detailOrder",dietCode);
	}


	@Override
	public List<Customer> sideDDetail(String foodGCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".sideDDetail",foodGCode);

	}

}
