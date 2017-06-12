package com.wdb3a.dacham.service;

import java.util.List;

import com.wdb3a.dacham.bean.Counsel;

public interface CounselService {
	public List<Counsel> counselList() throws Exception;

	public void write(Counsel counsel) throws Exception; 

	public Counsel couselRead(int counselCode) throws Exception;
    
	public void delete(int counselCode) throws Exception;
}
