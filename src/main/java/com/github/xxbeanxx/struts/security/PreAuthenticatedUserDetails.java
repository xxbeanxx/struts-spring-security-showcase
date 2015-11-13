package com.github.xxbeanxx.struts.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.github.xxbeanxx.struts.core.User;

/**
 * @author Greg Baker
 */
@SuppressWarnings("serial")
public class PreAuthenticatedUserDetails extends User implements UserDetails {

	private Collection<? extends GrantedAuthority> authorities;

	public PreAuthenticatedUserDetails(String pid, String firstname, String lastname, Collection<? extends GrantedAuthority> authorities) {
		super(pid, firstname, lastname);
		this.authorities = authorities;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return Collections.unmodifiableCollection(this.authorities);
	}

	@Override
	public String getPassword() {
		return null;
	}

	@Override
	public String getUsername() {
		return this.getPid();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
