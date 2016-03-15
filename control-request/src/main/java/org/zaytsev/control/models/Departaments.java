package org.zaytsev.control.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="departaments")
public class Departaments extends Model{

	
	private static final long serialVersionUID = 3222179099886197364L;

	@Column(name="title", length=20)
	private String title;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@OneToMany(mappedBy="departaments", cascade = {CascadeType.PERSIST,CascadeType.REFRESH, CascadeType.MERGE})
	private Set<User> users = new HashSet<>();
	
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	
	@Override
	public String toString() {
		return title;
	}
	public Departaments(){
		super();
	}
	public Departaments(Long id){
		super(id);
	}
	
}
