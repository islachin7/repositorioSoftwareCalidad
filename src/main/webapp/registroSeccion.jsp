<%-- 
    Document   : registroProfesor
    Created on : 19-sep-2018, 17:21:03
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/estilos.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecera.jspf" %>     
        <%@include file="WEB-INF/jspf/navAdministrador.jspf" %>
        <%@include file="WEB-INF/jspf/navAdministrador2.jspf" %>

        <div id="page-content-wrapper container">

            <div class="container-fluid bg-light">

                <section>

                    <div class="row ">
                        <div class="col-12 col-md-12 col-lg-12"></div>
                        <div class="col-12 col-md-12 col-lg-12">
                            <form action="controladorseccion.do" method="post">
                                <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                                <div class="form-row justify-content-center">

                                    <div class="card card-inverse bg-dark" >
                                        <div class="card-block">
                                            <h3 class="card-title text-center">REGISTRO DE SECCIONES:</h3><br>
                                            <label for="seccion">Letra de Sección:</label>
                                            <input type="text" class="form-control" id="seccion" name="seccion" placeholder="A , B , C"><br>
                                            <div style="text-align: center;">
                                                <button type="submit" class="btn btn-primary">Registrar</button> <a href="administrador.jsp" class="btn btn-danger">Cancelar</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                            </form>
                        </div>
                    </div>
                </section>
                <section></section>
            </div>
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </div>
    </div>

    <%@include file="WEB-INF/jspf/jsfooter.jspf" %> 
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>
</body>
</html>
