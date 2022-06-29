<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Course - Contact</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Course Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
    </head>
    <body>

        <div class="super_container">

            <!-- Menu de la pagina web -->
            <jsp:include page="META-INF/MenuWeb.jsp"></jsp:include>

                <!-- Home -->

                <div class="home">
                    <div class="home_background_container prlx_parent">
                        <div class="home_background prlx" style="background-image:url(images/fondo-pagina2.jpg)"></div>
                    </div>
                    <div class="home_content">
                        <h1>Reservar Cita</h1>
                    </div>
                </div>

                <!-- Contact -->

                <div class="contact">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">

                                <!-- Contact Form -->
                                <div class="contact_form">
                                    <div class="contact_title">Registrar Consulta</div>

                                    <div class="contact_form_container">
                                        <form action="Controller_Pagina_Web" method="POST">
                                            <input type="hidden" name="id" value="0">
                                            <input id="contact_form_name" class="input_field contact_form_name" type="text" name="nombre_paciente" placeholder="Nombre del paciente" required="required">
                                            <textarea id="contact_form_message" class="text_field contact_form_message" name="descripcion_consulta" placeholder="Descripcion de la consulta" required="required"></textarea>
                                            <input id="contact_form_name" class="input_field contact_form_name" type="text" name="celular" placeholder="Ingrese su Celular" required="required">
                                            <label>Ingrese Fecha</label>
                                            <input id="contact_form_name" class="input_field contact_form_name" type="date" name="fecha" placeholder="" required="required">
                                            <select class="form-control" style="color:#000;margin-bottom: 30px;" aria-label="Default select example" name="hora">
                                                <option selected>Escoge tu Turno</option>
                                                <option>MAÑANA 8:00 a 11:00</option>
                                                <option>TARDE 14:00 a 17:00</option>
                                                <option>NOCHE 19:00 a 22:00</option>
                                            </select>
                                            <select class="form-control" style="color:#000;margin-bottom: 30px;" aria-label="Default select example" name="id_especialidad">
                                                <option selected>Escoge la Especialidad</option>    
                                            <c:forEach var="esp" items="${lista_especialidades}">
                                                <option value="${esp.id}">
                                                    ${esp.nombre_especialidad}
                                                </option>
                                            </c:forEach>
                                            </select>
                                        <select class="form-control" style="color:#000;margin-bottom: 30px;" aria-label="Default select example" name="servicios">
                                            <option selected>Escoge el Servicio</option>
                                            <option>Dentista de Niños</option>
                                            <option>Higiene Dental</option>
                                            <option>Empastes Dentales</option>
                                            <option>Puentes Dentales</option>
                                            <option>Coronas Dentales</option>
                                            <option>Extraccion Dental</option>
                                            <option>Dentadura Postiza</option>
                                            <option>Empastes Dentales</option>
                                            <option>Blanqueamiento Dental</option>
                                            <option>Brakets</option>
                                            <option>Carrillas Dentales</option>
                                            <option>Adhesion Dental</option>
                                        </select>								
                                        <button id="contact_send_btn" type="Sumnit" class="contact_send_btn trans_200">Enviar Registro.</button>
                                    </form>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-4">
                            <div class="about">
                                <div class="about_title">Odonto Tech | consultoria por la web</div>
                                <p class="about_text">Antes que todo queremos recomendarte que nos espreses tus malestares para que nuestro equipo pueda atenderte de mejor manera y asi tener una mejor calidad de servicio hacia los clientes.</p>

                                <div class="contact_info">
                                    <ul>
                                        <li class="contact_info_item">
                                            <div class="contact_info_icon">
                                                <img src="images/placeholder.svg">
                                            </div>
                                            Universidad Publica Del El Alto
                                        </li>
                                        <li class="contact_info_item">
                                            <div class="contact_info_icon">
                                                <img src="images/smartphone.svg">
                                            </div>
                                            +501 752752967
                                        </li>
                                        <li class="contact_info_item">
                                            <div class="contact_info_icon">
                                                <img src="images/envelope.svg">
                                            </div>
                                            CMC@gmail.com
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Footer de las paginas web -->
            <jsp:include page="META-INF/FooterWeb.jsp"></jsp:include>

        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/contact_custom.js"></script>

    </body>
</html>