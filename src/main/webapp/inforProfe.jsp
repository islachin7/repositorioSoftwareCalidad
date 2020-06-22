<%-- 
    Document   : inforAlumno
    Created on : 19-sep-2018, 15:06:15
    Author     : alumno
--%>

<%@page import="modelo.Profesor"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
response.setHeader("Pragma", "no-cache");
response.addHeader("Cache-control", "must-revalidate");
response.addHeader("Cache-control", "no-cache");
response.addHeader("Cache-control", "no-store");
response.setDateHeader("Expires", 0);

try{
if(session.getAttribute("usuario")==null){
request.getRequestDispatcher("index.jsp").forward(request, response);
}   
}catch(Exception e){
request.getRequestDispatcher("index.jsp").forward(request, response);
   
}


%>
<!DOCTYPE html>
<% Profesor pro = (Profesor) request.getSession().getAttribute("profesor");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/estilos.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecera.jspf" %>
        <%@include file="WEB-INF/jspf/navAdministrador.jspf" %>
        <div class=" row justify-content-center py-3">
            <div class="card card-inverse col-12 col-lg-4 col-md-4 " style="background-color: #333; border-color: #333;">
                <div class="card-block">
                    <h3 class="card-title text-center">PROFESOR REGISTRADO CORRECTAMENTE:</h3><br>
                    <p class="card-text">Codigo: <% out.print(pro.getCodigo());  %></p>
                    <p class="card-text">Nombre: <% out.print(pro.getNombre());  %></p>
                    <p class="card-text">Apellido: <% out.print(pro.getApellido());%></p>
                    <p class="card-text">DNI: <% out.print(pro.getDni());%></p>
                    <p class="card-text">Dirección: <% out.print(pro.getDireccion());%></p>
                    <p class="card-text">Ciudad: <% out.print(pro.getCiudad());%></p>
                    <p class="card-text">Telefono Casa: <% out.print(pro.getTcasa());%></p>
                    <p class="card-text">Telefono Movil: <% out.print(pro.getTmovil());%></p>
                    <p class="card-text">Correo: <% out.print(pro.getCorreo());%></p>
                    <p class="card-text">Contraseña: <% out.print(pro.getContraseña());%></p>
                    <div style="text-align: center;">
                        <a href="administrador.jsp" class="btn btn-primary">ir al panel de control</a>
                    </div>
                </div>
            </div>
              <section></section>       
        </div>
                   
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <%@include file="WEB-INF/jspf/jsfooter.jspf" %>

    </body>
</html>
