
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
                        <h1 class="text-titles"><i class="zmdi zmdi-account zmdi zmdi-hc-fw"></i> Pacientes <small>Consultorio</small></h1>
                    </div>
                    <p class="lead">En esta ocacion mostraremos lo que son los registros de los pascientes que hay en la clinica. <br>A continuacion tenemos los siguientes Registros.</p>
                </div>

                <div class="container-fluid">
                    <ul class="breadcrumb breadcrumb-tabs">
                        <li>
                            <a href="Controller_Pacientes" class="btn btn-info">
                                <i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE PACIENTES
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Registro de Pascientes -->

                <div class="container-fluid">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; DATOS DEL PASCIENTE</h3>
                        </div>
                        <div class="panel-body">
                            <form action="Controller_Pacientes" method="POST" enctype="multipart/form-data">
                                <fieldset>
                                    <legend><i class="zmdi zmdi-assignment"></i> &nbsp; Datos Basicos</legend>
                                    <div class="container-fluid">
                                        <div class="row">
                                            <input type="hidden" name="valor" value="${valor}">
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Ingrese su Nombre</label>
                                                <input class="form-control" type="text" name="nombre" required="" maxlength="30" value="${paciente.nombre}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Ingrese su Ci</label>
                                                <input class="form-control" type="${visibilidad}" name="ci" required="" maxlength="30" value="${paciente.ci}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label>Fecha de Inicio</label>
                                                <input class="form-control" type="date" name="fecha_inicio" required="" maxlength="30" value="${paciente.fecha_inicio}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label >Descripcion</label>                                                
                                                <textarea class="form-control" name="descripcion" rows="4" cols="170" placeholder="descripcion del paciente..." >${paciente.descripcion}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Celular</label>
                                                <input class="form-control" type="text" name="celular" value="${paciente.celular}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label>Servicio</label>
                                                <select id="form-control" name="servicio">
                                                    <option 
                                                        <c:if test="${paciente.servicio=='Dentista de Niños'}">
                                                            selected
                                                        </c:if>
                                                        >Dentista de Niños</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Higiene Dental'}">
                                                            selected
                                                        </c:if>
                                                        >Higiene Dental</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Empaste Dentales'}">
                                                            selected
                                                        </c:if>
                                                        >Empastes Dentales</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Puentes Dentales'}">
                                                            selected
                                                        </c:if>
                                                        >Puentes Dentales</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Coronas Dentales'}">
                                                            selected
                                                        </c:if>
                                                        >Coronas Dentales</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Extraccion Dental'}">
                                                            selected
                                                        </c:if>
                                                        >Extraccion Dental</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Dentadura Postisa'}">
                                                            selected
                                                        </c:if>
                                                        >Dentadura Postisa</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Blanqueamiento Dental'}">
                                                            selected
                                                        </c:if>
                                                        >Blanqueamiento Dental</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Brakets'}">
                                                            selected
                                                        </c:if>
                                                        >Brakets</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Carrillas Dentales'}">
                                                            selected
                                                        </c:if>
                                                        >Carrillas Dentales</option>
                                                    <option
                                                        <c:if test="${paciente.servicio=='Adhesion Dental'}">
                                                            selected
                                                        </c:if>
                                                        >Adhesion Dental</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Direccion</label>
                                                <input class="form-control" type="text" name="direccion" maxlength="170" value="${paciente.direccion}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label>Imagen</label>
                                                <p>seleccione una Imagen.<br><input type="file" name="imagen" value="${paciente.imagen}"></p>
                                                    <c:if test="${paciente.imagen ne null}">
                                                    <img src="<%=request.getContextPath()%>/Controller_Pacientes?action=mostrarFoto&id=${paciente.ci}&tabla=pacientes" style="width: 100px;"/>
                                                </c:if>
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

