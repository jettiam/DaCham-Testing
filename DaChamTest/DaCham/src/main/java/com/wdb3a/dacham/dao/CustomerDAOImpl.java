package com.wdb3a.dacham.dao;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.wdb3a.dacham.bean.Customer;
import com.wdb3a.dacham.bean.Measure;

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
	public List<Customer> sideDDetail(Customer customer) throws Exception {
		// TODO Auto-generated method stub		
		
		return sqlSession.selectList(namespace+".sideDDetail",customer);

	}

	@Override
	public void orderRegist(Customer customer) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.selectList(namespace+".orderRegist",customer);
	}

	@Override
	public void cartRegist(Customer customer) throws Exception {
		sqlSession.selectList(namespace+".cartRegist",customer);
		
	}

	@Override

	public List<Customer> myOrderList(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".myOrderList",id);
	}
@Override
	public void orderCart(Customer customer) throws Exception {		
		sqlSession.update(namespace+".orderCart" ,customer);

	}

@Override
public int recentlyOrderCode(String id) throws Exception {
	// �ֱ��� �ֹ� ��ȣ ������
	return sqlSession.selectOne(namespace+".recentlyOrderCode", id);
}

@Override
public void orderOptionRegist(HashMap options) throws Exception {
	// TODO Auto-generated method stub
	sqlSession.insert(namespace+".registOrderOption", options);
}

@Override
public List<Customer> orderOption(int orderCode) throws Exception {
	return sqlSession.selectList(namespace+".orderOption", orderCode);
}

@Override
public int getOneDCode(HashMap rInfo) throws Exception {
	return sqlSession.selectOne(namespace+".getOneDCode", rInfo);
}

@Override
public List<Customer> myNutri(String id) throws Exception {
	// TODO Auto-generated method stub
	return sqlSession.selectList(namespace+".myNutri",id);
}

@Override
public int insertMeasure(Measure measure) throws Exception {
	int check = sqlSession.selectOne(namespace+".measureCheck",measure);
	System.out.println("�ǰ��Է� �ߺ�Ȯ��"+check);
	if(check==0){
		sqlSession.insert(namespace+".insertMeasure", measure);
		//0����
		return check;
	}else{
		//1 ����
		return 1;
	}	
	
}

@Override
public List<Measure> measureRead(String id) throws Exception {
	// TODO Auto-generated method stub
	return sqlSession.selectList(namespace+".measureRead", id);
}

@Override
public List<Customer> menuShow(int diseaseCode) throws Exception {
	// TODO Auto-generated method stub
	return sqlSession.selectList(namespace+".menuShow", diseaseCode);
}

@Override
public void recentlyAddress(Customer customer) throws Exception {
	sqlSession.update(namespace+".recentlyAddress", customer);
	
}


}
