<%
    String v = (String) request.getAttribute("val");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <h1 class="text-titles"><i class="zmdi zmdi-account-circle zmdi zmdi-hc-fw"></i>  Usuarios <small>Consultorio</small></h1>
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
                            <a href="Controller_Usuarios" class="btn btn-info">
                                <i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE USUARIOS
                            </a>
                        </li>
                        <li>
                            <a href="Controller_Usuarios?action=add" class="btn btn-success">

                                <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; REGISTRO DE USUARIOS
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- panel datos de la empresa -->
                <div class="container-fluid">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; 
                            <%if (v.equals("Guardar")) {%>
                            Nuevo
                            <%}%>
                            <%if (v.equals("Modificar")) {%>
                            Modificar
                            <%}%>
                            Usuario
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="Controller_Usuarios" method="post" >
                            <input type="hidden" name="fid" value="${usuar.id}">
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; Datos</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label">Nombre Doctor *</label>
                                                <select name="fid-doctor" class="form-control" requiered>
                                                    <option value="">--Seleccione--</option>
                                                    <c:forEach var="pac" items="${doc}">
                                                        <option value="${pac.id}"<c:if test="${pac.id==usuar.id_doctor}" var="sel">selected</c:if> >
                                                            ${pac.nombre}</option> 
                                                        </c:forEach>
                                                </select>                 
                                            </div>
                                        </div>

                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Usuario *</label>
                                                <input  class="form-control" type="text" name="fusuario" required value="${usuar.usuario}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Contraseña *</label>
                                                <input  class="form-control" type="password" name="fpassword" required value="${usuar.password}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Correo *</label>
                                                <input  class="form-control" type="email" name="fcorreo" required value="${usuar.correo}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Rol *</label>
                                                <input  class="form-control" type="text" name="frol" required value="${usuar.rol}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <br>
                            <p class="text-center" style="margin-top: 20px;">
                                <button type="submit" class="btn btn-info btn-raised btn-sm" value="<%=v%>" name="fpeticion"><i class="zmdi zmdi-floppy"></i>
                                    Guardar</button>
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
        <script src="./js/previewfile.js"></script>
        <script>
            $.material.init();
        </script>
    </body>
</html>

