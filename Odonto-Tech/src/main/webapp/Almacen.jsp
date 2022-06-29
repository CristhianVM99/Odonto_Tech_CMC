<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
		<!-- Content page -->
		<div class="container-fluid">
			<div class="page-header">
			  <h1 class="text-titles"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>ALMACENE <small>Consultorio</small></h1>
			</div>
			<p class="lead">Lista de los almacenes que tiene la empresa asi aseguramos una mejor administracion.</p>
		</div>

		<div class="container-fluid">
			<ul class="breadcrumb breadcrumb-tabs">
			  	<li>
			  		<a href="Controller_Almacen" class="btn btn-info">
			  			<i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE PRODUCTOS
			  		</a>
			  	</li>
			  	<li>
			  		<a href="Controller_Almacen?action=add" class="btn btn-success">
			  			<i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; NUEVO PRODUCTO
			  		</a>
			  	</li>
			</ul>
		</div>

		<!-- panel lista de empresas -->
		<div class="container-fluid">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE ALMACEN</h3>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<th class="text-center">ID</th>
									<th class="text-center">NOMBRE</th>
									<th class="text-center">CANTIDAD</th>
									<th class="text-center">FECHA DE VENCIMINETO</th>
									<th class="text-center">PRECIO</th>
									<th class="text-center">ID DOCTOR</th>
                                                                        <th class="text-center">EDITAR</th>
                                                                        <th class="text-center">ELIMINAR</th>
								</tr>
							</thead>
							<tbody>
                                                        <c:forEach var="lista" items="${lista_almacen}">
                                                            <tr>
                                                                <td>${lista.id}</td>
                                                                <td>${lista.nombre}</td>
                                                                <td>${lista.cantidad}</td>
                                                                <td>${lista.fecha_venc}</td>
                                                                <td>${lista.precio_unit}</td>
                                                                <td>${lista.id_doctor}</td>
                                                                
                                                                <td>                                                                    
                                                                    <form>
                                                                        <a href="Controller_Almacen?action=edit&id=${lista.id}" class="btn btn-success btn-raised btn-xs">
                                                                            <i class="zmdi zmdi-edit"></i>
                                                                        </a>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <form>                                                                        
                                                                        <a href="Controller_Almacen?action=delete&id=${lista.id}" class="btn btn-danger btn-raised btn-xs">
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