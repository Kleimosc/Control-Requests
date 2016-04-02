package org.zaytsev.control.dao;

import java.util.List;

import org.zaytsev.control.models.Request;

public interface RequestDao extends ItemDao<Request> {

	public List<Request> getListCreate();
	public List<Request> getListProcessing();
	public List<Request> getListClosed();
	public List<Request> getListNameCreate();
	public List<Request> getListNameProcessing();
	public List<Request> getListNameClosed();
}
