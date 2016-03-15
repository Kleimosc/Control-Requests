package org.zaytsev.control.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zaytsev.control.dao.DepartamentsDao;
import org.zaytsev.control.dao.UserDao;
import org.zaytsev.control.models.Departaments;
import org.zaytsev.control.models.User;

@Service(value="settingsService")
public class SettingsService {
	@Autowired
	@Qualifier(value="departamentsDataBaseDao")
	private DepartamentsDao departamentsDao;
	
	@Autowired
	@Qualifier(value="userDatabaseDao")
	private UserDao userDao;
	
		
	public SettingsService(){
		
	}
	
	@Transactional
	public void updateUser(User user){
		userDao.update(user);
	}
	
	
	@Transactional
	public Departaments depGetById(Long id){
		return departamentsDao.getById(id);
	}
	
	@Transactional
	public void depAdd(Departaments departaments){
		departamentsDao.add(departaments);
	}
	
	@Transactional
	public void depDelete(Departaments departaments){
		departamentsDao.remove(departaments);
	}	
	
	@Transactional
	public void updateUserDep(Departaments departaments){
		departamentsDao.updateUserDep(departaments);
	}
	
	
	@Transactional
	public List<Departaments> getAll(){
		return departamentsDao.getAll();
	}
	
	@Transactional
	public User getByUser(Long id){
		return userDao.getById(id);
	}
	

}
