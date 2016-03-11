package org.zaytsev.control.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.zaytsev.control.dao.UserDao;
import org.zaytsev.control.models.User;

@Repository(value="userDatabaseDao")
public class UserDataBaseDao extends HibernateAbstractDao<User> implements UserDao {
	
public UserDataBaseDao() {
		
	}


@Override
public User getByUsername(String username) {
	Criteria criteria = getSession().createCriteria(User.class);
	criteria.add(Restrictions.eq("username", username));
			
			return (User)criteria.uniqueResult();
}

	
}
