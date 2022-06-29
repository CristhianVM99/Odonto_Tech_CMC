
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
                    <h1 class="text-titles"><i class="zmdi zmdi-balance zmdi-hc-fw"></i> AdministraciÃ³n <small>EMPRESA</small></h1>
                </div>
                <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse voluptas reiciendis tempora voluptatum eius porro ipsa quae voluptates officiis sapiente sunt dolorem, velit quos a qui nobis sed, dignissimos possimus!</p>
            </div>

            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="ReservasDeCitas.jsp" class="btn btn-info">
                            <i class="zmdi zmdi-plus"></i> &nbsp; LISTA DE ESPECIALIDADES
                        </a>
                    </li>
                    <li>
                        <a href="FrmReservasDeCitas.jsp" class="btn btn-success">
                            <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; NUEVA ESPECIALIDAD
                        </a>
                    </li>
                </ul>
            </div>

            <!-- panel datos de la empresa -->
            <div class="container-fluid">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; DATOS DE LA EMPRESA</h3>
                    </div>
                    <div class="panel-body">
                        <form>
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; Datos bÃ¡sicos</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">DNI/CÃDIGO/NÃMERO DE REGISTRO *</label>
                                                <input pattern="[0-9-]{1,30}" class="form-control" type="text" name="dni-reg" required="" maxlength="30">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Nombre de la empresa *</label>
                                                <input pattern="[a-zA-Z0-9Ã¡Ã©Ã­Ã³ÃºÃÃÃÃÃÃ±Ã ]{1,40}" class="form-control" type="text" name="nombre-reg" required="" maxlength="40">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">TelÃ©fono</label>
                                                <input pattern="[0-9+]{1,15}" class="form-control" type="text" name="telefono-reg" maxlength="15">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">E-mail</label>
                                                <input class="form-control" type="email" name="email-reg" maxlength="50">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">DirecciÃ³n</label>
                                                <input class="form-control" type="text" name="direccion-reg" maxlength="170">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <br>
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment-o"></i> &nbsp; Otros datos</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Nombre del gerente o director *</label>
                                                <input pattern="[a-zA-Z0-9Ã¡Ã©Ã­Ã³ÃºÃÃÃÃÃÃ±Ã]{1,50}" class="form-control" type="text" name="director-reg" required="" maxlength="50">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">SÃ­mbolo de moneda *</label>
                                                <input class="form-control" type="text" name="moneda-reg" required="" maxlength="1">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">AÃ±o *</label>
                                                <input pattern="[0-9]{4,4}" class="form-control" type="text" name="year-reg" required="" maxlength="4">
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


