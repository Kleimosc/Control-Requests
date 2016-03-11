package org.zaytsev.control.dao.impl;

import java.util.Collections;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import org.zaytsev.control.dao.RequestDao;
import org.zaytsev.control.models.Request;
import org.zaytsev.control.models.Status;


@Repository(value="requestDatabaseDao")
public class RequestDataBaseDao extends HibernateAbstractDao<Request> implements RequestDao{
	@Autowired
	@Qualifier("statusDatabaseDao")
	private StatusDataBaseDao statusDatabaseDao; 
	
	public RequestDataBaseDao(){
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Request> getListCreate() {
		
		Status status = statusDatabaseDao.getById((long)1);
		Criteria criteria = getSession().createCriteria(Request.class);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		criteria.add(Restrictions.eq("status", status));
		List<Request> listCreate = criteria.list();	
		Collections.reverse(listCreate);
			return listCreate;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Request> getListProcessing() {
		Status status = statusDatabaseDao.getById((long)2);
		Criteria criteria = getSession().createCriteria(Request.class);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		criteria.add(Restrictions.eq("status", status));
		List<Request> listCreate = criteria.list();	
		Collections.reverse(listCreate);
			return listCreate;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Request> getListClosed() {
		Status status = statusDatabaseDao.getById((long)3);
		Criteria criteria = getSession().createCriteria(Request.class);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		criteria.add(Restrictions.eq("status", status));
		List<Request> listCreate = criteria.list();	
		Collections.reverse(listCreate);
			return listCreate;
	}
	


}
