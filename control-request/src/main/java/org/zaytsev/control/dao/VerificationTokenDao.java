package org.zaytsev.control.dao;

import org.zaytsev.control.models.User;
import org.zaytsev.control.models.VerificationToken;

public interface VerificationTokenDao extends ItemDao<VerificationToken> {
	
	public void removeToken(User user);
	public void activationUser(String token);

}
