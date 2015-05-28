package org.security.mongo.controllers;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;
import org.security.mongo.entities.Comment;
import org.security.repositories.IProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	@Autowired
	private IProduct product;
	
	@RequestMapping(value="{category}/{name}")
	public String product(@PathVariable String category, @PathVariable String name, Comment comment, Model model) {
		if (comment.getTitle() != null) {
			comment.setDate(new Date());
			product.addComment(name, comment);
		}
		model.addAttribute("categories", product.listCategories());
		model.addAttribute("accessories", product.listAccessoriesByCategory());
		model.addAttribute("menuLinks", product.listMenuLinks());
		model.addAttribute("links", product.listNameLinks());
		model.addAttribute("category", category);
		model.addAttribute("series", product.listSeriesByCategory(category));
		model.addAttribute("product", product.findByName(name));
		model.addAttribute("comment", new Comment());
		return "product";
	}
	
	//@RequestMapping(value="/addComment", method = RequestMethod.POST)
	//public void addComment(HttpServletRequest response, Comment comment, Model model) {
		//response.
	//}
}
