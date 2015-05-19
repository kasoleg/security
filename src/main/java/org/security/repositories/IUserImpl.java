package org.security.repositories;

import org.security.mongo.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class IUserImpl implements IUser {

	@Autowired private MongoOperations mongoOperations;
	
	@Override
	public User findByEmail(String email) {
		return mongoOperations.findOne(Query.query(Criteria.where("email").is(email)), User.class);
	}

	@Override
	public User findByUsername(String username) {
		return mongoOperations.findOne(Query.query(Criteria.where("username").is(username)), User.class);
	}

	@Override
	public void addUser(User user) {
		User u = mongoOperations.findOne(Query.query(Criteria.where("email").is(user.getEmail())), User.class);
		if (u == null) {
			mongoOperations.insert(user);
		}
	}

}
