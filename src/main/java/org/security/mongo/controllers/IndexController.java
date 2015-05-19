package org.security.mongo.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.security.mongo.entities.User;
import org.security.repositories.IProduct;
import org.security.repositories.IUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.savedrequest.SavedCookie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@Autowired
	private IProduct product;
	
	@Autowired
	private IUser user;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("categories", product.listCategories());
		model.addAttribute("menuLinks", product.listMenuLinks());
		model.addAttribute("accessories", product.listAccessoriesByCategory());
		model.addAttribute("links", product.listNameLinks());
		return "index";
	}
}
