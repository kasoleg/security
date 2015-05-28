package org.security.repositories;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.digester.WithDefaultsRulesWrapper;
import org.bson.types.BasicBSONList;
import org.security.mongo.entities.Comment;
import org.security.mongo.entities.Menu;
import org.security.mongo.entities.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.TextCriteria;
import org.springframework.data.mongodb.core.query.TextQuery;
import org.springframework.data.mongodb.core.query.Update;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

public class IProductImpl implements IProduct {

	@Autowired private MongoOperations mongoOperations;
	
	@Override
	public List<Product> listProducts() {
		List<Product> list = mongoOperations.findAll(Product.class); 
		return list;
	}

	@Override
	public void updateProduct(Product product) {
		mongoOperations.save(product);
	}

	@Override
	public void insertProduct(Product product) {
		mongoOperations.insert(product);
	}

	@Override
	public Product findById(String id) {
		return mongoOperations.findById(id, Product.class);
	}

	@Override
	public void deleteById(String id) {
		
	}

	@Override
	public List<String> listCategories() {
		BasicDBObject dbObject = new BasicDBObject();
		dbObject.append("subCategory", "1");
		return mongoOperations.getCollection("products").distinct("category", dbObject);
	}

	@Override
	public List<Product> listProductsByCategory(String category) {
		return mongoOperations.find(Query.query(Criteria.where("category").is(category)), Product.class);
	}

	//@Override
	//public Map<String, String> getDetails(String category) {
	//	return mongoOperations.findOne(Query.query(Criteria.where("category").is(category)), Product.class).getDetails();
	//}

	@Override
	public Product findByName(String name) {
		return mongoOperations.findOne(Query.query(Criteria.where("name").is(name)), Product.class);
	}

	@Override
	public void deleteByName(String name) {
		mongoOperations.findAndRemove(Query.query(Criteria.where("name").is(name)), Product.class);
	}

	@Override
	public Menu menuLinksByCategory(String category) {
		Menu menu = mongoOperations.findOne(Query.query(Criteria.where("category").is(category)), Menu.class);
		return menu;
	}

	@Override
	public ArrayList<ArrayList<List<String>>> listMenuLinks() {
		ArrayList<ArrayList<List<String>>> links = new ArrayList<ArrayList<List<String>>>();
		List<String> categories = listCategories();
		BasicDBObject dbObject = new BasicDBObject(); 
		
		for (String category : categories) {
			Menu menu = mongoOperations.findOne(Query.query(Criteria.where("category").is(category)), Menu.class);
			dbObject.append("category", category);
			ArrayList<List<String>> menuLinks = new ArrayList<List<String>>();
			for (String menuLink : menu.getLinks()) {
				List<String> details = (ArrayList) mongoOperations.getCollection("products").distinct("details."+menuLink, dbObject);
				if (details.size() > 5)
					menuLinks.add(details.subList(0, 5));
				else
					menuLinks.add(details);
			}
			links.add(menuLinks);
		}
		return links;
	}

	@Override
	public List<Menu> listNameLinks() {
		Query query = new Query();
		query.fields().include("links");
		List<Menu> list = mongoOperations.find(query, Menu.class);
		return list;
	}

	@Override
	public List<Menu> listMenus() {
		return mongoOperations.findAll(Menu.class);
	}

	@Override
	public void updateMenuLinks(Menu menu) {
		mongoOperations.save(menu);
	}

	@Override
	public ArrayList<List<String>> listAccessoriesByCategory() {
		ArrayList<List<String>> accessories = new ArrayList<List<String>>();
		BasicDBObject dbObject = new BasicDBObject(); 
		List<String> categories = listCategories();
		
		for (String category : categories) {
			dbObject.append("subCategory", category);
			List<String> subCategories = mongoOperations.getCollection("products").distinct("category", dbObject);
			accessories.add(subCategories);
		}
		
		return accessories;
	}

	@Override
	public List<Long> countOfProductsByCategory() {
		ArrayList<Long> counts = new ArrayList<Long>();
		List<String> categories = listCategories();
		for (String category : categories) {
			counts.add(mongoOperations.count(Query.query(Criteria.where("category").is(category)), Product.class));
		}
		return counts;
	}

