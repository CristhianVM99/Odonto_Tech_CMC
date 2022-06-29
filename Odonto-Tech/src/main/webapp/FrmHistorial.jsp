

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.odontotech.model.Pacientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

                <!-- Content principal -->

                <div class="container-fluid">
                    <div class="page-header">
                        <h1 class="text-titles"><i class="zmdi zmdi-balance zmdi-hc-fw"></i> Paciente - Historial <small>Consultorio</small></h1>
                    </div>
                    <p class="lead">En esta ocacion mostraremos lo que son los registros de los pascientes que hay en la clinica. <br>A continuacion tenemos los siguientes Registros.</p>
                </div>

                <div class="container-fluid">
                    <ul class="breadcrumb breadcrumb-tabs">
                        <li>
                            <a href="Controller_Historial?action=view&id=${id_registro}" class="btn btn-info">
                            <i class="zmdi zmdi-plus"></i> &nbsp; HISTORIAL
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Registro de Pascientes -->

            <div class="container-fluid">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; REGISTRO DEL PACIENTE</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Controller_Historial" method="POST">
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; Datos del Registro</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <input type="hidden" value="${historial.id}" name="id">
                                        <input type="hidden" value="${historial.ci_paciente}" name="ci_paciente">         
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label>Fecha de Registro</label>
                                                <input class="form-control" type="date" name="fecha" required="" maxlength="30" value="${historial.fecha}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label >Descripcion</label>                                                
                                                <textarea class="form-control" name="descripcion" rows="4" cols="170" placeholder="descripcion del registro..." >${historial.descripcion}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <p class="text-center" style="margin-top: 20px;">
                                <button type="submit" class="btn btn-info btn-raised btn-sm"><i class="zmdi zmdi-floppy"></i> Guardar Paciente</button>
                            </p>
                        </form>
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

