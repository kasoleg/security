package org.security.mongo.entities;

import org.springframework.data.mongodb.core.mapping.Field;

public class Details {
	String attribute;
	String value;
	public String getAttribute() {
		return attribute;
	}
	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	public Details(){}
	
	public Details(String attribute, String value) {
		super();
		this.attribute = attribute;
		this.value = value;
	}
}
