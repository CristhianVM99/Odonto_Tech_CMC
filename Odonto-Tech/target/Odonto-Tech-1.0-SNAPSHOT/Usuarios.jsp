
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                <!-- panel lista de empresas -->
                <div class="container-fluid">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE USUARIOS</h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover text-center">
                                    <thead>
                                        <tr>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">NOMBRE DOCTOR</th>
                                            <th class="text-center">USUARIO</th>
                                            <th class="text-center">CORREO</th>
                                            <th class="text-center">ROL</th>
                                            <th class="text-center">ACTUALIZAR</th>
                                            <th class="text-center">ELIMINAR</th>
                                        </tr>
                                    </thead>
                                <c:forEach var="e" items="${usu}">
                                    <tr>
                                        <td>${e.id}</td>
                                        <td>${e.nombre_doctor}</td>
                                        <td>${e.usuario}</td>
                                        <td>${e.correo}</td>
                                        <td>${e.rol}</td>                   
                                        <td>
                                            <a href="Controller_Usuarios?action=edit&fid=${e.id}" class="btn btn-success btn-raised btn-xs">
                                                <i class="zmdi zmdi-refresh"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="Controller_Usuarios?action=delete&fid=${e.id}" class="btn btn-danger btn-raised btn-xs"
                                               onclick="return(confirm('Esta seguro de eliminar?'))">
                                                <i class="zmdi zmdi-delete"></i>
                                            </a>

                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <nav class="text-center">
                            <ul class="pagination pagination-sm">
                                <li class="disabled"><a href="javascript:void(0)">«</a></li>
                                <li class="active"><a href="javascript:void(0)">1</a></li>
                                <li><a href="javascript:void(0)">2</a></li>
                                <li><a href="javascript:void(0)">3</a></li>
                                <li><a href="javascript:void(0)">4</a></li>
                                <li><a href="javascript:void(0)">5</a></li>
                                <li><a href="javascript:void(0)">»</a></li>
                            </ul>
                        </nav>
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