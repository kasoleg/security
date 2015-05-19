package org.security.mongo.entities;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
 
@Document(collection="users")
public class User {
	@Id
	private String id;
	private String email;
	private String password;
	private String name;
	private Boolean actived;
	private List roles;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getActived() {
		return actived;
	}
	public void setActived(Boolean actived) {
		this.actived = actived;
	}
	public List getRoles() {
		return roles;
	}
	public void setRoles(List roles) {
		this.roles = roles;
	}
	
}