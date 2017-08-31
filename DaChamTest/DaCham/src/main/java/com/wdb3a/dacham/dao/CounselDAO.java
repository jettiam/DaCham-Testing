package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Counsel;
import com.wdb3a.dacham.bean.Criteria;

public interface CounselDAO {
public List<Counsel> counselList(Criteria criteria) throws Exception;

public void write(Counsel counsel) throws Exception; 

public Counsel couselRead(int counselCode) throws Exception;

public void delete(int counselCode) throws Exception;

public void update(Counsel counsel) throws Exception;

public int couselListAll() throws Exception;
}
