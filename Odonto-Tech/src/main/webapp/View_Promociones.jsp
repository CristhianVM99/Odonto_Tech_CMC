<%@page import="java.util.List"%>
<%@page import="com.odontotech.model.GenericClass"%>
<%
    List<GenericClass> lis_pro=(List<GenericClass>)request.getAttribute("lis_pro");
    int cont=0;
    for(GenericClass cls: lis_pro){
        cont++;
    }
    %>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Promociones</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Course Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/courses_styles.css">
<link rel="stylesheet" type="text/css" href="styles/courses_responsive.css">
</head>
<body>

<div class="super_container">

        <!-- Menu de la pagina web -->
        <jsp:include page="META-INF/MenuWeb.jsp"></jsp:include>
	
	<!-- Home -->

	<div class="home">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx" style="background-image:url(images/fondo-pagina4.jpg)"></div>
		</div>
		<div class="home_content">
			<h1>Promociones</h1>
		</div>
	</div>

	<!-- Popular -->

	<div class="popular page_section">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h1>Promociones en ODONTO TECH</h1>
					</div>
				</div>
			</div>

			<div class="row course_boxes">
                            <%if(cont==0){%>
                            <h1>NO HAY PROMOCIONES DISPONIBLES </h1>
                            <%}else {%>
				<%for(GenericClass cls:lis_pro){
                                   String val[]=cls.getToString();
                                %>
				<!-- Popular Course Item -->
				<div class="col-lg-4 course_box">
					<div class="card">
                                            <img class="card-img-top" src="<%=request.getContextPath()%>/ControllerWrite?table=promociones&fid=<%=val[2]%>" alt="https://unsplash.com/@kellybrito"
                                                 height="200" width="200">
						<div class="card-body text-center">
							<div class="card-title"><a href="courses.html"><%=val[4]%></a></div>
							
						</div>
						<div class="price_box d-flex flex-row align-items-center">
						
							<div class="course_author_name"><%=val[10]%> |<span>Odonto Tech</span></div>
							<div class="course_price d-flex flex-column align-items-center justify-content-center"><span>Bs.<%=val[6]%></span></div>
						</div>
					</div>
				</div>
                    <%}
                       }%>
                    
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
<script src="plugins/easing/easing.js"></script>
<script src="js/courses_custom.js"></script>

</body>
</html>