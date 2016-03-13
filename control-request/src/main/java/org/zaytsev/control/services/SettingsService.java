package org.zaytsev.control.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zaytsev.control.dao.DepartamentsDao;
import org.zaytsev.control.models.Departaments;

@Service(value="settingsService")
public class SettingsService {
	@Autowired
	@Qualifier(value="departamentsDataBaseDao")
	private DepartamentsDao departamentsDao;
	
	public SettingsService(){
		
	}
	
	@Transactional
	public List<Departaments> getAll(){
		return departamentsDao.getAll();
	}

}
