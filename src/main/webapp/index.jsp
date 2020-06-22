<%-- 
    Document   : index
    Created on : 12/09/2018, 07:12:56 PM
    Author     : ALUMNO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
response.setHeader("Pragma", "no-cache");
response.addHeader("Cache-control", "must-revalidate");
response.addHeader("Cache-control", "no-cache");
response.addHeader("Cache-control", "no-store");
response.setDateHeader("Expires", 0);
%> 
<html class="no-js"> 
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>I.E.P INMACULADA CONCEPCIÓN</title>
        <link rel="shortcut icon"  href="img/cole.ico" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="colegio,inmaculada concepcion" />
	<meta name="author" content="Equipo de desarrollo web uch" />

	<!-- Animate.css (Animacion de las letras con efectos) -->
	<link rel="stylesheet" href="estilospag/css/animate.css">
	<!-- Icomoon Icon Fonts (Iconos de algunas cosas)-->
	<link rel="stylesheet" href="estilospag/css/icomoon.css">
	<!-- Simple Line Icons (Icono de la Mision)-->
	<link rel="stylesheet" href="estilospag/css/simple-line-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="estilospag/css/bootstrap.css">
	<!-- Styleswitcher (Estilos necesarios de la misma pagina) -->
	<link rel="stylesheet" id="theme-switch" href="estilospag/css/style.css">
	<!-- Modernizr JS (JS Necesario)-->
	<script src="estilospag/js/modernizr-2.6.2.min.js"></script>

	</head>
	<body>
	<header role="banner" id="fh5co-header">
			<div class="container">
				<!-- <div class="row"> -->
			    <nav class="navbar navbar-default">
		        <div class="navbar-header">
		        	<!-- Boton hamburgesa -->
			<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
		        	 <a class="navbar-brand" href="index.jsp" style="color: #f7f1e3">INM. CONCEPCIÓN</a> 
		        </div>
		        <div id="navbar" class="navbar-collapse collapse">
		          <ul class="nav navbar-nav navbar-right">
		            <li class="active"><a href="#" data-nav-section="inicio"><span>Inicio</span></a></li>
		            <li><a href="#" data-nav-section="mensaje"><span>Mensaje</span></a></li>
		            <li><a href="#" data-nav-section="informacion"><span>Información</span></a></li>
                            
		          </ul>
                            
		        </div>
			    </nav>
			  <!-- </div> -->
		  </div>
	</header>
         
	<section id="fh5co-home" data-section="inicio" style="background-image: url(estilospag/images/9223030.jpg);" data-stellar-background-ratio="0.5"> <!--IMAGEN FONDO INICIO-->
		<div class="gradient"></div> <!--EFECTO DEGRADADO-->
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h1 class="to-animate" style="color:#f39c12">COLEGIO I.E.P INMACULADA CONCEPCIÓN</h1>
							<h2 class="to-animate" style="color: #dcdde1">
							"Institución Educativa formando personas para la vida"</h2>
                                                        <p></p>
                                                        <a class="btn btn-success to-animate" href="login.jsp">Ingresar</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="slant"></div>
	</section>

	<section id="fh5co-intro">
		<div class="container">
			<div class="row row-bottom-padded-lg">
				<div class="fh5co-block to-animate" style="background-image: url(images/cic1.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<i class="fh5co-intro-icon icon-bulb"></i>
						<h2>MISIÓN</h2>
						<p>Brindar a los estudiantes un servicio exhaustivo de calidad acorde a las exigencias competitivas del mundo globalizado, desarrollando en nuestros estudiantes una formación integral potenciando sus capacidades y habilidades a través de estrategias metodologías y una propuesta curricular innovadora acorde a la realidad y necesidades que permiten a nuestros estudiantes responder en forma óptima a los diferentes retos de una sociedad altamente competitiva.</p>	
					</div>
				</div>
				<div class="fh5co-block to-animate" style="background-image: url(images/cic2.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<i class="fh5co-intro-icon icon-book-open"></i>
						<h2>NUESTROS VALORES</h2>
						<p>
							<p>Libertad y Responsabilidad</p>
							<p>Justicia – Solidaridad</p>
							<p>Conciencia de derechos</p>
							<p>Dialogo y Conciliación</p>
							<p>Respeto por las diferencias</p>
							<p>Superación Personal</p>
					</div>
				</div>
				<div class="fh5co-block to-animate" style="background-image: url(images/cic3.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>			
					<div class="fh5co-text"> 
						<i class="fh5co-intro-icon icon-eye"></i>
						<h2>VISIÓN</h2>
						<p>Ser una institución Educativa líder que ofrece una educación de calidad mediante la practica permanente de estrategias pedagógicas innovadoras, valores, principios éticos, experiencias de aprendizajes significativas, uno de la tecnología de la información y comunicación y el esfuerzo cooperativo que permitan a los estudiantes alcanzar la excelencia académica, tecnológica y humanística para contribuir en el cambio de la sociedad y mejorar la calidad de las personas.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="fh5co-work" data-section="mensaje">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">Mensaje</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>Construyendo un futuro mejor para ti</h3>
						</div>
					</div>
				</div>
			</div>		
		</div>

	</section>

	<section id="fh5co-services" data-section="informacion">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-left">
					<h2 class=" left-border to-animate">Información</h2>
					<div class="row">
						<div class="col-md-8 subtext to-animate">
							<h3>Nosotros somos la mejor opcion que podrias elejir para el futuro de tus hijos.</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row-lg-12"> <!--row-->
						<div class="col-lg-6 col-md-6 col-sm-6 fh5co-service to-animate"><!--div1-->
							<i class="icon to-animate-2 icon-search2"></i>
								<h3>QUE SEDES TENEMOS</h3>
								Tenemos unas sedes de:
								</br>Secundaria
								<p>Primaria</p>						
						</div><!--findiv1-->

						<div class="col-lg-6 col-md-6 col-sm-6 fh5co-service to-animate"><!--div2-->
							<i class="icon to-animate-2 icon-heart"></i>
								<h3>GENERO</h3>
								<p>Mixto</p>
								</br>
								</br>
						</div><!--div2-->

						
						<div class="col-lg-6 col-md-6 col-sm-6 fh5co-service to-animate"><!--div3-->
							<i class="icon to-animate-2 icon-user"></i>
								<h3>GESTIÓN / DEPENDENCIA </h3>
								<p>Privada - Particular</p>
						</div><!--div3-->

						<div class="col-lg-6 col-md-6 col-sm-6 fh5co-service to-animate"><!--div4-->
							<i class="icon to-animate-2 icon-th-large"></i>
								<h3>TURNO</h3>
								<p>Continuo sólo en la mañana</p>
						</div><!--div4-->
		</div><!--fin row-->
	</section>
	<footer id="footer" role="contentinfo">
		<a href="#" class="gotop js-gotop"><i class="icon-arrow-up2">Inicio</i></a>
		<div class="container">
			<div class="">
				<div class="col-md-12 text-center">
					<p>Desarrollo Web<br>
					UNIVERSIDAD DE CIENCIAS Y HUMANIDADES - 2018 </p>	
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<ul class="social social-circle">
						<li><a href="https://www.facebook.com/IEPLa-Inmaculada-Concepcion-Independencia-1499148636971622/"><i class="icon-facebook"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<script src="estilospag/js/jquery.min.js"></script>
	<script src="estilospag/js/bootstrap.min.js"></script>
	<script src="estilospag/js/jquery.waypoints.min.js"></script>
	<script src="estilospag/js/jquery.stellar.min.js"></script>
	<script src="estilospag/js/jquery.magnific-popup.min.js"></script>
	<script src="estilospag/js/jquery.style.switcher.js"></script>	
	<script src="estilospag/js/main.js"></script>
	</body>
</html>


