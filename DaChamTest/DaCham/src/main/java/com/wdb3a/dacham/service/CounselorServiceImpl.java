package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Counselor;
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
}