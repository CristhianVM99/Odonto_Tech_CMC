

<%@page import="java.util.Base64"%>
<%@page import="com.odontotech.dao.genericDAOimplements"%>
<%@page import="com.odontotech.dao.genericDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.odontotech.model.GenericClass"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Odonto Tech | Doctores</title>
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
                            <<a href="#" class="btn-search">
                                <i class="zmdi zmdi-search"></i>
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- Contenido principal -->

                <div class="container-fluid">
                    <div class="page-header">
                        <h1 class="text-titles"><i class="zmdi zmdi-coffee zmdi zmdi-hc-fw"></i>  RESERVA DE CITAS <small>Consultorio</small></h1>
                    </div>
                    <p class="lead">En esta seccion administramos lo que son todas las reservas de citas que pertenecen al consultorio ODONTO TECH<br>a continuacion tenemos los siguientes registros.</p>
                </div>

                <div class="container-fluid">
                    <ul class="breadcrumb breadcrumb-tabs">
                        <li>
                            <a href="Controller_Reserva_De_Citas" class="btn btn-info">
                                <i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE CITAS
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- panel lista de doctores -->
                <div class="container-fluid">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE CITAS</h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover text-center">
                                    <thead>
                                        <tr>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">NOMBRE</th>
                                            <th class="text-center">DESCRIPCION</th>
                                            <th class="text-center">FECHA</th>
                                            <th class="text-center">HORA</th>
                                            <th class="text-center">CELULAR</th>                                                                        
                                            <th class="text-center">ESPECIALIDAD</th>
                                            <th class="text-center">SEVICIOS</th>
                                            <th class="text-center">ELIMINAR</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="c" items="${lista_citas}">
                                        <tr>
                                            <td>${ c.id }</td>
                                            <td>${ c.nombre_paciente }</td>
                                            <td>${ c.descripcion_consulta }</td>                                                                
                                            <td>${ c.fecha }</td>
                                            <td>${ c.hora }</td>
                                            <td>${ c.celular }</td>
                                            <c:forEach var="esp" items="${lista_especialidades}">
                                                <c:if test="${c.id_especialidad==esp.id}">
                                                    <td>${esp.nombre_especialidad}</td>                                                                        
                                                </c:if>
                                            </c:forEach>
                                            <td>${ c.servicios }</td>
                                            <td>
                                                <form>                                                                        
                                                    <a href="Controller_Reserva_De_Citas?action=delete&id=${c.id}" class="btn btn-danger btn-raised btn-xs">
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