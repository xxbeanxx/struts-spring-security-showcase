<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
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
					<a class="navbar-brand" href="#">Struts II/Spring 4 Security Showcase</a>
				</div>
				
				<div id="navbar" class="navbar-collapse collapse">
					<form class="navbar-form navbar-right">
						<s:if test="%{#attr['user'] == 'anonymousUser'}">
							<div class="form-group">
								<input type="text" placeholder="Email" class="form-control">
							</div>
							
							<div class="form-group">
								<input type="password" placeholder="Password" class="form-control">
							</div>
							<button type="submit" class="btn btn-success">Sign in</button>
						</s:if>
						<s:else>
							<a href="#" class="btn btn-link">${user.username}</a>
							<a href="/logout" class="btn btn-success">Log out</a>
						</s:else>
					</form>
				</div>
			</div>
		</nav>
		
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<div class="container">
				<h1>
					Welcome, ${user == 'anonymousUser' ? 'guest' : user.username}!
					<small><small><small class="text-muted">(you are currently accessing <strong><s:property value="%{namespace}"/></strong>)</small></small></small>
				</h1>
				<p>
					This application is intended to be a showcase of Spring Security 4.x within a Struts II context
				</p>
			</div>
		</div>
		
		<div class="container">
			<!-- Example row of columns -->
			<div class="row">
				<div class="col-md-4">
					<h2>Unsecured Page</h2>
					<p>Click the button below to access an <strong>unsecured</strong> page.</p>
					<p><s:a namespace="/" action="index" cssClass="btn btn-default" role="button">Unsecured &raquo;</s:a></p>
				</div>
				<div class="col-md-4">
					<h2>Authenticated Page</h2>
					<p>Click the button below to access an <strong>authenticated</strong> page.</p>
					<p><s:a namespace="/auth" action="index" cssClass="btn btn-default" role="button">Authenticated &raquo;</s:a></p>
				</div>
				<div class="col-md-4">
					<h2>Admin Page</h2>
					<p>Click the button below to access an <strong>admin</strong> page.</p>
					<p><s:a namespace="/admin" action="index" cssClass="btn btn-default" role="button">Admin &raquo;</s:a></p>
				</div>
			</div>
		
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