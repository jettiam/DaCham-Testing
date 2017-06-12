package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Counselor;



public interface CounselorDAO {
	public List<Counselor> listAll(Counselor counselor) throws Exception;
	public List<Counselor> listMaterial() throws Exception;
	public void createCounselor(Counselor Counselor) throws Exception;
	public List<Counselor> showCounselor(Counselor counselor) throws Exception;
}
