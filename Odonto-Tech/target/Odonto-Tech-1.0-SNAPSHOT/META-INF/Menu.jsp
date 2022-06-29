
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- SideBar -->
<section class="full-box cover dashboard-sideBar">
    <div class="full-box dashboard-sideBar-bg btn-menu-dashboard"></div>
    <div class="full-box dashboard-sideBar-ct">
        <!--SideBar Title -->
        <div class="full-box text-uppercase text-center text-titles dashboard-sideBar-title">
            <a href="Principal.jsp"><span style="text-decoration: none;color: #fff;list-style: none;">Odonto Tech </span></a><i class="zmdi zmdi-close btn-menu-dashboard visible-xs"></i>
        </div>
        <!-- SideBar User info -->
        <div class="full-box dashboard-sideBar-UserInfo">
            <figure class="full-box">
                <img src="./assets/avatars/AdminMaleAvatar.png" alt="UserIcon">
                <figcaption class="text-center text-titles">Bienvenido</figcaption>
            </figure>
            <ul class="full-box list-unstyled text-center">
                <li>
                    <a href="Controller_Pagina_Web?view=view" >
                        <i class="zmdi zmdi-power"></i>
                    </a>
                </li>
               
            </ul>
        </div>
        <!-- SideBar Menu -->
        <ul class="list-unstyled full-box dashboard-sideBar-Menu">
            <li>
                <a href="#!" class="btn-sideBar-SubMenu">
                    <i class="zmdi zmdi-case zmdi-hc-fw"></i> Administración <i class="zmdi zmdi-caret-down pull-right"></i>
                </a>
                <ul class="list-unstyled full-box">
                    <li>
                        <a href="Controller_especialidades"><i class="zmdi zmdi-case zmdi-hc-fw"></i> Especialidades </a>
                    </li>
                    <li>
                        <a href="Controller_Almacen"><i class="zmdi zmdi-truck zmdi-hc-fw"></i> Almacen</a>
                    </li>
                    <li>
                        <a href="Controller_Promociones"><i class="zmdi zmdi-label zmdi zzmdi-hc-fw"></i> Promociones </a>
                    </li>
                    <li>
                        <a href="Controller_Noticias"><i class="zmdi zmdi-roller zmdi zmdi-hc-fw"></i> Noticias </a>
                    </li>
                    <li>
                        <a href="Controller_Sonrisa_Del_Mes"><i class="zmdi zmdi-pizza zmdi zmdi-hc-fw"></i> Sonrisa Del Mes </a>
                    </li>
                    <li>
                        <a href="Controller_Tarifas"><i class="zmdi zmdi-card zmdi zmdi-hc-fw"></i> Tarifa </a>
                    </li>
                    <li>
                        <a href="Controller_Reserva_De_Citas"><i class="zmdi zmdi-coffee zmdi zmdi-hc-fw"></i> Reservas De Citas </a>
                    </li>
                    <li>
                        <a href="Controller_Pacientes"><i class="zmdi zmdi-account zmdi zmdi-hc-fw"></i> Pascientes </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#!" class="btn-sideBar-SubMenu">
                    <i class="zmdi zmdi-account-add zmdi-hc-fw"></i> Usuarios <i class="zmdi zmdi-caret-down pull-right"></i>
                </a>
                <ul class="list-unstyled full-box">
                    <li>
                        <a href="Controller_Doctores"><i class="zmdi zmdi-account-circle zmdi zmdi-hc-fw"></i> Administradores - Doctores</a>
                    </li>
                     <li>
                        <a href="Controller_Usuarios"><i class="zmdi zmdi-account-circle zmdi zmdi-hc-fw"></i> Usuarios </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</section>
