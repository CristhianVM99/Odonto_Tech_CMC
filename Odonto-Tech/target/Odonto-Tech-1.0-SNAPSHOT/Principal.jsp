<%@page import="com.odontotech.utiles.DateFormat"%>
<%@page import="com.odontotech.model.Reserva_De_Citas"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    List<Reserva_De_Citas> lista = (List<Reserva_De_Citas>) request.getAttribute("lista_citas");
    Date fec = null;
    int lado = 1;

%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Inicio | ODONTO TECH</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="./css/main.css">
    </head>
    <body>
        <!-- Menu -->
        <jsp:include page="META-INF/Menu.jsp"></jsp:include>

            <!-- Contenido Principal -->
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
                        <h1 class="text-titles">Rol Usuario <small>${rol}</small></h1>
                </div>
            </div>
            <div class="full-box text-center" style="padding: 30px 10px;">
                <article class="full-box tile">
                    <div class="full-box tile-title text-center text-titles text-uppercase">
                        Reserva de Citas
                    </div>
                    <div class="full-box tile-icon text-center">
                        <i class="zmdi zmdi-account"></i>
                    </div>
                    <div class="full-box tile-number text-titles">
                        <!cambiar valor con la base de datos de clientes!>
                        <p class="full-box">${cont_res}</p>
                        <small>Register</small>
                    </div>
                </article>
                <article class="full-box tile">
                    <div class="full-box tile-title text-center text-titles text-uppercase">

                        Doctores
                    </div>
                    <div class="full-box tile-icon text-center">
                        <i class="zmdi zmdi-male-alt"></i>
                    </div>

                    <!cambiar valor con la base de datos de clientes!>
                    <div class="full-box tile-number text-titles">
                        <p class="full-box">${cont_doc}</p>

                        <small>Register</small>
                    </div>
                </article>
                <article class="full-box tile">
                    <div class="full-box tile-title text-center text-titles text-uppercase">
                        Pacientes
                    </div>
                    <div class="full-box tile-icon text-center">
                        <i class="zmdi zmdi-face"></i>
                    </div>
                    <div class="full-box tile-number text-titles">
                        <!cambiar valor con la base de datos de clientes!>
                        <p class="full-box">${cont_pac}</p>
                        <small>Register</small>
                    </div>
                </article>
            </div>
            <div class="container-fluid">
                <div class="page-header">
                    <h1 class="text-titles">SISTEMA <small>Linea de Tiempo</small></h1>
                </div>


                <%                        for (Reserva_De_Citas re : lista) {
                        fec = re.getFecha();
                        System.out.println("" + fec);
                %>
                <section id="cd-timeline" class="cd-container">
                    <div class="cd-timeline-block">
                        <div class="cd-timeline-img">
                            <img src="assets/avatars/StudetMaleAvatar.png" alt="user-picture">
                        </div>
                        <%
                            if (lado % 2 != 0) {


                        %>
                        <div class="cd-timeline-content">
                            <h4 class="text-center text-titles"> paciente: <%= re.getNombre_paciente()%> (Cita)</h4>
                            <p class="text-center">
                                <i class="zmdi zmdi-timer zmdi-hc-fw"></i> Inicio: <em><%= re.getHora()%> AM</em> &nbsp;&nbsp;&nbsp; 
                            </p>
                            <%
                                /* for (Reserva_De_Citas re : lista) {
                                fec = re.getFecha();
                                System.out.println(""+ fec);
                            }*/
                            %>
                            <span class="cd-date"><i class="zmdi zmdi-calendar-note zmdi-hc-fw"></i> <%= new DateFormat("dd/MMMM/yyyy", fec).getDateConvert()%></span>
                        </div>
                    </div>  
                    <%
                    } else {
                    %>
                    <div class="cd-timeline-block" >
                        <div class="cd-timeline-img">
                            <img src="assets/avatars/StudetMaleAvatar.png" alt="user-picture">
                        </div>
                        <div class="cd-timeline-content">
                            <h4 class="text-center text-titles">Paciente: <%= re.getNombre_paciente()%> (Cita)</h4>
                            <p class="text-center">
                                <i class="zmdi zmdi-timer zmdi-hc-fw"></i> Start: <em><%= re.getHora()%></em> &nbsp;&nbsp;&nbsp; 
                                <%

                                %>
                            </p>
                            <span class="cd-date"><i class="zmdi zmdi-calendar-note zmdi-hc-fw"></i><%= new DateFormat("dd/MMMM/yyyy", fec).getDateConvert()%></span>
                        </div>
                    </div>
                    <%
                            }
                            lado = lado + 1;
                        }
                    %>

                    <!record de linea de tiempo!>








                </section>


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
