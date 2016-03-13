package org.zaytsev.control.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zaytsev.control.dao.RequestDao;
import org.zaytsev.control.dao.StatusDao;
import org.zaytsev.control.models.Request;
import org.zaytsev.control.models.Status;

@Service(value="requestService")
public class RequestService {
	
	@Autowired
	@Qualifier("requestDatabaseDao")
	RequestDao requestDao;
	
	@Autowired
	@Qualifier("statusDatabaseDao")
	StatusDao statusDao;
	
	public RequestService() {
		
	}
	
	@Transactional
	public void save(Request request){
		requestDao.add(request);
	}
	
	@Transactional
	public void update(Request request){
		requestDao.update(request);
	}
	
	
	@Transactional
	public	List<Request> getAll(){
		return requestDao.getAll();
	}
	
	@Transactional
	public	List<Request> getListCreate(){
		return requestDao.getListCreate();
	}
	
	@Transactional
	public	List<Request> getListProcessing(){
		return requestDao.getListProcessing();
	}
	
	@Transactional
	public	List<Request> getListClosed(){
		return requestDao.getListClosed();
	}
	
	
	@Transactional
	public void deleteId(Long id){
		Request request = requestDao.getById(id);
		requestDao.remove(request);
	}
	
	@Transactional
	public List<Status> getAllStatus() {
		return statusDao.getAll();
	}
	
	@Transactional
	public Request getById(Long id) {
		return requestDao.getById(id);
	}

	
}
