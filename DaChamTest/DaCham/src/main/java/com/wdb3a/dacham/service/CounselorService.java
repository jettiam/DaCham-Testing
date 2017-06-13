package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Counselor;

public interface CounselorService {

	public List<Counselor> listAll(Counselor counselor) throws Exception;
	public List<Counselor> listMaterial()throws Exception;
	public void createCounselor(Counselor counselor)throws Exception;
	public List<Counselor> showCounselor(Counselor counselor)throws Exception;
}