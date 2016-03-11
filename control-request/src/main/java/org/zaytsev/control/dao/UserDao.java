package org.zaytsev.control.dao;

import org.zaytsev.control.models.User;

public interface UserDao extends ItemDao<User> {
	
	public User getByUsername(String username);

}
