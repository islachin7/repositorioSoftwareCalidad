<%-- 
    Document   : inforAlumno
    Created on : 19-sep-2018, 15:06:15
    Author     : alumno
--%>


<%@page import="modelo.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="modelo.ListaProfesores"%>
<%@page import="modelo.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
String an = (String) request.getSession().getAttribute("año");
 int año = Integer.parseInt(an);

%>
<!DOCTYPE html>
<% 
Aula au = (Aula) request.getSession().getAttribute("aula");
ListaProfesores po = new ListaProfesores(año);
LinkedList<Profesor> po1 = po.select();
%>
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
                    <h3 class="card-title text-center">AULA REGISTRADO CORRECTAMENTE:</h3><br>
                    <p class="card-text">Grado y Sección: <% out.print(au.getGrado()+" "+au.getSeccion());  %></p>
                    <p class="card-text">Tutor: <%out.print(po.buscar(au.getProfesor()).getNombre()+" "+po.buscar(au.getProfesor()).getApellido());%></p>
                    <p class="card-text">Cantidad Maxima: <%out.print(au.getCantMax());%></p>
                    <div style="text-align: center;">
                        <a href="administrador.jsp" class="btn btn-primary">ir al panel de control</a>
                    </div>
                </div>
            </div>
        </div>
         <section></section>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <%@include file="WEB-INF/jspf/jsfooter.jspf" %>

    </body>
</html>
