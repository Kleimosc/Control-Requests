package org.zaytsev.control.dao.impl;

import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.zaytsev.control.dao.DepartamentsDao;
import org.zaytsev.control.dao.UserDao;
import org.zaytsev.control.models.Departaments;
import org.zaytsev.control.models.User;

@Repository(value="departamentsDataBaseDao")
public class DepartamentsDataBaseDao extends HibernateAbstractDao<Departaments> implements DepartamentsDao  {
	@Autowired
	@Qualifier(value="userDatabaseDao")
	private UserDao userDao;
	
	/**public void updateUserDep(Long id){
		
		
		String sql = String.format("UPDATE `user` SET `fk_departaments_id`=null WHERE `fk_departaments_id`='%s';", id);
		getSession().createSQLQuery(sql).executeUpdate();
	}
	*/
	
	
	public Departaments getByNsme(String title) {
		Criteria criteria = getSession().createCriteria(Departaments.class);
		criteria.add(Restrictions.eq("title", title));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return (Departaments)criteria.uniqueResult();
	}
	
	
	
	@SuppressWarnings("unchecked")
	public void updateUserDep(Departaments departaments){
		
		Criteria criteria = getSession().createCriteria(User.class);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		criteria.add(Restrictions.eq("departaments", departaments));
		List<User> users = criteria.list();
		System.err.println(users);
		Departaments dep = getByNsme("None");
		for (User user : users) {
			user.setDepartaments(dep);
			userDao.update(user);
		}
		
	}
	
	public DepartamentsDataBaseDao(){
		
	}
	
}
