package org.security.mongo.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.security.mongo.entities.User;
import org.security.repositories.IUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController
{
	@Autowired
	private IUser user;
    @RequestMapping( value = "/login" )
    public ModelAndView login(HttpServletResponse response, @RequestParam(value="redirectURL") String redirectURL, @RequestParam(value="error", required = false) String error)
    {	
    	response.addHeader("redirectURL", redirectURL);
    	ModelAndView model = new ModelAndView();
    	if (error != null) {
			model.addObject("error", "Invalid email or password. Please try again.");
		}
	    model.addObject("user", new User());
		model.setViewName("login");
		
		return model;
	}
    
    @RequestMapping(value="/addUser")
	public String registerUserAccount(@Valid User user, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "login";
		}
		
		String hashedPassword = null;
		int i = 0;
		while (i < 10) {
			String password = user.getPassword();
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			hashedPassword = passwordEncoder.encode(password);
	 		i++;
		}
		user.setPassword(hashedPassword);
		
		List<String> roles = new ArrayList<String>();
		roles.add("ROLE_USER");
		user.setRoles(roles);
		this.user.addUser(user);
		return "index";
	}
}