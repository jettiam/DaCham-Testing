package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Counselor;
import com.wdb3a.dacham.bean.Criteria;



public interface CounselorDAO {
	public List<Counselor> counselorListAll() throws Exception;
	public List<Counselor> counselorseList2All() throws Exception;
	public List<Counselor> listAll(Counselor counselor) throws Exception;
	public List<Counselor> listMaterial() throws Exception;
	public void createCounselor(Counselor Counselor) throws Exception;
	public List<Counselor> showCounselor(Counselor counselor) throws Exception;
	public List<Counselor> counselorseList2(Counselor counselor) throws Exception;
	public Counselor viewCounsel(int counselCode) throws Exception;
	public List<Counselor> linkCounsel(String customer) throws Exception;
	public Counselor selectCounsel(int couselCode) throws Exception;
	public Counselor counselMember(int couselCode) throws Exception;
	public List<Counselor> orderList(int couselCode,Criteria criteria) throws Exception;
	public int orderListCount(int couselCode) throws Exception;
	public void counselUpdate(Counselor counselor) throws Exception;
}
