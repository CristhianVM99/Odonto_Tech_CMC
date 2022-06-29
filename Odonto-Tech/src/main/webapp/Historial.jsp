

<%@page import="com.odontotech.dao.genericDAOimplements"%>
<%@page import="com.odontotech.dao.genericDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.odontotech.model.GenericClass"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id_registro = (String)request.getAttribute("id_registro");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Empresa</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="./css/main.css">
</head>
<body>
	<!-- Menu -->
        <jsp:include page="META-INF/Menu.jsp"></jsp:include>

	<!-- Content page-->
	<section class="full-box dashboard-contentPage">
		<!-- NavBar -->
		<nav class="full-box dashboard-Navbar">
			<ul class="full-box list-unstyled text-right">
				<li class="pull-left">
					<a href="#!" class="btn-menu-dashboard"><i class="zmdi zmdi-more-vert"></i></a>
				</li>
				<li>
					<a href="#" class="btn-search">
						<i class="zmdi zmdi-search"></i>
					</a>
				</li>
			</ul>
		</nav>
		
                <!-- Contenido principal -->
                
		<div class="container-fluid">
			<div class="page-header">
			  <h1 class="text-titles"><i class="zmdi zmdi-balance zmdi-hc-fw"></i> Paciente - Historial <small>Consultorio</small></h1>
			</div>
                    <p class="lead">En esta ocacion mostraremos lo que son los registros de los pascientes que hay en la clinica. <br>A continuacion tenemos los siguientes Registros.</p>
		</div>

		<div class="container-fluid">
			<ul class="breadcrumb breadcrumb-tabs">
                                <li>    
                                    <form>
                                        <a href="Controller_Pacientes" class="btn btn-danger btn-raised btn-xs">
                                            <i class="zmdi zmdi-arrow-left"></i> REGRESAR A PACIENTES
                                        </a>
                                    </form>
                                </li>
			  	<li>
			  		<a href="Controller_Historial?action=view&id=${id_registro}" class="btn btn-info">
			  			<i class="zmdi zmdi-plus"></i> &nbsp; HISTORIAL
			  		</a>
			  	</li>
			  	<li>
			  		<a href="Controller_Historial?action=add&id_registro=${id_registro}" class="btn btn-success">
			  			<i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; NUEVO REGISTRO
			  		</a>
			  	</li>
			</ul>
		</div>

		<!-- panel lista de pacientes -->
		<div class="container-fluid">
			<div class="panel panel-success">
				<div class="panel-heading">
                                    <h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE HISTORIAL</h3>                                    
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<th class="text-center">ID</th>
									<th class="text-center">PACIENTE</th>
									<th class="text-center">FECHA</th>
									<th class="text-center">DESCRIPCION</th>
                                                                        <th class="text-center">EDITAR</th>
                                                                        <th class="text-center">ELIMINAR</th>
								</tr>
							</thead>
							<tbody>
                                                        <c:forEach var="registro" items="${lista_historial}">
                                                            <tr>
                                                                <td>${registro.id}</td>
                                                                <td>${registro.ci_paciente}</td>
                                                                <td>${registro.fecha}</td>
                                                                <td>${registro.descripcion}</td>
                                                                <td>                                                                    
                                                                    <form>
                                                                        <a href="Controller_Historial?action=edit&id=${registro.id}&id_registro=${id_registro}" class="btn btn-success btn-raised btn-xs">
                                                                            <i class="zmdi zmdi-refresh"></i>
                                                                        </a>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <form>                                                                        
                                                                        <a href="Controller_Historial?action=delete&id=${registro.id}&id_registro=${id_registro}" class="btn btn-danger btn-raised btn-xs">
                                                                            <i class="zmdi zmdi-delete"></i>
                                                                        </a>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</section>

	<!--====== Scripts -->
	<script src="./js/jquery-3.1.1.min.js"></script>
	<script src="./js/sweetalert2.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/material.min.js"></script>
	<script src="./js/ripples.min.js"></script>
	<script src="./js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="./js/main.js"></script>
	<script>
		$.material.init();
	</script>
</body>
</html>