package org.security.mongo.controllers;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.bson.types.ObjectId;
import org.security.mongo.entities.Details;
import org.security.mongo.entities.Menu;
import org.security.mongo.entities.Product;
import org.security.repositories.IMenu;
import org.security.repositories.IProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/admin/products")
public class AdminController {
	@Autowired
	private IProduct product;
	@Autowired
	private IMenu menu;
	
	@RequestMapping(value="/index")
	public String index(Model model) {
		model.addAttribute("products", product.listProducts());
		model.addAttribute("menuLinks", product.listMenus());
		return "admin";
	}
	
	@RequestMapping(value="/showProduct/{name}")
	public String showProduct(@PathVariable String name, Model model) {
		Product product = this.product.findByName(name);
		model.addAttribute("product", this.product.findByName(name));
		model.addAttribute("menuLinks", this.product.menuLinksByCategory(product.getDetails().get("Category")));
		return "adminProducts";
	}
	
	@RequestMapping(value="/deleteProduct/{name}")
	public String deleteProduct(@PathVariable String name, Model model) {
		this.product.deleteByName(name);
		model.addAttribute("products", product.listProducts());
		model.addAttribute("menuLinks", product.listMenus());
		return "admin";
	}
	
	@RequestMapping(value="/deleteMenuLinks/{name}")
	public String deleteMenuLinks(@PathVariable String name, Model model) {
		this.menu.deleteByName(name);
		model.addAttribute("products", product.listProducts());
		model.addAttribute("menuLinks", product.listMenus());
		return "admin";
	}
	
	@RequestMapping(value="/addProduct")
	public String addProduct(Model model) {
		model.addAttribute("product", new Product());
		return "editProduct";
	}
	
	@RequestMapping(value="/editProduct/{name}")
	public String editProduct(@PathVariable String name, Model model) {
		Product product = this.product.findByName(name);
		model.addAttribute("product", product);
		return "editProduct";
	}
	
	@RequestMapping(value="/editMenuLinks/{category}")
	public String editMenuLinks(@PathVariable String category, Model model) {
		Product product = this.product.findByName(category);
		model.addAttribute("menuLinks", this.product.menuLinksByCategory(category));
		return "editMenuLinks";
	}
	
	@RequestMapping(value="/editMenuLinks/saveMenuLinks")
	public String saveMenuLinks(Menu menu, Model model) {
		this.menu.updateMenuLinks(menu);
		model.addAttribute("products", product.listProducts());
		model.addAttribute("menuLinks", product.listMenus());
		return "admin";
	}
	
	@RequestMapping(value="/editProduct/saveProduct")
	public String saveProduct(HttpServletRequest request, Product product, BindingResult result, Model model) {
		List<String> parameterNames = new ArrayList<String>(request.getParameterMap().keySet());
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 5; i < parameterNames.size() - 1; i+=2) {
			String key = request.getParameter(parameterNames.get(i));
			String value = request.getParameter(parameterNames.get(i + 1));
			map.put(key, value);
		}
		product.setDetails(map);
		this.product.updateProduct(product);
		model.addAttribute("products", this.product.listProducts());
		model.addAttribute("menuLinks", this.product.listMenus());
		return "admin";
	}
	
	@RequestMapping(value="/saveProduct")
	public String addProduct(HttpServletRequest request, @Valid Product product, BindingResult result, Model model) {
		ObjectId id = new ObjectId();
		product.setId(id.toString());
		List<String> parameterNames = new ArrayList<String>(request.getParameterMap().keySet());
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 5; i < parameterNames.size() - 1; i+=2) {
			String key = request.getParameter(parameterNames.get(i));
			String value = request.getParameter(parameterNames.get(i + 1));
			map.put(key, value);
		}
		product.setDetails(map);
		this.product.updateProduct(product);
		model.addAttribute("products", this.product.listProducts());
		return "admin";
	}
}