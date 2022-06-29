<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.odontotech.model.Doctores"%>
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
                <!-- Content page -->
                <div class="container-fluid">
                    <div class="page-header">
                        <h1 class="text-titles"><i class="zmdi zmdi-account-circle zmdi zmdi-hc-fw"></i>  Doctores <small>Consultorio</small></h1>
                    </div>
                    <p class="lead">En esta seccion administramos lo que son todos los doctores que pertenecen al consultorio ODONTO TECH<br>a continuacion tenemos los siguientes registros.</p>
                </div>

                <div class="container-fluid">
                    <ul class="breadcrumb breadcrumb-tabs">
                        <li>
                            <a href="Controller_Doctores" class="btn btn-info">
                                <i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE DOCTORES
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- panel datos de la empresa -->
                <div class="container-fluid">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; DATOS DEL DOCTOR</h3>
                        </div>
                        <div class="panel-body">
                            <form action="Controller_Doctores" method="POST" enctype="multipart/form-data">
                                <fieldset> 
                                    <legend><i class="zmdi zmdi-assignment"></i> &nbsp; Datos basicos</legend>
                                    <div class="container-fluid">
                                        <div class="row">
                                            <input type="hidden" name="id" value="${doctor.id}">
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">NOMBRE</label>
                                                <input class="form-control" type="text" name="nombre" required="" maxlength="30" value="${doctor.nombre}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">CI</label>
                                                <input class="form-control" type="text" name="ci" required="" maxlength="40" value="${doctor.ci}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 ">
                                            <div class="form-group label-floating">
                                                <label>Especialidad</label>
                                                <select class="form-select" name="id_especialidad">
                                                    <c:forEach var="esp" items="${lista_especialidades}">
                                                        <option value="${esp.id}"
                                                                <c:if test="${doctor.id_especialidad==esp.id}">
                                                                    selected
                                                                </c:if>
                                                                >${esp.nombre_especialidad}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Celular</label>
                                                <input class="form-control" type="text" name="celular" value="${doctor.celular}" maxlength="50">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Direccion</label>
                                                <input class="form-control" type="text" name="direccion" value="${doctor.direccion}" maxlength="50">
                                            </div>
                                        </div>    
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label>Imagen</label>
                                                <p>seleccione una Imagen.<br><input type="file" name="imagen" value="${doctor.imagen}" required=""></p>
                                                    <c:if test="${doctor.imagen ne null}">
                                                    <img src="<%=request.getContextPath()%>/Controller_Doctores?action=mostrarFoto&id=${doctor.id}&tabla=doctores" style="width: 100px;"/>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <br>
                            <p class="text-center" style="margin-top: 20px;">
                                <button type="submit" class="btn btn-info btn-raised btn-sm"><i class="zmdi zmdi-floppy"></i> Guardar</button>
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

