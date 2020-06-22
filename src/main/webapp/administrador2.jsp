<%-- 
    Document   : probando1
    Created on : 09/10/2018, 12:56:16 AM
    Author     : KandL
--%>

<%@page import="modelo.Anio"%>
<%@page import="modelo.ListaAnios"%>
<%@page import="java.util.LinkedList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);

    try {
        if (session.getAttribute("usuario") == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    ListaAnios ls = new ListaAnios();
    LinkedList<Anio> lista = ls.select();


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/estilos.jspf" %>

    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecera.jspf" %>
        <%@include file="WEB-INF/jspf/navAdministrador3.jspf" %>
        <div id="page-content-wrapper container" >

            <main role="main" class="bg-light">

                <section class="jumbotron text-center">
                    <div class="container" >
                        <h1 class="jumbotron-heading">BIENVENIDO ADMINISTRADOR</h1>
                        <p class="lead text-muted">Aqui podra administrar todo el colegio</p>
                        <img src="img/cole.png" alt="asd">


                    </div>
                </section>

                <div class="album py-5 bg-light">
                    <div class="container">
                        <div class="justify-content-center text-center py-3">
                            <a href="#ventanare" class="btn btn-outline-primary" data-toggle="modal">Registrar</a>
                            <a href="#ventanael" class="btn btn-outline-danger" data-toggle="modal">Cerrar Año</a>
                        </div>
                        <div class="row justify-content-center">
                            <%
                            if(lista.size()>0){
                            for(int i=0; i<lista.size(); i++){
                                
                            %>
                            <div class="col-md-4">
                                <div class="card mb-4 box-shadow">
                                    <img class="card-img-top"  alt="años" style="height: 100%; width: 100%; display: block;" src="img/anio.png" data-holder-rendered="true">
                                    <div class="card-body">
                                        <h3 class="card-text text-center">AÑO: <%out.print(lista.get(i).getAnio());%></h3>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <div class="btn-group ">
                                                <form method="post" action="ingresar.do">
                                                    <input name="anio" style="visibility: hidden; width: 1px;height: 1px;" value="<%out.print(lista.get(i).getAnio());%>">
                                                    <button type="submit" class="btn btn-sm btn-outline-secondary text-center">Ingresar</button>   
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <%}}else{%>
                           <div class="col-md-4">
                                <div class="card mb-4 box-shadow">
                                    <img class="card-img-top"  alt="años" style="height: 100%; width: 100%; display: block;" src="img/anio.png" data-holder-rendered="true">
                                    <div class="card-body">
                                        <p class="card-text text-center">NO HAY AÑOS ESCOLARES</p>
                                       
                                    </div>
                                </div>
                            </div>
                           <%}%>
                        </div>
                    </div>
                </div>

            </main>
            
            <%@include file="WEB-INF/jspf/registroAnio.jspf" %>  
            <%@include file="WEB-INF/jspf/cerrarAnio.jspf" %> 
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </div>
    </div>

    <%@include file="WEB-INF/jspf/jsfooter.jspf" %>

</body>
</html>
