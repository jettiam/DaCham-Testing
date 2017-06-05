package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Counsel;

public interface CounselDAO {
public List<Counsel> counselList() throws Exception;
public Counsel couselRead(int counselCode) throws Exception;
}
