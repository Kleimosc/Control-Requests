package org.zaytsev.control.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="status")
public class Status extends Model{

	private static final long serialVersionUID = 5262145499028106164L;
	
	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name="title", length=25, insertable=false, updatable=false)
	private StatusList title;
	
	@OneToMany(mappedBy="status", cascade=CascadeType.ALL, orphanRemoval= true)
	private Set<Request> request = new HashSet<>();

	@Override
	public String toString() {
		return title.toString();
	}
	
	
	public StatusList getTitle() {
		return title;
	}


	public void setTitle(StatusList title) {
		this.title = title;
	}


	public Set<Request> getRequest() {
		return request;
	}


	public void setRequest(Set<Request> request) {
		this.request = request;
	}


	public Status(){
		super();
	}
	
	public Status(Long id){
		super(id);
	}
	
}
