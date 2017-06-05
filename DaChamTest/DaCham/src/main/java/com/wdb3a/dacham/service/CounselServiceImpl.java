package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Counsel;
import com.wdb3a.dacham.dao.CounselDAO;
@Service
public class CounselServiceImpl implements CounselService {
@Inject
private CounselDAO dao;
	@Override
	public List<Counsel> counselList() throws Exception {
		// TODO Auto-generated method stub
		return dao.counselList();
	}
	@Override
	public void write(Counsel counsel) throws Exception {
		// TODO Auto-generated method stub
		dao.write(counsel);
	}

}
