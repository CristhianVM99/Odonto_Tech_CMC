<%@page import="java.util.List"%>
<%@page import="com.odontotech.model.GenericClass"%>
<%
List<GenericClass> list=(List<GenericClass>) request.getAttribute("lis");
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
		<!-- Content page -->
		 <div class="container-fluid">
                <div class="page-header">
                    <h1 class="text-titles"><i class="zmdi zmdi-card zmdi zmdi-hc-fw"></i> Tarifas <small>Consultorio</small></h1>
                </div>
                <p class="lead">Clinita odontologica ODONTO TECH,
                    proporciona diferentes especialidades ,a los pacientes,
                    como ser historial clinico, agentadar citas,
                    promocionar e informar a los pacientes
                    sobre la salud bucal e higinie.</p>
            </div>

		<div class="container-fluid">
			<ul class="breadcrumb breadcrumb-tabs">
			  	<li>
			  		<a href="Controller_Tarifas" class="btn btn-info">
			  			<i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE TARIFAS
			  		</a>
			  	</li>
			  	<li>
			  		<a href="Controller_Tarifas?action=add" class="btn btn-success">
			  			<i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; REGISTRO DE TARIFAS
			  		</a>
			  	</li>
			</ul>
		</div>

		<!-- panel lista de  -->
		<div class="container-fluid">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE TARIFAS</h3>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<th class="text-center">ID</th>
									<th class="text-center">ID ESPECIALIDAD</th>
									<th class="text-center">SERVICIO</th>
									<th class="text-center">PRECIO</th>
									<th class="text-center">IMAGEN</th>
									<th class="text-center">NOMBRE ESPECIALIDAD</th>
									<th class="text-center">ESTADO</th>
									<th class="text-center">TIPO DE TARIFA</th>
									<th class="text-center">ACTUALIZAR</th>
									<th class="text-center">ELIMINAR</th>
								</tr>
							</thead>
							<tbody>
                                                            <%for(GenericClass cls:list){
                                                                String e[]=cls.getToString();
                                                            %>
								<tr>
									<td><%=e[2]%></td>
									<td><%=e[4]%></td>
									<td><%=e[6]%></td>
									<td><%=e[8]%></td>
									
                                                                        <td><img src="<%=request.getContextPath()%>/ControllerWrite?table=tarifas&fid=<%=e[2]%>" 
                                                                                 height="150" width="150"   ></td>
                                                                        <td><%=e[10]%></td>
                                                                        <td><%=e[12]%></td>
                                                                        <td><%=e[14]%></td>
									<td>
                                                                            <a href="Controller_Tarifas?action=edit&fid=<%=e[2]%>" class="btn btn-success btn-raised btn-xs">
											<i class="zmdi zmdi-refresh"></i>
										</a>
									</td>
									<td>
						
									<a href="Controller_Tarifas?action=eliminar&fid=<%=e[2]%>" class="btn btn-danger btn-raised btn-xs"
                                                                           onclick="return (confirm('Esta seguro de eliminar?'))">
									<i class="zmdi zmdi-delete"></i>
									</a>
									
									</td>
								</tr>
							<%}%>
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