package com.github.xxbeanxx.struts.actions.admin;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Greg Baker
 */
@SuppressWarnings("serial")
public class IndexAction extends ActionSupport {
	
	public String fullAccess() throws Exception {
		return IndexAction.SUCCESS;
	}
	
	public String getNamespace() {
		return ServletActionContext.getActionMapping().getNamespace();
	}
	
}
