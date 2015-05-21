package org.security.repositories;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.security.mongo.entities.Menu;
import org.security.mongo.entities.Product;

public interface IProduct {
	List<Product> listProducts();
	void updateProduct(Product product);
	void insertProduct(Product product);
	Product findById(String id);
	Product findByName(String name);
	void deleteById(String id);
	void deleteByName(String name);
	List<String> listCategories();
	List<Product> listProductsByCategory(String category);
	Menu menuLinksByCategory(String category);
	ArrayList<ArrayList<List<String>>> listMenuLinks();
	ArrayList<List<String>> listAccessoriesByCategory();
	List<String> listAccessories();
	List<Menu> listNameLinks();
	List<Menu> listMenus();
	void updateMenuLinks(Menu menu);
	List<Long> countOfProductsByCategory();
	Map<String, Map<String, Long>> countOfAccessoriesByCategory();
	List<String> listSubCategories();
	List<Product> search(String category, String name, String sort);
	List<String> listBrandsByCategory(String category);
}