	@Override
	public Map<String, Map<String, Long>> countOfAccessoriesByCategory() {
		Map<String, Map<String, Long>> countsByCategory = new HashMap<String, Map<String,Long>>();
		Map<String, Long> countByAccessory = null;
		List<String> subCategories = listSubCategories();
		List<String> accessories = listAccessories();
		for (String subCategory : subCategories) {
			countByAccessory = new HashMap<String, Long>();
			for (String accessory : accessories) {
				Long count = mongoOperations.count(Query.query(Criteria.where("category").is(accessory).and("subCategory").is(subCategory)), Product.class);
				countByAccessory.put(accessory, count);
			}
			countsByCategory.put(subCategory, countByAccessory);
		}
		return countsByCategory;
	}

	@Override
	public List<String> listAccessories() {
		BasicDBObject dbObject = new BasicDBObject();
		BasicDBObject ne = new BasicDBObject();
		ne.append("$ne", "1");
		dbObject.append("subCategory", ne);
		return mongoOperations.getCollection("products").distinct("category", dbObject);
	}

	@Override
	public List<String> listSubCategories() {
		BasicDBObject dbObject = new BasicDBObject();
		BasicDBObject ne = new BasicDBObject();
		ne.append("$ne", "1");
		dbObject.append("subCategory", ne);
		return mongoOperations.getCollection("products").distinct("subCategory", dbObject);
	}

	@Override
	public List<Product> search(String category, String accessory, String name, String sort, Map<String, String[]> details) {
		Query query = new Query();
		if (name != null) {
			TextCriteria criteria = TextCriteria.forDefaultLanguage().matchingAny("name", name);
			query.addCriteria(criteria);
		}
		
		List<Criteria> criterias = new ArrayList<Criteria>();
		for (String key : details.keySet()) {
			if (key.equals("name") || key.equals("sort") || key.equals("query")) {} else {
				String[] values = details.get(key);
				for (String value : values) {
					criterias.add(Criteria.where("details."+key).is(value));
				}
			}
		}
		if (criterias.size() != 0)
			query.addCriteria(new Criteria().orOperator(criterias.toArray(new Criteria[criterias.size()])));
		
		Sort asc = new Sort(Sort.Direction.ASC, "final_price");
		Sort desc = new Sort(Sort.Direction.DESC, "final_price");
		
		if (!category.equals("All stores") && accessory == null) {
			query.addCriteria(Criteria.where("category").is(category));
		} else {
			if (!category.equals("All stores")) {
				query.addCriteria(Criteria.where("subCategory").is(category));
				query.addCriteria(Criteria.where("category").is(accessory));
			}
		}
		if (sort.equals("asc")) {
			query.with(asc);
		} else if (sort.equals("desc")) {
			query.with(desc);
		}
		List<Product> list = mongoOperations.find(query, Product.class);
		return mongoOperations.find(query, Product.class);
	}

	@Override
	public List<String> listBrandsByCategory(String category) {
		return mongoOperations.getCollection("products").distinct("details.Brand", new BasicDBObject("category", category));
	}

	@Override
	public Map<String, List<String>> listDetailsByCategory(String category) {
		Map<String, List<String>> detailsByCategory = new HashMap<String, List<String>>();
		Product product = mongoOperations.findOne(Query.query(Criteria.where("category").is(category)), Product.class);
		Map<String, String> details = product.getDetails();
		BasicDBObject dbObject = new BasicDBObject();
		dbObject.append("category", category);
		for (String detail : details.keySet()) {
			detailsByCategory.put(detail, mongoOperations.getCollection("products").distinct("details."+detail, dbObject));
		}
		return detailsByCategory;
	}

	@Override
	public List<String> listSeriesByCategory(String category) {
		return mongoOperations.getCollection("products").distinct("details.Series", new BasicDBObject("category", category));
	}

	@Override
	public void addComment(String name, Comment comment) {
		mongoOperations.upsert(Query.query(Criteria.where("name").is(name)), 
				new Update().push("comments", comment)
					.inc("comment_count", 1), 
				Product.class);
	}
}
