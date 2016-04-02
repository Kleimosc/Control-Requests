package org.zaytsev.control.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.zaytsev.control.dao.UserDao;
import org.zaytsev.control.dao.VerificationTokenDao;
import org.zaytsev.control.models.User;
import org.zaytsev.control.models.VerificationToken;

@Repository(value="verificationTokenDatabaseDao")
public class VerificationTokenDatabaseDao extends HibernateAbstractDao<VerificationToken> implements VerificationTokenDao {
	@Autowired
	@Qualifier("userDatabaseDao")
	UserDao userDao;
	public VerificationTokenDatabaseDao(){
		
	}

	@Override
	public void removeToken(User user) {
		Criteria criteria = getSession().createCriteria(VerificationToken.class);
		criteria.add(Restrictions.eq("user", user));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		VerificationToken verificationToken = (VerificationToken)criteria.uniqueResult();
		remove(verificationToken);
	}

	@Override
	public void activationUser(String token) {
		Criteria criteria = getSession().createCriteria(VerificationToken.class);
		criteria.add(Restrictions.eq("token", token));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		VerificationToken verificationToken = (VerificationToken)criteria.uniqueResult();
		User user = verificationToken.getUser();
		user.setActivated(true);
		userDao.update(user);
	}
	
}
