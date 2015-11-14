package com.github.xxbeanxx.struts.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.authentication.preauth.AbstractPreAuthenticatedProcessingFilter;
import org.springframework.util.Assert;

/**
 * @author Greg Baker
 */
public class StubLoginAuthenticationProcessingFilter extends AbstractPreAuthenticatedProcessingFilter {

	private String principalRequestKey = "pid";
	
	private String credentialsRequestKey;
	
	@Override
	protected Object getPreAuthenticatedPrincipal(HttpServletRequest request) {
		return request.getParameter(principalRequestKey);
	}

	@Override
	protected Object getPreAuthenticatedCredentials(HttpServletRequest request) {
		return request.getParameter(credentialsRequestKey) != null ? request.getParameter(credentialsRequestKey) : "N/A";
	}

	public void setCredentialsRequestKey(String credentialsRequestKey) {
		Assert.hasText(credentialsRequestKey, "credentialsRequestKey must not be empty or null");
		this.credentialsRequestKey = credentialsRequestKey;
	}
	
	public void setPrincipalRequestKey(String principalRequestKey) {
		Assert.hasText(principalRequestKey, "principalRequestKey must not be empty or null");
		this.principalRequestKey = principalRequestKey;
	}
	
}
