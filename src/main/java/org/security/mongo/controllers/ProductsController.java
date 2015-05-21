package org.security.mongo.controllers;

import java.util.List;

import org.security.mongo.entities.Product;
import org.security.repositories.IProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductsController {
	
	@Autowired
	private IProduct product;
	
	@RequestMapping(value="/{category}", method = RequestMethod.GET)
	public String products(@PathVariable String category, Model model) {
		model.addAttribute("categories", product.listCategories());
		model.addAttribute("accessories", product.listAccessoriesByCategory());
		model.addAttribute("menuLinks", product.listMenuLinks());
		model.addAttribute("links", product.listNameLinks());
		model.addAttribute("currentCategory", category);
		model.addAttribute("countByCategories", product.countOfProductsByCategory());
		model.addAttribute("countAccessoriesByCategories", product.countOfAccessoriesByCategory());
		List<Product> products = product.listProductsByCategory(category);
		model.addAttribute("products", products);
		model.addAttribute("count", products.size());
		model.addAttribute("brands", product.listBrandsByCategory(category));
		return "products";
	}
	
	@RequestMapping(value="/{category}/search", method = RequestMethod.GET)
	public String search(@PathVariable String category, @RequestParam(value="query", required=false) String query, @RequestParam(value="sort", required=false) String sort, Model model) {
		if (sort == null)
			sort = "relevance";
		if (sort.equals("asc"))
			model.addAttribute("active", "asc");
		else if (sort.equals("desc"))
			model.addAttribute("active", "desc");
		model.addAttribute("categories", product.listCategories());
		model.addAttribute("accessories", product.listAccessoriesByCategory());
		model.addAttribute("menuLinks", product.listMenuLinks());
		model.addAttribute("links", product.listNameLinks());
		if (query != null)
			model.addAttribute("search_term", query);
		model.addAttribute("currentCategory", category);
		model.addAttribute("countByCategories", product.countOfProductsByCategory());
		model.addAttribute("countAccessoriesByCategories", product.countOfAccessoriesByCategory());
		List<Product> products = product.search(category, query, sort);
		model.addAttribute("products", products);
		model.addAttribute("count", products.size());
		return "products";
	}
}