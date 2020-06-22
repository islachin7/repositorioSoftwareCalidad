
<%@page import="modelo.Curso"%>
<%@page import="modelo.ListaCursos"%>
<%@page import="modelo.Profesor"%>
<%@page import="modelo.ListaProfesores"%>
<%@page import="modelo.Asignacion"%>
<%@page import="modelo.ListaAsignaciones"%>
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
String an = (String) request.getSession().getAttribute("año");
 int año = Integer.parseInt(an);
 ListaAsignaciones ls = new ListaAsignaciones(año);
 LinkedList<Asignacion> li= ls.select();
 ListaProfesores po = new ListaProfesores(año);
LinkedList<Profesor> po1 = po.select();
ListaCursos cur = new ListaCursos(año);
LinkedList<Curso> cur1 = cur.select();
 
 if(li==null){
     String error = "No hay ningun dato de asignaciones";
     request.getSession().setAttribute("error", error);
     request.getRequestDispatcher("errorAdmi").forward(request, response);
 }
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
                <div class="col-2"></div>
                <div class="col-8 justify-content-center">
                    <section>
                        <table class="table table-hover table-responsive-lg table-responsive-md">
                            <thead class="thead-dark">
                                <tr>
                                    <th style="text-align: center">Nombre de Grado</th>
                                    <th style="text-align: center">Nombre de Sección</th>
                                    <th style="text-align: center">Profesor</th>
                                    <th style="text-align: center">Curso</th>
                                    <th style="text-align: center" >Editar</th>
                                    <th style="text-align: center" >Elimnar</th>
                                </tr>
                            </thead>
                            <tbody>

                               <% 
                                  for(int i=0; i<li.size(); i++){ 
                                 %>
                            <tr>
                            <td style="text-align: center"><%out.print(li.get(i).getGrado());%> </td>
                            <td style="text-align: center"><%out.print(li.get(i).getSeccion());%> </td>
                            <td style="text-align: center"><%out.print(po.buscar(li.get(i).getProfesor()).getNombre()+" "+po.buscar(li.get(i).getProfesor()).getApellido());%> </td>
                            <td style="text-align: center"><%out.print(cur.buscar(li.get(i).getCurso()).getNombre());%></td>
                            <td>
                                <form method="post" action="editarasignacion.do">
                                    <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                                    <input name="gra" value="<%out.print(li.get(i).getGrado());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                    <input name="sec" value="<%out.print(li.get(i).getSeccion());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                    <input name="cur" value="<%out.print(li.get(i).getCurso());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                    <button type="submit" class="btn  btn-outline-success"><i class="fas fa-edit">&nbsp; Editar</i></button>
                                </form>   
                            </td>
                            <td>
                                <form method="post" action="eliminarasignacion.do">
                                    <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                                    <input name="gra" value="<%out.print(li.get(i).getGrado());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                    <input name="sec" value="<%out.print(li.get(i).getSeccion());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                    <input name="cur" value="<%out.print(li.get(i).getCurso());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                    <button type="submit" class="btn btn-outline-danger"><i class="fas fa-trash-alt">&nbsp; Eliminar</i></button>
                                </form>   
                            </td>
                            </tr>
                            <%}%>

                            </tbody>
                        </table>
                    </section>
                </div>
                <div class="col-2"></div>
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
