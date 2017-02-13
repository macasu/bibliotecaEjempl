<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<style type="text/css">
#login {
	width: 400px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
}

#btn-login {
	width: 100%;
}
</style>
<link rel="shortcut icon"
	href="<c:url value="static/img/favicon.ico" />" type="image/x-icon">
<link rel="icon" href='<c:url value="static/img/favicon.ico" />'
	type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><sitemesh:write property='title' /></title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link href="<c:url value="/static/css/style.css" />" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />

<sitemesh:write property='head' />
</head>
<body>
<div class="navbar">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Biblioteca</a>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="<c:url value="/" />">Inicio</a></li>
				<li><a href="<c:url value="/autores" />">Autores</a>
				</li>
				<li><a href="<c:url value="/libros" />">Libros</a></li>
				<li><a href="<c:url value="/" />">Administración</a></li>
			</ul>
		</div>
	</div>
	<sitemesh:write property='body' />

	<section id="login" class="panel panel-primary"> <c:if
		test='${not empty param["semacesso"]}'>
		<div class="alert alert-warning">Usuario y/o contraseña
			incorretos!</div>
	</c:if> <c:if test='${not empty param["saiu"]}'>
		<div class="alert alert-info">Ha salido del sistema!</div>
	</c:if>

	<form action='<c:url value="/autenticar"/>' method="post">
		<div class="panel-heading">Biblioteca - Login</div>

		<div class="panel-body">
			<label for="usuario"></label> <input id="usuario" name="username"
				class="form-control" required> <label for="password"></label>
			<input type="password" id="password" name="password"
				class="form-control" required>
		</div>

		<div class="panel-footer">
			<button id="btn-login" class="btn btn-primary">Entrar</button>
		</div>

		<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
	</form>
	</section>
</body>
</html>