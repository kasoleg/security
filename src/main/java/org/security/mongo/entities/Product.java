package org.security.mongo.entities;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.mongodb.BasicDBList;

@Document(collection="products")
public class Product {
	@Id
	private String id;
	String name;
	String product_img;
	String subCategory;
	Integer price;
	Integer final_price;
	Integer discount;
	String description;
	Integer count;
	Map<String, String> details;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public Integer getFinal_price() {
		return final_price;
	}
	public void setFinal_price(Integer final_price) {
		this.final_price = final_price;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Map<String, String> getDetails() {
		return details;
	}
	public void setDetails(Map<String, String> details) {
		this.details = details;
	}
}
