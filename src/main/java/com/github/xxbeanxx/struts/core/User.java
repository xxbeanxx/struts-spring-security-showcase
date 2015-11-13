package com.github.xxbeanxx.struts.core;

/**
 * @author Greg Baker
 */
public class User {

	private final String pid;
	
	private final String firstname;
	
	private final String lastname;

	public User(String pid, String firstname, String lastname) {
		this.pid = pid;
		this.firstname = firstname;
		this.lastname = lastname;
	}
	
	public String getPid() {
		return pid;
	}
	
	public String getFirstname() {
		return firstname;
	}
	
	public String getLastname() {
		return lastname;
	}
	
}
