package org.zaytsev.control.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zaytsev.control.dao.RoleDao;
import org.zaytsev.control.models.Role;

@Service(value="roleService")
public class RoleService {

	@Autowired
	@Qualifier(value="roleDatabaseDao")
	private RoleDao roleDao;
	
	public RoleService(){
		
	}
	
	@Transactional
	public Role getUserRole(){
		return roleDao.getById((long)2);
	}
	
}
