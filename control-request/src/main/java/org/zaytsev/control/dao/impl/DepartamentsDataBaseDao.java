package org.zaytsev.control.dao.impl;

import org.springframework.stereotype.Repository;
import org.zaytsev.control.dao.DepartamentsDao;
import org.zaytsev.control.models.Departaments;

@Repository(value="departamentsDataBaseDao")
public class DepartamentsDataBaseDao extends HibernateAbstractDao<Departaments> implements DepartamentsDao  {
	
	
	
	public DepartamentsDataBaseDao(){
		
	}
	
}
