<%-- 
    Document   : MenuWeb
    Created on : 25 jun. de 2022, 11:46:02
    Author     : Cristian UPEA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- CABECERA -->

<header class="header d-flex flex-row">
    <div class="header_content d-flex flex-row align-items-center">

        <!-- LOGO PRINCIPAL -->

        <div class="logo_container">
            <div class="logo">
                <a href="Controller_Pagina_Web?view=view">
                    <img src="images/logo-4.png" alt="">
                    <span>Odonto Tech.</span>
                </a>

            </div>
        </div>

        <!-- MENU DE NAVEGACION -->
        <nav class="main_nav_container">
            <div class="main_nav">
                <ul class="main_nav_list">
                    <li class="main_nav_item menu_item--show">
                        <a href="Controller_Pagina_Web?view=view" class="menu_link">Odontologia<img src="images/arrow.svg" class="main_arrow"></a>
                        <ul class="main_nav_nesting">
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Dentista_De_Niños" class="main_link menu_link--inside">Dentista de Niños</a>
                            </li>
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Higiene_Dental" class="main_link menu_link--inside">Higiene Dental</a>
                            </li>
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Empastes_Dentales" class="main_link menu_link--inside">Empaste Dental</a>
                            </li>
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Puentes_Dentales" class="main_link menu_link--inside">Puentes Dentales</a>
                            </li>
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Coronas_Dentales" class="main_link menu_link--inside">Coronas Dentales</a>
                            </li>
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Extraccion_Dental" class="main_link menu_link--inside">Extraccion Dental</a>
                            </li>
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Dentadura_Postiza" class="main_link menu_link--inside">Dentadura Postisa</a>
                            </li>
                        </ul>
                    </li>
                    <li class="main_nav_item menu_item--show">
                        <a href="Controller_Pagina_Web?view=view" class="menu_link">Odontologia Cosmetica<img src="images/arrow.svg" class="main_arrow"></a>
                        <ul class="main_nav_nesting">
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Blanqueamiento_Dental" class="main_link menu_link--inside">Blanqueamieto Dental</a>
                            </li>
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Brakets" class="main_link menu_link--inside">Brakets</a>
                            </li>
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Carillas_Dentales" class="main_link menu_link--inside">Carrillas Dentales</a>
                            </li>
                            <li class="main_nav_nesting_inside">
                                <a href="Controller_Pagina_Web?view=Adhesion_Dental" class="main_link menu_link--inside">Adhesion Dental</a>
                            </li>
                        </ul>
                    </li>
                    <li class="main_nav_item"><a href="Controller_Pagina_Web?view=Tarifas">Tarifas</a></li>
                    <li class="main_nav_item"><a href="Controller_Pagina_Web?view=Promociones">Promociones</a></li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="header_side d-flex flex-row justify-content-center align-items-center">
        <img src="images/phone-call.svg">
        <a href="Controller_Pagina_Web?view=Reservar_Cita"> <span>Reservar Cita </span></a>
    </div>
    <div class="header_side d-flex flex-row justify-content-center align-items-center">
        <a href="Controller_Pagina_Web?view=Login"><i class="fas fa-user-md" style="color: #fff"></i></a>
    </div>

    <!-- Hamburger -->
    <div class="hamburger_container">
        <i class="fas fa-bars trans_200"></i>
    </div>
</header>

<!-- Menu -->
<div class="menu_container menu_mm">

    <!-- Menu Close Button -->
    <div class="menu_close_container">
        <div class="menu_close"></div>
    </div>

    <!-- Menu Items -->
    <div class="menu_inner menu_mm">
        <div class="menu menu_mm">
            <ul class="menu_list menu_mm">
                <h1>Servicios</h1>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Dentista_De_Niños" class="main_link menu_link--inside">Dentista de Niños</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Higiene_Dental" class="main_link menu_link--inside">Higiene Dental</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Empastes_Dentales" class="main_link menu_link--inside">Empaste Dental</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Puentes_Dentales" class="main_link menu_link--inside">Puentes Dentales</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Coronas_Dentales" class="main_link menu_link--inside">Coronas Dentales</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Extraccion_Dental" class="main_link menu_link--inside">Extraccion Dental</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Dentadura_Postiza" class="main_link menu_link--inside">Dentadura Postisa</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Blanqueamiento_Dental" class="main_link menu_link--inside">Blanqueamieto Dental</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Brakets" class="main_link menu_link--inside">Brakets</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Carillas_Dentales" class="main_link menu_link--inside">Carrillas Dentales</a>
                </li>
                <li class="menu_item menu_mm">
                    <a href="Controller_Pagina_Web?view=Adhesion_Dental" class="main_link menu_link--inside">Adhesion Dental</a>
                </li>
                <li class="menu_item menu_mm"><a href="Controller_Pagina_Web?view=Tarifas">Tarifas</a></li>
                <li class="menu_item menu_mm"><a href="Controller_Pagina_Web?view=Promociones">Promociones</a></li>
                <li class="menu_item menu_mm"><a href="Controller_Pagina_Web?view=Reservar_Cita"> <span>Reservar Cita</span></a></li>
            </ul>

            <!-- Menu Social -->
            <a href="Controller_Pagina_Web?view=Login" class="menu_social_item_login" ><i class="fas fa-user-md" style="color: #fff"></i></a>
            
      

            <div class="menu_copyright menu_mm">Colorlib All rights reserved</div>
        </div>

    </div>

</div>
