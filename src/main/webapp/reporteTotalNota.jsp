<%@page import="modelo.Curso"%>
<%@page import="modelo.ListaCursos"%>
<%@page import="modelo.Profesor"%>
<%@page import="modelo.Alumno"%>
<%@page import="modelo.Nota"%>
<%@page import="java.util.LinkedList"%>
<%@page import="modelo.ListaProfesores"%>
<%@page import="modelo.ListaAlumnos"%>
<%@page import="modelo.ListaNotas"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : reporteAlumno
    Created on : 18-sep-2018, 15:55:24
    Author     : alumno
--%>

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

    LinkedList<Alumno> c = (LinkedList<Alumno>) request.getSession().getAttribute("lista");
    String gra = (String)request.getSession().getAttribute("grado");
    String sec = (String)request.getSession().getAttribute("sec");
    
%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="WEB-INF/jspf/estilos.jspf" %>
    </head>
    <body>
        <%@include  file="WEB-INF/jspf/cabecera.jspf" %>      
        <%@include  file="WEB-INF/jspf/navAdministrador.jspf" %>    
        <div class="container-fluid">
            <section>
                <div class="form-row">
                    <div class="form-group col-md-6 col-lg-6">
                        <label for="inputState">Grado</label>
                        <input class="form-control text-center" readonly="readonly"  value="<%out.print(gra);%>" name="seccion"/>
                    </div>
                    <div class="form-group col-md-6 col-lg-6">
                        <label for="inputState">Sección:</label>
                        <input class="form-control text-center" readonly="readonly"  value="<%out.print(sec);%>" name="seccion"/>
                    </div>
                </div>
                    <div class="row justify-content-center">
                    <div class="col-1">
                    </div>
                    <div class="col-12 justify-content-center">
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th colspan="2" style="text-align: center;">Apellidos y Nombres</th>
                                    <th  style="text-align: center;">Usuario</th>
                                    <th  style="text-align: center;">Contraseña</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                   
                                    for (int i = 0; i < c.size(); i++) {
                                %>
                                <tr>
                                    <td style="text-align: left;" colspan="2">
                                        <form action="controladorboleta.do" method="post">
                                            <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                                            <input style="width: 1px; height: 1px; visibility: hidden;" name="alumno" value="<%out.print(c.get(i).getUsuario());%>">
                                            <button type="submit" class="btn btn-link text-dark"><%out.print(c.get(i).getApellidoh()+" "+c.get(i).getNombreh());%></button>
                                        </form>
                                    </td>
                                    <td style="text-align: center;">
                                        <%out.print(c.get(i).getUsuario());%>  
                                    </td>
                                    <td style="text-align: center;">
                                        <%out.print(c.get(i).getContra());%>  
                                    </td>
                                </tr>
                                <%}%>
                        
                            </tbody>
                        </table>
                    </div>

                    <div class="col-1">

                    </div>

                </div>
                
           </section>
                </div>
            
        </div>
        <div class="py-3" style="text-align: center;">
            <a href="administrador.jsp" class="btn btn-primary">ir al panel de control</a>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf" %> 
        <%@include file="WEB-INF/jspf/jsfooter.jspf" %> 

    </body>
</html>
