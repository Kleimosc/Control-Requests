package org.zaytsev.control.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zaytsev.control.dao.UserDao;
import org.zaytsev.control.models.User;

@Service(value="userService")
public class UserService implements UserDetailsService {
	
	@Autowired
	@Qualifier(value="userDatabaseDao")
	private UserDao userDao;
	
	public UserService() {
		
	}
	@Transactional
	public void saveUser(User user){
		userDao.add(user);
	}
	
	@Transactional
	public List<User> getAll(){
		return userDao.getAll();
		
	}
	
	
	@Transactional
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		User user = userDao.getByUsername(username);
		
		System.err.println(user);
		if(user == null){
			throw new UsernameNotFoundException("User with Username: " + username + " not found");
			
		}
		return user;
	}

}
