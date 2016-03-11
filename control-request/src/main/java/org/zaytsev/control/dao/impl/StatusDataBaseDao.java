package org.zaytsev.control.dao.impl;

import org.springframework.stereotype.Repository;
import org.zaytsev.control.dao.StatusDao;
import org.zaytsev.control.models.Status;

@Repository(value="statusDatabaseDao")
public class StatusDataBaseDao extends HibernateAbstractDao<Status> implements StatusDao {

	public StatusDataBaseDao(){
		
	}
	
}
