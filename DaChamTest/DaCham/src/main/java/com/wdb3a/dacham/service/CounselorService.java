package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Counselor;

public interface CounselorService {

	public List<Counselor> listAll(Counselor counselor) throws Exception;
	public List<Counselor> listMaterial()throws Exception;
	public void createCounselor(Counselor counselor)throws Exception;
	public List<Counselor> showCounselor(Counselor counselor)throws Exception;
	public List<Counselor> counselorseList2(Counselor counselor)throws Exception;
	public Counselor viewCounsel(int counselCode) throws Exception;
	public List<Counselor> linkCounsel() throws Exception;
	public Counselor selectCounsel(int couselCode) throws Exception;
	public Counselor counselMember(int couselCode) throws Exception;
	public List<Counselor> orderList(int couselCode) throws Exception;
	public void counselUpdate(Counselor counselor) throws Exception;
}
