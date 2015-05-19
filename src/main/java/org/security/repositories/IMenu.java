package org.security.repositories;

import java.util.ArrayList;

import org.security.mongo.entities.Menu;

public interface IMenu {
	void updateMenuLinks(Menu menu);
	void deleteByName(String name);
}
