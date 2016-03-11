package org.zaytsev.control.dao;

import java.util.List;

import org.zaytsev.control.models.Model;

public interface ItemDao <T extends Model>{
	
	public List<T> getAll();
	
	public T getById(Long id);
	
	public void add(T model);
	
	public void update(T model);
	
	public void remove(T model);
	

	
	

}
