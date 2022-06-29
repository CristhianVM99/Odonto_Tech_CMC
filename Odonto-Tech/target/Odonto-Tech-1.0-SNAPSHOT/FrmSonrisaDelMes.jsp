<%
    String val = (String) request.getAttribute("valor");

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
                        <h1 class="text-titles"><i class="zmdi zmdi-pizza zmdi zmdi-hc-fw"></i> Sonrisa del mes <small>Consultorio</small></h1>
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
                            <a href="Controller_Sonrisa_Del_Mes" class="btn btn-info">
                                <i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE SONRISAS DEL MES
                            </a>
                        </li>
                        <li>
                            <a href="Controller_Sonrisa_Del_Mes?action=add" class="btn btn-success">
                                <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; REGISTRO DE SONRISAS DEL MES
                            </a>
                        </li>

                    </ul>
                </div>

                <!-- panel datos de la empresa -->
                <div class="container-fluid">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; 
                            <%=(val.equals("nuevo")) ? "NUEVA" : ""%>

                            <%=(val.equals("modificar")) ? "MODIFICAR LA" : ""%>

                            SONRISA DEL MES
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="Controller_Sonrisa_Del_Mes" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="fid" value="${sonrisa.id}">


                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; Datos</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label">Nombre paciente *</label>
                                                <select name="fci-paciente" class="form-control" requiered>
                                                    <option value="">--Seleccione--</option>
                                                    <c:forEach var="pac" items="${paciente}">
                                                        <option value="${pac.ci}"<c:if test="${pac.ci==sonrisa.ci_paciente}" var="sel">selected</c:if> >
                                                            ${pac.nombre}</option> 
                                                        </c:forEach>
                                                </select>                 
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label">Nombre doctor *</label>
                                                <select name="fid-doctor" class="form-control" required>
                                                    <option value=""  >--Seleccione--</option>
                                                    <c:forEach var="valor_doctor" items="${li_doc}">
                                                        <option value="${valor_doctor.id}"
                                                                <c:if test="${sonrisa.id_doctor==valor_doctor.id}" var="ss">
                                                                    selected  
                                                                </c:if> 
                                                                >
                                                            ${valor_doctor.nombre}</option>
                                                        </c:forEach>   
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Descripcion *</label>
                                                <input  class="form-control" type="text" name="fdescripcion" required value="${sonrisa.descripcion}">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label">Estado *</label>
                                                <select name="festado" class="form-control" required>
                                                    <option value=""  >--Seleccione--</option>
                                                    <option value="habilitado" <c:if test="${sonrisa.estado=='habilitado'}" var="vv">selected </c:if>>
                                                            Habilitado</option>
                                                        <option value="desabilitado"  <c:if test="${sonrisa.estado=='desabilitado'}" var="vv">selected </c:if> >
                                                            Desabilidado</option>

                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group label-floating">       
                                                    <button class="btn btn-info btn-raised btn-sm">
                                                        <input class="form-control" type="file" name="fimagen" id="img" 
                                                        <c:if test="${sonrisa.id==0}" var="req"> required</c:if> >
                                                        Subir Imagen</button>
                                                    <label class="form-group label-floating" id="vista">
                                                        <img src="<%=request.getContextPath()%>/ControllerWrite?table=sonrisa_del_mes&fid=${sonrisa.id}"
                                                         height="250" width="250">              
                                                </label>
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
        <script src="./js/previewfile.js"></script>
        <script>
            $.material.init();
        </script>
    </body>
</html>

