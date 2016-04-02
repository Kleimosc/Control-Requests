package org.zaytsev.control.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zaytsev.control.dao.UserDao;
import org.zaytsev.control.dao.VerificationTokenDao;
import org.zaytsev.control.models.User;
import org.zaytsev.control.models.VerificationToken;

@Service(value="registrationtService")
public class RegistrationService {

	@Autowired
	@Qualifier("userDatabaseDao")
	UserDao userDao;
	
	@Autowired
	@Qualifier("verificationTokenDatabaseDao")
	VerificationTokenDao verificationTokenDao;
	
	
	
	public RegistrationService(){
		
	}
	
	@Transactional
	public void saveUser(User user){
		userDao.add(user);
	}
	
	@Transactional
	public void deleteUser(User user){
		userDao.update(user);
	}
	
	@Transactional
	public void saveToken(VerificationToken verificationToken){
		verificationTokenDao.add(verificationToken);
	}
	
	@Transactional
	public void activationUser(String token){
		verificationTokenDao.activationUser(token);;
	}
}
