<%@page import="java.sql.Date"%>
<%@page import="com.odontotech.utiles.DateFormat"%>
<%@page import="com.odontotech.model.Noticias"%>
<%
    Noticias n = (Noticias) request.getAttribute("noti");
    Date fechaActual = Date.valueOf(new DateFormat("yyyy-MM-dd").getDateHoy());
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
                        <h1 class="text-titles"><i class="zmdi zmdi-roller zmdi zmdi-hc-fw"></i> Noticias <small>Colsultorio</small></h1>
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
                            <a href="Controller_Noticias" class="btn btn-info">
                                <i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE NOTICIAS
                            </a>
                        </li>
                        <li>
                            <a href="Controller_Noticias?action=add" class="btn btn-success">
                                <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; REGISTRO DE NOTICIAS
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- panel datos de la empresa -->
                <div class="container-fluid">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp;
                            <c:if test="${valor=='nuevo'}" var="titulo" scope="request">
                                NUEVA
                            </c:if>
                            <c:if test="${requestScope.valor=='modificar'}" var="titulo"  scope="request">
                                EDITAR
                            </c:if>
                            NOTICIA
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="Controller_Noticias" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="fid" value="<%=n.getId()%>">

                            <!-- se debe recuperar el id del doctor de la tabla usuarios  -->
                       <!--  <input type="hidden" name="fid_doctor" value=<%=n.getId_doctor()%>>-->
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; Datos</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Titulo *</label>
                                                <input  class="form-control" type="text" name="ftitulo" required value="<%=n.getTitulo()%>">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Contenido *</label>
                                                <input  class="form-control" type="text" name="fcontenido" required  value="<%=n.getContenido()%>" >
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Fecha *</label>
                                                <c:if test="${noti.id==0}" var="fecha" >       
                                                    <input  class="form-control" type="date" name="ffecha" required value="<%=fechaActual%>" min="<%=fechaActual%>">
                                                </c:if>
                                                <c:if test="${noti.id!=0}" var="fecha" >       
                                                    <input  class="form-control" type="date" name="ffecha" required value="<%=n.getFecha()%>" min="<%=n.getFecha()%>">
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label">Nombre doctor *</label>
                                                <select name="fid_doctor" class="form-control" required>
                                                    <option value=""  >--Seleccione--</option>
                                                    <c:forEach var="valor_doctor" items="${lis_doc}">
                                                        <option value="${valor_doctor.id}"
                                                                <c:if test="${noti.id_doctor==valor_doctor.id}" var="sss">
                                                                    selected  
                                                                </c:if> 
                                                                >
                                                            ${valor_doctor.nombre}</option>
                                                        </c:forEach>   
                                                </select>
                                            </div>
                                        </div>   
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label">Estado *</label>
                                                <select name="festado" class="form-control" required>
                                                    <option value=""  >--Seleccione--</option>
                                                    <option value="habilitado" <%=n.getEstado().equals("habilitado") ? "selected" : ""%> >
                                                        Habilitado</option>
                                                    <option value="desabilitado"  <%=n.getEstado().equals("desabilitado") ? "selected" : ""%>>
                                                        Desabilidado</option>

                                                </select>
                                            </div>
                                        </div>   
                                        <div class="col-xs-12 ">
                                            <div class="form-group label-floating">

                                                <button class="btn btn-info btn-raised btn-sm"> 
                                                    <input class="form-control" type="file" name="fimagen" id="img"
                                                           <%=n.getId() == 0 ? "required" : ""%>  >
                                                    subir Imagen </button>
                                                <label class="form-group label-floating" id="vista">
                                                    <img src="<%=request.getContextPath()%>/ControllerWrite?table=noticias&fid=<%=n.getId()%>" height="250" width="250">

                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </fieldset>
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

