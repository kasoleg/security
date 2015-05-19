package org.security.repositories;

import org.security.mongo.entities.User;

public interface IUser {
	public User findByUsername(String username);
	public User findByEmail(String email);
	public void addUser(User user);
}
