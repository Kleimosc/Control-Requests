package org.zaytsev.control.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="token")
public class VerificationToken extends Model {

	
	private static final long serialVersionUID = -4222384726885401014L;
	
	public VerificationToken(String token, User user){
		super();
		this.token = token;
		this.user = user;
	}
	
	public VerificationToken(){
		super();
		
	}
	
	public VerificationToken(Long id){
		super(id);
	}
	@NotNull
	@Column(name="token", unique=true)
	private String token;
	
	@OneToOne(targetEntity = User.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "user_id")
    private User user;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
