package org.zaytsev.control.dao;

import org.zaytsev.control.models.Departaments;

public interface DepartamentsDao extends ItemDao<Departaments> {


	void updateUserDep(Departaments departaments);

}
