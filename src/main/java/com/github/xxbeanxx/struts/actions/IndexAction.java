package com.github.xxbeanxx.struts.actions;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Greg Baker
 */
@SuppressWarnings("serial")
public class IndexAction extends ActionSupport {

	public String getNamespace() {
		return ServletActionContext.getActionMapping().getNamespace();
	}
	
}
