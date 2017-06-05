package com.wdb3a.dacham.dao;

import java.util.List;

import com.wdb3a.dacham.bean.Counsel;

public interface CounselDAO {
public List<Counsel> counselList() throws Exception;
<<<<<<< HEAD
public void write(Counsel counsel) throws Exception; 
=======
public Counsel couselRead(int counselCode) throws Exception;
>>>>>>> branch 'master' of https://github.com/jettiam/DaCham-Testing.git
}
