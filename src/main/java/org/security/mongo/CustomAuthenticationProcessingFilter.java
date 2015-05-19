package org.security.mongo;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.security.mongo.entities.User;
import org.security.repositories.IUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

public class CustomAuthenticationProcessingFilter extends UsernamePasswordAuthenticationFilter{ 

	@Autowired
	private IUser user;
	
	@Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
            throws org.springframework.security.core.AuthenticationException {
		Authentication authentication = super.attemptAuthentication(request, response); 

			       if (authentication.isAuthenticated()) { 
			    	   UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
						String email = userDetails.getUsername();
						User user = this.user.findByEmail(email);
						Cookie cookie = new Cookie("cust_name", user.getName().toUpperCase());
						response.addCookie(cookie);             
			       } 
			       return authentication;
    }
} 