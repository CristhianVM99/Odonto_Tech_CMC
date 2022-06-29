
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">       
        <link rel="stylesheet" href="./css/main.css">
        <title>Empresa</title>
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
                        <h1 class="text-titles"><i class="zmdi zmdi-label zmdi zzmdi-hc-fw"></i> Promociones <small>Contultorio</small></h1>
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
                            <a href="Controller_Promociones" class="btn btn-info">
                                <i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE PROMOCIONES
                            </a>
                        </li>
                        <li>
                            <a href="Controller_Promociones?action=add" class="btn btn-success">
                                <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp;REGISTRO DE PROMOCIONES
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- panel datos de la empresa -->
                <div class="container-fluid">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp;
                            <c:if test="${requestScope.action=='nuevo'}" var="subtitulo" scope="request">
                                NUEVA              
                            </c:if>  
                            <c:if test="${requestScope.action=='editar'}" var="subtitulo" scope="request">
                                MODIFICAR    
                            </c:if>
                            PROMOCION
                        </h3>     
                    </div>
                    <div class="panel-body">
                        <form action="Controller_Promociones"  method="post" enctype="multipart/form-data">
                            <input type="hidden" name="fid" value="${promo.id}">
                         
                           
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; Datos</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label">Servicio *</label>
                                                <select class="form-control" name="fservicio" required>
                                                    <option value="">--Seleccione--</option>
                                                    <option 
                                                        <c:if test="${promo.servicio=='Dentista de Niños'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Dentista de Niños</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Higiene Dental'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Higiene Dental</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Empaste Dentales'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Empastes Dentales</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Puentes Dentales'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Puentes Dentales</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Coronas Dentales'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Coronas Dentales</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Extraccion Dental'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Extraccion Dental</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Dentadura Postisa'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Dentadura Postisa</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Blanqueamiento Dental'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Blanqueamiento Dental</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Brakets'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Brakets</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Carrillas Dentales'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Carrillas Dentales</option>
                                                    <option
                                                        <c:if test="${promo.servicio=='Adhesion Dental'}" var="serv">
                                                        selected
                                                        </c:if>
                                                        >Adhesion Dental</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Precio *</label>
                                                <input  class="form-control" type="number" name="fprecio" step="0.01" value="${promo.precio}" required>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <!-- Se debe obtener el valor  de la lista especialidades--> 
                                                <label class="control-label">Nombre Especialidad *</label>
                                                <select name="fid_especialidad" class="form-control">
                                                    <option value="">--Seleccione--</option>
                                                    <c:forEach var="es" items="${lis_es}">
                                           <option value="${es.id}"
                                                   <c:if test="${es.id==promo.id_especialidad}" var="espe">selected</c:if>
                                                   >${es.nombre_especialidad}</option>
                                                    </c:forEach>
                                            </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="control-label">Estado *</label>
                                                <select name="festado" class="form-control" required>
                                                    <option value=""  >--Seleccione--</option>
                                                    <option value="habilitado" <c:if test="${promo.estado=='habilitado'}">selected</c:if> >
                                                        Habilitado</option>
                                                    <option value="desabilitado" <c:if test="${promo.estado=='desabilitado'}">selected</c:if>  >
                                                        Desabilidado</option>

                                                </select>
                                            </div>
                                        </div>  
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <button   class="btn btn-info btn-raised btn-sm"
                                                          ><input  class="form-control" type="file" name="fimagen" id="img"  
                                                         <c:if test="${promo.id==0}">required</c:if> >Subir Imagen *</button>
                                                <label class="form-group label-floating" id="vista"> 
                                                    <img src="<%=request.getContextPath()%>/ControllerWrite?table=promociones&fid=${promo.id}" height="250" width="250"/>
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

