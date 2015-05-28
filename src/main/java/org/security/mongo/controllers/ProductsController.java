package org.security.mongo.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.security.mongo.entities.Product;
import org.security.repositories.IProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductsController {
	
	@Autowired
	private IProduct product;
	
	@RequestMapping(value="/{category}", method = RequestMethod.GET)
	public String search(HttpServletRequest request, @PathVariable String category, @RequestParam(value="accessory", required=false) String accessory, @RequestParam(value="query", required=false) String query, @RequestParam(value="sort", required=false) String sort, Model model) {
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
		List<Product> accessories = product.search(category, accessory, query, sort, request.getParameterMap());
		model.addAttribute("products", accessories);
		model.addAttribute("count", accessories.size());
		
		model.addAttribute("brands", product.listBrandsByCategory(category));
		if (!category.equals("All stores"))
			model.addAttribute("details", product.listDetailsByCategory(category));
		model.addAttribute("options", request.getParameterMap());
		Map<String, String[]> map = request.getParameterMap();
		Map<String, String> options = new HashMap<String, String>();
		for (String key : map.keySet()) {
			String[] values = map.get(key);
			for (String value : values) {
				options.put(value, key);
			}
		}
		model.addAttribute("options", options);
		return "products";
	}
}