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
	private String name;
	private String product_img;
	private String subCategory;
	private Integer price;
	private Integer final_price;
	private Integer discount;
	private String description;
	private Integer count;
	private Map<String, String> details;
	private List<String> images;
	private List<String> thumbnails;
	private Map<String, String> features;
	private List<String> sales_package;
	private List<Comment> comments;
	private Integer comment_count;
	public Integer getComment_count() {
		return comment_count;
	}
	public void setComment_count(Integer comment_count) {
		this.comment_count = comment_count;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public List<String> getSales_package() {
		return sales_package;
	}
	public void setSales_package(List<String> sales_package) {
		this.sales_package = sales_package;
	}
	public Map<String, String> getFeatures() {
		return features;
	}
	public void setFeatures(Map<String, String> features) {
		this.features = features;
	}
	public List<String> getImages() {
		return images;
	}
	public void setImages(List<String> images) {
		this.images = images;
	}
	public List<String> getThumbnails() {
		return thumbnails;
	}
	public void setThumbnails(List<String> thumbnails) {
		this.thumbnails = thumbnails;
	}
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
