package org.security.mongo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.security.mongo.entities.User;
import org.security.repositories.IUserImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomMongoSecurityService implements UserDetailsService {
	private User user;
	
	@Autowired
	IUserImpl userService;
	
	@Override
	public UserDetails loadUserByUsername(String email)
	throws UsernameNotFoundException {
	
	try {
	
		user = userService.findByEmail(email);
		
		return new UserDetails() {
			
			@Override
			public boolean isEnabled() {
				return true;
			}
			
			@Override
			public boolean isCredentialsNonExpired() {
				return true;
			}
			
			@Override
			public boolean isAccountNonLocked() {
				// TODO Auto-generated method stub
				return true;
			}
			
			@Override
			public boolean isAccountNonExpired() {
				// TODO Auto-generated method stub
				return true;
			}
			
			@Override
			public String getUsername() {
				// TODO Auto-generated method stub
				return user.getEmail();
			}
			
			@Override
			public String getPassword() {
				return user.getPassword();
			}
			
			@Override
			public Collection<? extends GrantedAuthority> getAuthorities() {
				List authorities = new ArrayList();
				for (Object object : user.getRoles()) {
					authorities.add(new SimpleGrantedAuthority(object.toString()));
				}
				
				return authorities;
			}
		};
	
	} catch (Exception e) {
		throw new RuntimeException(e);
	}

}

}

