<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<security:authentication property="principal" var="user"/>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Struts II/Spring 4 Security Showcase</title>

		<link rel="stylesheet" crossorigin="anonymous" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
				integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="/>
		
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	
	<body>

		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<s:a namespace="/" action="index" cssClass="navbar-brand">Struts II/Spring 4 Security Showcase</s:a>
				</div>
			</div>
		</nav>
		
		
		<div class="container" style="padding-top:48px">
			<h1>Stub Login Page</h1>
			
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				<div class="alert alert-danger" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
					<span class="sr-only">Error:</span> <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
				</div>
			</c:if>

			<h2>User Impersonation Login</h2>
			
			<form method="post" action="${pageContext.request.contextPath}/login/impersonate" class="form-inline">
				<div class="form-group">
					<select id="select" class="form-control" onchange="$('#SCAN-ISCI-PID').eq($(this).index()).val(this.value)">
						<option value="">-- Select PID --</option>
						<option value="800000002">800000002</option>
					</select>
				</div>
				<span class="glyphicon glyphicon-arrow-right"></span>
				<div class="form-group">
					<input id="SCAN-ISCI-PID" type="text" placeholder="pid" class="form-control" name="SCAN-ISCI-PID"
							onkeyup="$('#select option').filter(function() { return $(this).val() == $('#SCAN-ISCI-PID').val() }).attr('selected', true)">
				</div>
				
				<s:hidden name="%{#attr._csrf.parameterName}" value="%{#attr._csrf.token}"/>
				
				<div style="margin-top:10px">
					<button type="submit" class="btn btn-primary">User Impersonation Login</button>
				</div>
			</form>

			<div class="row">
				<hr class="col-md-offset-4 col-md-4">
			</div>

			<h2>Administrative Login</h2>
			
			<form method="post" action="${pageContext.request.contextPath}/login" class="form-inline">
				<div class="form-group">
					<input type="text" placeholder="username" class="form-control" name="username">
				</div>
				
				<div class="form-group">
					<input type="password" placeholder="password" class="form-control" name="password">
				</div>
				
				<s:hidden name="%{#attr._csrf.parameterName}" value="%{#attr._csrf.token}"/>

				<div style="margin-top:10px">				
					<button type="submit" class="btn btn-primary">Administrative Login</button>
				</div>
			</form>

			<hr>
		
			<footer>
				<p>&copy; Greg Baker 2015</p>
			</footer>
		</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" crossorigin="anonymous"
				integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ=="></script>		

	</body>
</html>