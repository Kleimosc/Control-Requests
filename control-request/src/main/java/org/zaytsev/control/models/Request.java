package org.zaytsev.control.models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "request")
public class Request extends Model {

	
	private static final long serialVersionUID = 3399409689257263747L;
	
	
	@Column(name="title", length=50)
	private String title;
	
	@Column(name="description", length=1024)
	private String description;
	
	
	@Column(name= "date")
	@Temporal(value=TemporalType.DATE)
	private Date date;
	
	
	@Column(name="employee", length=50)
	private String lfName;
	
	@Column(name="departament", length=30)
	private String departament;
	
	@ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.REFRESH })
	@JoinColumn(name="fk_status_id")
	private Status status;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate() {
		
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getLfName() {
		return lfName;
	}

	public void setLfName(String lfName) {
		this.lfName = lfName;
	}

	public String getDepartament() {
		return departament;
	}

	public void setDepartament(String departament) {
		this.departament = departament;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}
	
		
	@Override
	public String toString() {
		return "Request [title=" + title + ", description=" + description + ", date=" + date + ", lfName=" + lfName
				+ ", departament=" + departament + ", status=" + status + "]";
	}

	public Request(){
		super();
	}
	
	public Request(Long id){
		super(id);
	}
	
	
}
