<%@page import="java.sql.Date"%>
<%@page import="com.odontotech.utiles.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.odontotech.model.GenericClass"%>
<%
    List<GenericClass> list_son = (List<GenericClass>) request.getAttribute("lis_son");
    int var = 0;
    for (GenericClass cls : list_son) {
        var++;
    }
    List<GenericClass> list_doc = (List<GenericClass>) request.getAttribute("lis_doc");
    int var2 = 0;
    List<GenericClass> list_not = (List<GenericClass>) request.getAttribute("lis_not");
    for (GenericClass cls : list_not) {
        var2++;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Odonto Tech | CMC</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Proyecto Tecnologias Emergentes II">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- icono de la pagina. -->
        <link rel="icon" href="images/icon-odonto-tech.ico">        

        <!-- link de iconos. -->
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">

        <!-- link de estilos. -->
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/estilos.css">
    </head>
    <body>

        <div class="super_container">

            <!-- Menu de la pagina web -->
            <jsp:include page="META-INF/MenuWeb.jsp"></jsp:include>

                <!-- Carrusel de la pagina principal. -->
                <div class="home">

                    <!-- Principal y enlaces -->
                    <div class="hero_slider_container">
                        <div class="hero_slider owl-carousel">

                            <!-- Carrusel 1 -->
                            <div class="hero_slide">
                                <div class="hero_slide_background" style="background-image:url(images/fondo-doctor.jpg)"></div>
                                <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                                    <div class="hero_slide_content text-center">
                                        <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut"><span>1</span> Comenzamos</h1>
                                    </div>
                                </div>
                            </div>

                            <!-- Carrusel 2 -->
                            <div class="hero_slide">
                                <div class="hero_slide_background" style="background-image:url(images/fondo-pagina6.jpg)"></div>
                                <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                                    <div class="hero_slide_content text-center">
                                        <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">El <span>Mejor</span> Servicio</h1>
                                    </div>
                                </div>
                            </div>

                            <!-- Carrusel 3 -->
                            <div class="hero_slide">
                                <div class="hero_slide_background" style="background-image:url(images/fondo-pagina5.jpg)"></div>
                                <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                                    <div class="hero_slide_content text-center">
                                        <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Atencion de <span>Calidad</span></h1>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- pestañas de los costados. -->
                        <div class="hero_slider_left hero_slider_nav trans_200"><span class="trans_200"><i class="fas fa-chevron-left"></i></span></div>
                        <div class="hero_slider_right hero_slider_nav trans_200"><span class="trans_200"><i class="fas fa-chevron-right"></i></span></div>
                    </div>
                </div>

                <!-- Panel de ENLACES -->
                <div class="hero_boxes">
                    <div class="hero_boxes_inner">
                        <div class="container">
                            <div class="row">

                                <div class="col-lg-4 hero_box_col">
                                    <div class="hero_box d-flex flex-row align-items-center justify-content-start">
                                        <!-- <img src="images/earth-globe.svg" class="svg" alt=""> -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="svg" viewBox="0 0 496 512"><!-- Font Awesome Pro 5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><path d="M248 8C111 8 0 119 0 256s111 248 248 248 248-111 248-248S385 8 248 8zm141.4 389.4c-37.8 37.8-88 58.6-141.4 58.6s-103.6-20.8-141.4-58.6S48 309.4 48 256s20.8-103.6 58.6-141.4S194.6 56 248 56s103.6 20.8 141.4 58.6S448 202.6 448 256s-20.8 103.6-58.6 141.4zM328 152c-23.8 0-52.7 29.3-56 71.4-.7 8.6 10.8 11.9 14.9 4.5l9.5-17c7.7-13.7 19.2-21.6 31.5-21.6s23.8 7.9 31.5 21.6l9.5 17c4.1 7.4 15.6 4 14.9-4.5-3.1-42.1-32-71.4-55.8-71.4zm-201 75.9l9.5-17c7.7-13.7 19.2-21.6 31.5-21.6s23.8 7.9 31.5 21.6l9.5 17c4.1 7.4 15.6 4 14.9-4.5-3.3-42.1-32.2-71.4-56-71.4s-52.7 29.3-56 71.4c-.6 8.5 10.9 11.9 15.1 4.5zM362.4 288H133.6c-8.2 0-14.5 7-13.5 15 7.5 59.2 58.9 105 121.1 105h13.6c62.2 0 113.6-45.8 121.1-105 1-8-5.3-15-13.5-15z"/></svg>
                                        <div class="hero_box_content">
                                            <h2 class="hero_box_title">Sonrisa del Mes.</h2>
                                            <a href="#sonrisadelmes" class="hero_box_link">ver seccion -></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4 hero_box_col">
                                    <div class="hero_box d-flex flex-row align-items-center justify-content-start">
                                        <!-- <img src="images/books.svg" class="svg" alt=""> -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="svg" viewBox="0 0 512 512"><!-- Font Awesome Pro 5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><path d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 448c-110.532 0-200-89.431-200-200 0-110.495 89.472-200 200-200 110.491 0 200 89.471 200 200 0 110.53-89.431 200-200 200zm107.244-255.2c0 67.052-72.421 68.084-72.421 92.863V300c0 6.627-5.373 12-12 12h-45.647c-6.627 0-12-5.373-12-12v-8.659c0-35.745 27.1-50.034 47.579-61.516 17.561-9.845 28.324-16.541 28.324-29.579 0-17.246-21.999-28.693-39.784-28.693-23.189 0-33.894 10.977-48.942 29.969-4.057 5.12-11.46 6.071-16.666 2.124l-27.824-21.098c-5.107-3.872-6.251-11.066-2.644-16.363C184.846 131.491 214.94 112 261.794 112c49.071 0 101.45 38.304 101.45 88.8zM298 368c0 23.159-18.841 42-42 42s-42-18.841-42-42 18.841-42 42-42 42 18.841 42 42z"/></svg>
                                        <div class="hero_box_content">
                                            <h2 class="hero_box_title">Quienes Somos ?</h2>
                                            <a href="#quienessomos" class="hero_box_link">ver seccion -></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4 hero_box_col">
                                    <div class="hero_box d-flex flex-row align-items-center justify-content-start">
                                        <!-- <img src="images/professor.svg" class="svg" alt=""> -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="svg" viewBox="0 0 576 512"><!-- Font Awesome Pro 5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><path d="M552 64H112c-20.858 0-38.643 13.377-45.248 32H24c-13.255 0-24 10.745-24 24v272c0 30.928 25.072 56 56 56h496c13.255 0 24-10.745 24-24V88c0-13.255-10.745-24-24-24zM48 392V144h16v248c0 4.411-3.589 8-8 8s-8-3.589-8-8zm480 8H111.422c.374-2.614.578-5.283.578-8V112h416v288zM172 280h136c6.627 0 12-5.373 12-12v-96c0-6.627-5.373-12-12-12H172c-6.627 0-12 5.373-12 12v96c0 6.627 5.373 12 12 12zm28-80h80v40h-80v-40zm-40 140v-24c0-6.627 5.373-12 12-12h136c6.627 0 12 5.373 12 12v24c0 6.627-5.373 12-12 12H172c-6.627 0-12-5.373-12-12zm192 0v-24c0-6.627 5.373-12 12-12h104c6.627 0 12 5.373 12 12v24c0 6.627-5.373 12-12 12H364c-6.627 0-12-5.373-12-12zm0-144v-24c0-6.627 5.373-12 12-12h104c6.627 0 12 5.373 12 12v24c0 6.627-5.373 12-12 12H364c-6.627 0-12-5.373-12-12zm0 72v-24c0-6.627 5.373-12 12-12h104c6.627 0 12 5.373 12 12v24c0 6.627-5.373 12-12 12H364c-6.627 0-12-5.373-12-12z"/></svg>
                                        <div class="hero_box_content">
                                            <h2 class="hero_box_title">Noticias y Blogs</h2>
                                            <a href="#noticiasyblogs" class="hero_box_link">ver seccion -></a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- SONRISA DEL MES -->



                <div class="popular page_section" id="sonrisadelmes">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="section_title text-center">
                                    <h1>Sonrisa Del Mes</h1>
                                </div>
                            </div>
                        </div>

                        <div class="row course_boxes">
                        <%if (var == 0) {%>
                        <h1>NO HAY SONRISA DEL MES </h1>
                        <%} else {%>
                        <%for (GenericClass cls : list_son) {
                                String val[] = cls.getToString();
                        %>
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="<%=request.getContextPath()%>/ControllerWrite?table=sonrisa_del_mes&fid=<%=val[2]%>"
                                     height="200" width="200">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="#"><%=val[4]%></a></div>
                                    <div class="card-text"><%=val[8]%></div>
                                </div>
                                <div class="price_box d-flex flex-row align-items-center">
                                    <div class="course_author_image">
                                        <img src="images/perfil-doctor.jpg">
                                    </div>
                                    <div class="course_author_name">Dr.<%=val[6]%> | <span>
                                            <% for (GenericClass cls1 : list_doc) {
                                                    String val2[] = cls1.getToString();
                                                    if (val[10].equals(val2[2])) {%>
                                            <%=val2[8]%>
                                            <% }
                                                }%>

                                        </span></div>
                                </div>
                            </div>
                        </div>
                        <%}
                            }
                            /*else*/ %>


                    </div>		
                </div>
            </div>

            <!-- ¿QUIENES SOMOS? -->

            <div class="services page_section" id="quienessomos">

                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="section_title text-center">
                                <h1>¿Quienes Somos?</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row services_row">

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/earth-globe.svg" alt="">
                            </div>
                            <h3>MISION</h3>
                            <p>Combatir la desinformacion sobre el cuidado de dientes asi como inpirar y motivar al cuidado de los dientes. crear conciencia y hacer la diferencia.</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/exam.svg" alt="">
                            </div>
                            <h3>VISION</h3>
                            <p>Llegar a poner conciencia sobre el cuidado dental a los jovenes que estan mas activos en redes sociales e internet con esta apliacion web.</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/books.svg" alt="">
                            </div>
                            <h3>OBJETIVO GENERAL</h3>
                            <p>Generar una mejor sonrisa en las personas asi como una mejora en sus vidas y prevenir la caries que hay a nivel mundial.</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/professor.svg" alt="">
                            </div>
                            <h3>OBJETIVOS A CORTO PLAZO</h3>
                            <p>Generar un lugar web par que puedan informarse los jovenes adultos y niños para poder enseñar y que mejor forma que por internet.</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/blackboard.svg" alt="">
                            </div>
                            <h3>OBJETIVOS A LARGO PLAZO</h3>
                            <p>Desarrollar mas paginas similares que ayuden combatir la falta de informacion sobre le cuidado dental asi como un consultorio de manera virtual.</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/mortarboard.svg" alt="">
                            </div>
                            <h3>ANTECEDENTES</h3>
                            <p>Medicos que lograron unir fuerzas para desarrollar con la ayuda correspondiente esta pagina web que sea util para todo publico en general asi como acabar con la caries en jovenes y niños.</p>
                        </div>

                    </div>
                </div>
            </div>

            <!-- DESARROLLADORES -->

            <div class="testimonials page_section">
                <div class="testimonials_background_container prlx_parent">
                    <div class="testimonials_background prlx"></div>
                </div>
                <div class="container">

                    <div class="row">
                        <div class="col">
                            <div class="section_title text-center">
                                <h1>Desarrolladores</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">

                            <div class="testimonials_slider_container">

                                <!-- Testimonials Slider -->
                                <div class="owl-carousel owl-theme testimonials_slider">

                                    <!-- Testimonials Item -->
                                    <div class="owl-item">
                                        <div class="testimonials_item text-center">
                                            <div class="quote">“</div>
                                            <p class="testimonials_text">"NUNCA ES GRANDE EL QUE TRIUNFA, SINO EL QUE JAMAS SE RINDE"</p>
                                            <div class="testimonial_user">
                                                <div class="testimonial_image mx-auto">
                                                    <img src="images/desarroladores.jpg" alt="">
                                                </div>
                                                <div class="testimonial_name">Cristhian Villca Mamani</div>
                                                <div class="testimonial_title">Ingeniero De Sistemas | Desarrolladores Web</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonials Item -->
                                    <div class="owl-item">
                                        <div class="testimonials_item text-center">
                                            <div class="quote">“</div>
                                            <p class="testimonials_text">In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.</p>
                                            <div class="testimonial_user">
                                                <div class="testimonial_image mx-auto">
                                                    <img src="images/desarroladores.jpg" alt="">
                                                </div>
                                                <div class="testimonial_name">Cecilio Poma Muñoz</div>
                                                <div class="testimonial_title">Ingeniero De Sistemas | Desarrollador Backend</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonials Item -->
                                    <div class="owl-item">
                                        <div class="testimonials_item text-center">
                                            <div class="quote">“</div>
                                            <p class="testimonials_text">In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor fermentum.</p>
                                            <div class="testimonial_user">
                                                <div class="testimonial_image mx-auto">
                                                    <img src="images/desarroladores.jpg" alt="">
                                                </div>
                                                <div class="testimonial_name">Marcos Alejandro Berrios Pancata</div>
                                                <div class="testimonial_title">Ingeniero De Sistemas / Desarrollador Frontend</div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- NOTICIAS Y BLOGS -->

            <div class="events page_section" id="noticiasyblogs">
                <div class="container">

                    <div class="row">
                        <div class="col">
                            <div class="section_title text-center">
                                <h1>Noticias y Blogs</h1>
                            </div>
                        </div>
                    </div>

                    <div class="event_items">
                      
                        <% if(var2==0){%>
                   <h1>NO  HAY NOTICIAS Y BLOGS</h1>
                        <%} 
                       else {%>
                         <%   for (GenericClass cls : list_not) {
                                String val[] = cls.getToString();
                        %>
                        <div class="row event_item">
                            <div class="col">
                                <div class="row d-flex flex-row align-items-end">

                                    <div class="col-lg-2 order-lg-1 order-2">
                                        <div class="event_date d-flex flex-column align-items-center justify-content-center">
                                            <%Date fecha = Date.valueOf(val[8]); //para convertir String a  date%>
                                            <div class="event_day"><%=new DateFormat("dd", fecha).getDateConvert()%></div>
                                            <div class="event_month"><%=new DateFormat("MMMM", fecha).getDateConvert()%></div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 order-lg-2 order-3">
                                        <div class="event_content">
                                            <div class="event_name"><a class="trans_200" href="#"><%=val[4]%></a></div>
                                            <p><%=val[6]%></p>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 order-lg-3 order-1">
                                        <div class="event_image">
                                            <img src="<%=request.getContextPath()%>/ControllerWrite?table=noticias&fid=<%=val[2]%>" height="200" width="250">
                                        </div>
                                    </div>

                                </div>	
                            </div>
                        </div>

                        <%}
                        }/*else*/ %>


                    </div>

                </div>
            </div>

            <!-- Footer de las paginas web -->
            <jsp:include page="META-INF/FooterWeb.jsp"></jsp:include>
        </div>

        <!-- ENLACES JAVASCRIPT -->


        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>