<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<security:authentication property="principal" var="principal"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>index.jsp</title>
	</head>

	<body>
		<h1>Current page's namespace: <s:property value="%{namespace}"/></h1>
		
		<p>You are logged in as [${principal == 'anonymousUser' ? 'Anonymous' : principal.username}]</p>
		
		<ul>
			<li><s:a namespace="/" action="index">Anonymous page</s:a></li>
			<li><s:a namespace="/auth" action="index">Auth page</s:a></li>
			<li><s:a namespace="/admin" action="index">Admin page</s:a></li>
		</ul>
	</body>
</html>