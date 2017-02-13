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
<title>Listado de Libros</title>
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<style type="text/css">
@IMPORT url("${path}/static/bootstrap/css/bootstrap.min.css");

@IMPORT url("${path}/static/bootstrap/css/bootstrap-theme.min.css");
</style>

<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<link rel="shortcut icon"
	href="<c:url value="static/img/favicon.ico" />" type="image/x-icon">
<link rel="icon" href='<c:url value="static/img/favicon.ico" />'
	type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><sitemesh:write property='title' /></title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->


<!-- Optional theme -->


<!-- Latest compiled and minified JavaScript -->

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
				<li><a href="<c:url value="/autores" />">Autores</a></li>
				<li><a href="<c:url value="/libros" />">Libros</a></li>
				<li><a href="<c:url value="/" />">Administración</a></li>
			</ul>
		</div>
	</div>
	<sitemesh:write property='body' />

	<div class="container">
		<div class="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				<table id="tabla-libros" class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Titulo</th>
							<th>Autor</th>
							<th>Categoria</th>
							<th>Editar</th>
							<th>Borrar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${libros}" var="libro">
							<tr data-id="${libro.id}">
								<td>${libro.id}</td>
								<td>${libro.titulo}</td>
								<td>${libro.autor.nombre}</td>
								<td>${libro.categoria }</td>
								<!--  <td>${ingrediente.categoria}</td>-->
								<td>
									<button type="button" class="btn btn-warning btn-modificar">Editar</button>
								</td>
								<td>
									<button type="button" class="btn btn-danger btn-eliminar">Borrar</button>
								</td>
							</tr>
						</c:forEach>
					<tfoot>
						<tr>
							<td colspan="5">Libro registrados: <span
								id="registrar-libros">${libros.size()}</span></td>
						</tr>
						<tr>
							<td colspan="5"><a class="btn btn-primary"
								data-toggle="modal" href='#modal-libro'>Guardar Libro</a></td>
						</tr>
					</tfoot>
					</tbody>

				</table>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
		</div>
	</div>




	<div class="modal fade" id="modal-libro" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="form-ingrediente" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Informacion do libro</h4>
					</div>
					<div class="modal-body">
						<label for="titulo">Titulo: </label> <input id="titulo"
							name="titulo" class="form-control"> <label for="autor">Autor:
						</label> <select id="autor" name="autor" class="form-control">
							<c:forEach items="${autores}" var="autor">
								<option value="${autor.id}">${autor.nombre}</option>
							</c:forEach>
							</select> <input id="id" name="id" type="hidden">
							<label for="autor">Categoria:
						</label>
							<select id="categoria" name="categoria" class="form-control">
							<c:forEach items="${categorias}" var="categoria">
								<option value="${categoria}">${categoria}</option>
							</c:forEach>
						</select> <input id="id" name="id" type="hidden">

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
						<button type="submit" class="btn btn-primary">Guardar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript"
		src="static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/libro.js"></script>
</body>
</html>