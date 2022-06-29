<%@page import="java.util.List"%>
<%@page import="com.odontotech.model.GenericClass"%>
<%
    List<GenericClass> list = (List<GenericClass>) request.getAttribute("li");


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

                <!-- panel lista de empresas -->
                <div class="container-fluid">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE SONRISAS DEL MES</h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover text-center">
                                    <thead>
                                        <tr>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">NOMBRE PACIENTE</th>
                                            <th class="text-center">NOMBRE DOCTOR</th>
                                            <th class="text-center">IMAGEN</th>
                                            <th class="text-center">DESCRIPCION</th>
                                            <th class="text-center">ID DOCTOR</th>
                                            <th class="text-center">CI PACIENTE</th>
                                            <th class="text-center">ESTADO</th>
                                            <th class="text-center">ACTUALIZAR</th>
                                            <th class="text-center">ELIMINAR</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for (GenericClass cls : list) {
                                            String v[] = cls.getToString();
                                    %>
                                    <tr>
                                        <td><%=v[2]%></td>
                                        <td><%=v[4]%></td>
                                        <td><%=v[6]%></td>
                                        <td><img src="<%=request.getContextPath()%>/ControllerWrite?table=sonrisa_del_mes&fid=<%=v[2]%>" height="150" width="150"></td>
                                        <td><%=v[8]%></td>
                                        <td><%=v[10]%></td>
                                        <td><%=v[12]%></td>
                                        <td><%=v[14]%></td>
                                        <td>
                                            <a href="Controller_Sonrisa_Del_Mes?action=edit&fid=<%=v[2]%>" class="btn btn-success btn-raised btn-xs">
                                                <i class="zmdi zmdi-refresh"></i>
                                            </a>
                                        </td>
                                        <td>

                                            <a href="Controller_Sonrisa_Del_Mes?action=remove&fid=<%=v[2]%>" class="btn btn-danger btn-raised btn-xs"
                                               onclick="return(confirm('Esta seguro de eliminar?'))">
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