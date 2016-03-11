package org.zaytsev.control.dao.impl;

import org.springframework.stereotype.Repository;
import org.zaytsev.control.dao.RoleDao;
import org.zaytsev.control.models.Role;

@Repository(value="roleDatabaseDao")
public class RoleDataBaseDao extends HibernateAbstractDao<Role> implements RoleDao {
	
	public RoleDataBaseDao(){
		
	}

}
