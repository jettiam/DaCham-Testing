package com.wdb3a.dacham.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wdb3a.dacham.bean.Counsel;
import com.wdb3a.dacham.bean.Criteria;
import com.wdb3a.dacham.dao.CounselDAO;
@Service
public class CounselServiceImpl implements CounselService {
@Inject
private CounselDAO dao;
	@Override
	public List<Counsel> counselList(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.counselList(criteria);
	}
	@Override

	public void write(Counsel counsel) throws Exception {
		// TODO Auto-generated method stub
		dao.write(counsel);
	}
	public Counsel couselRead(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.couselRead(counselCode);

	}
	@Override
	public void delete(int counselCode) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(counselCode);
	}
	@Override
	public void update(Counsel counsel) throws Exception {
		dao.update(counsel);
		
	}
	@Override
	public int couselListAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.couselListAll();
	}
    
}
