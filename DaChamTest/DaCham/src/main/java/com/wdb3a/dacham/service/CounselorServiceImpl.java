package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Counselor;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.dao.CounselorDAO;
@Service
public class CounselorServiceImpl implements CounselorService {
	@Inject
	private CounselorDAO dao;
	@Override
	public List<Counselor> listAll(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll(counselor);
	}

	@Override
	public List<Counselor> listMaterial() throws Exception {
		// TODO Auto-generated method stub
		return dao.listMaterial();
	}

	@Override
	public void createCounselor(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		dao.createCounselor(counselor);

	}

	@Override
	public List<Counselor> showCounselor(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		return dao.showCounselor(counselor);
	}
	@Override
	public List<Counselor> counselorseList2(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		return dao.counselorseList2(counselor);
	}

	@Override
	public Counselor viewCounsel(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.viewCounsel(counselCode);
	}

	@Override
	public List<Counselor> linkCounsel(String customer) throws Exception {
		// TODO Auto-generated method stub
		return dao.linkCounsel(customer);
	}

	@Override
	public Counselor selectCounsel(int couselCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCounsel(couselCode);
	}

	@Override
	public Counselor counselMember(int couselCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.counselMember(couselCode);
	}

	@Override
	public List<Counselor> orderList(int couselCode,Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList(couselCode,criteria);
	}

	@Override
	public void counselUpdate(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		dao.counselUpdate(counselor);
	}

	@Override
	public List<Counselor> counselorListAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.counselorListAll();
	}

	@Override
	public List<Counselor> counselorseList2All() throws Exception {
		// TODO Auto-generated method stub
		return dao.counselorseList2All();
	}

	@Override
	public int orderListCount(int couselCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderListCount(couselCode);
	}

	@Override
	public void counselInsert(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		dao.counselInsert(counselor);
	}

	@Override
	public List<Counselor> orderListSearch(Counselor counselor) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderListSearch(counselor);
	}
}