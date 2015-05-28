package org.security.mongo.entities;

public class Cart {
	private String id;
	private String name;
	private Integer quontity;
	private Integer totalQuontity;
	private Integer price;
	private Integer finalPrice;
	private Integer discount;
	public Integer getTotalQuontity() {
		return totalQuontity;
	}
	public void setTotalQuontity(Integer totalQuontity) {
		this.totalQuontity = totalQuontity;
	}
	public Integer getQuontity() {
		return quontity;
	}
	public void setQuontity(Integer quontity) {
		this.quontity = quontity;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(Integer finalPrice) {
		this.finalPrice = finalPrice;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
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
}
