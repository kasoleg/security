package org.security.repositories;

import java.util.ArrayList;

import org.security.mongo.entities.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

public class IMenuImpl implements IMenu {

	@Autowired private MongoOperations mongoOperations;
	
	@Override
	public void updateMenuLinks(Menu menu) {
		mongoOperations.save(menu);
	}

	@Override
	public void deleteByName(String name) {
		mongoOperations.findAndRemove(Query.query(Criteria.where("category").is(name)), Menu.class);
	}	
}
