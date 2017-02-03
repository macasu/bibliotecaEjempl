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
<title>Listado de Autor</title>
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<style type="text/css">
@IMPORT url("${path}/static/bootstrap/css/bootstrap.min.css");

@IMPORT url("${path}/static/bootstrap/css/bootstrap-theme.min.css");
</style>

<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				<table id="tabla-libros" class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>nombre</th>
							<th>Editar</th>
							<th>Borrar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${autores}" var="autor">
							<tr data-id="${autor.id}">
								<td>${autor.id}</td>
								<td>${autor.nombre}</td>
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
							<td colspan="5">Autor registrados: <span
								id="registrar-autor">${autores.size()}</span></td>
						</tr>
						<tr>
							<td colspan="5"><a class="btn btn-primary"
								data-toggle="modal" href='#modal-autor'>Guardar Libro</a></td>
						</tr>
					</tfoot>
					</tbody>

				</table>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
		</div>
	</div>




	<div class="modal fade" id="modal-autor" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="form-autor" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Informacion del autor</h4>
					</div>
					<div class="modal-body">
						<label for="nombre">Autor: </label> <input id="nombre"
							name="nombre" class="form-control"> 
							
							
							<input id="id"
							name="id" type="hidden">
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
	<script type="text/javascript" src="static/js/autor.js"></script>
</body>
</html>