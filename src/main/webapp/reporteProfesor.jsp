<%@page import="modelo.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : reporteAlumno
    Created on : 18-sep-2018, 15:55:24
    Author     : alumno
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    LinkedList<Profesor> profesores = (LinkedList<Profesor>) request.getSession().getAttribute("lista");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="WEB-INF/jspf/estilos.jspf" %>
    </head>
    <body>
        <%@include  file="WEB-INF/jspf/cabecera.jspf" %>      
        <%@include  file="WEB-INF/jspf/navAdministrador.jspf" %>
        <%@include file="WEB-INF/jspf/navAdministrador2.jspf" %>

        <div id="page-content-wrapper container">
            <div class="row bg-light">
                <div class="col-12" style="height: 100%">
                    <section>
                        <table class="table table-hover table-responsive-lg table-responsive-md table-responsive-sm table-responsive-xl">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>DNI</th>
                                    <th>Dirección</th>
                                    <th>Edad</th>
                                    <th>Tel. Casa</th>
                                    <th>Tel. Movil</th>
                                    <th>Correo</th>
                                    <th>Contraseña</th>
                                    <th style="text-align: center" >Editar</th>
                                    <th style="text-align: center" >Elimnar</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                for(int i=0; i<profesores.size(); i++){
                                    
                                %>
                                    <tr>
                                        <td><%out.print(profesores.get(i).getCodigo());%></td>
                                        <td><%out.print(profesores.get(i).getNombre());%></td>
                                        <td><%out.print(profesores.get(i).getApellido());%></td>
                                        <td><%out.print(profesores.get(i).getDni());%></td>
                                        <td><%out.print(profesores.get(i).getDireccion());%></td>
                                        <td><%out.print(profesores.get(i).getEdad());%></td>
                                        <td><%out.print(profesores.get(i).getTcasa());%></td>
                                        <td><%out.print(profesores.get(i).getTmovil());%></td>
                                        <td><%out.print(profesores.get(i).getCorreo());%></td>
                                        <td><%out.print(profesores.get(i).getContraseña());%></td>
                                       <td>
                                <form method="post" action="editarprofe.do">
                                    <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                                    <input name="profe" value="<%out.print(profesores.get(i).getCodigo());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                    <button type="submit" class="btn  btn-outline-success"><i class="fas fa-edit">&nbsp; Editar</i></button>
                                </form>   
                            </td>
                            <td>
                                <form method="post" action="eliminarprofesor.do">
                                    <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                                    <input name="profe" value="<%out.print(profesores.get(i).getCodigo());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                    <button type="submit" class="btn btn-outline-danger"><i class="fas fa-trash-alt">&nbsp; Eliminar</i></button>
                                </form>   
                            </td>
                                    </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </section>
                </div>
                
            </div>
            <div class="py-3 bg-light" style="text-align: center;">
                    <a href="administrador.jsp" class="btn btn-primary">ir al panel de control</a>
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
