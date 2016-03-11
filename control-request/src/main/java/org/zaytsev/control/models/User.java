package org.zaytsev.control.models;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



@Entity
@Table(name="user")
public class User extends Model implements UserDetails {

	private static final long serialVersionUID = 2957014868411207052L;

	@NotNull
	@Column(name="username",length=40)
	private String username;
	
	@Column(name="password", length=64)
	private String password;
	
	@Column(name="lfname", length=25)
	private String lfName;
		
	public String getlfName() {
		return lfName;
	}
	public void setlfName(String lfName) {
		this.lfName = lfName;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@ManyToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinTable(name="user_role", joinColumns=@JoinColumn(name="user_id", nullable=false, updatable=false),
	inverseJoinColumns=@JoinColumn(name="role_id", nullable=false, updatable=false))
	private Set<Role> roles = new HashSet<Role>();
	
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	@ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.REFRESH })
	@JoinColumn(name="fk_departaments_id")
	private Departaments departaments;
	
	public Departaments getDepartaments() {
	return departaments;
	}
	public void setDepartaments(Departaments departaments) {
		this.departaments = departaments;
	}
	
	public User(){
		super();
	}
	public User(Long id){
		super(id);
	}
	public User (String username, String password, String lfName){
		super();
		this.username=username;
		this.password=password;
		this.lfName=lfName;
	}
	
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<SimpleGrantedAuthority> result = new ArrayList<>();
		for(Role role : getRoles()){
			result.add(new SimpleGrantedAuthority(role.getTitle().name()));			
		}
		return result;
	}

	
	

	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}

	@Override
	public boolean isEnabled() {
		
		return true;
	}
	
	

}
