package com.github.xxbeanxx.struts.security;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * @author Greg Baker
 */
public class PreAuthenticatedUserDetailsService implements UserDetailsService {

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		final List<GrantedAuthority> grantedAuthorities = getGrantedAuthorities();
		return new User(username, UUID.randomUUID().toString(), true, true, true, true, grantedAuthorities);
	}

	private List<GrantedAuthority> getGrantedAuthorities() {
		final List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_HAS_SIN"));
		return grantedAuthorities;
	}

}
