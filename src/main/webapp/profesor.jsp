<%-- 
    Document   : index
    Created on : 12/09/2018, 07:12:56 PM
    Author     : ALUMNO
--%>

<%@page import="modelo.Curso"%>
<%@page import="java.util.LinkedList"%>
<%@page import="modelo.ListaCursos"%>
<%@page import="modelo.Asignacion"%>
<%@page import="modelo.ListaAsignaciones"%>
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
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/estilos.jspf" %>

    </head>
    <body>

        <%@include file="WEB-INF/jspf/cabecera.jspf" %>
        <%@include file="WEB-INF/jspf/navProfesor.jspf"%>
<%
   
    ListaAsignaciones ls = new ListaAsignaciones(año);
    LinkedList<Asignacion> li = ls.select();
    ListaCursos cur = new ListaCursos(año);
    LinkedList<Curso> cur1 = cur.select();
    if (li == null) {
        String error = "No hay ningun dato de asignaciones";
        request.getSession().setAttribute("error", error);
        request.getRequestDispatcher("errorAdmi").forward(request, response);
    }
%>
        <h2></h2>
        <div class="jumbotron p-3 p-md-5 text-white rounded bg-dark py-3">
            <div class="col-md-12 px-0">
                <h1 class="text-center display-4 font-italic"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">BIENVENIDO PROFESOR ESTE ES SU MÓDULO</font></font></h1>
                <p class="text-center lead my-3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Este módulo le permitira registrar y hacer reportes de las notas de los alumnos para la gestión de enseñanza.</font></font></p>
            </div>
        </div>
        <div class="row bg-light">
            <div class="col-2"></div>
            <div class="col-8 justify-content-center">
                <section>
                    
                        <table class="table table-hover table-responsive-lg table-responsive-md">
                            <thead class="thead-dark">
                                <tr>
                                    <th style="text-align: center">Aula</th>
                                    <th style="text-align: center">Curso</th>
                                    <th style="text-align: center" >Registrar</th>
                                    <th style="text-align: center" >Reporte</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    LinkedList<Asignacion> lis = ls.registro(correo);
                                    if(lis.size()==0){
                                %>
                                <tr>
                            
                                    <td style="text-align: center">VACIO</td>
                                    <td style="text-align: center">VACIO</td>
                                    <td style="text-align: center">NADA</td>
                                    <td style="text-align: center">NADA</td>
                                </tr>
                                
                                <%        
                                    }else{
                                    for (int i = 0; i < lis.size(); i++) {
                                    
                                %>
                                <tr>
                            <td style="text-align: center">
                                <%out.print(li.get(i).getGrado()+" "+li.get(i).getSeccion());%> 
                            </td>
                            <td style="text-align: center"><%out.print(cur.buscar(lis.get(i).getCurso()).getNombre());%></td>
                            
                            
                            <td style="text-align: center">
                                <form action="controladorrn.do" method="post">
                                    <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(año);%>">
                            <input style="visibility: hidden; height: 1px; width: 1px;" name="grado" value="<%out.print(lis.get(i).getGrado());%>">
                            <input style="visibility: hidden; height: 1px; width: 1px;" name="seccion" value="<%out.print(lis.get(i).getSeccion());%>">
                            <input style="visibility: hidden; height: 1px; width: 1px;" name="curso" value="<%out.print(lis.get(i).getCurso());%>">   
                            <button type="submit" class="btn btn-primary"><i class="fas fa-plus-circle">&nbsp; Registrar</i></button>
                                </form>
                            </td>
                            
                            <td style="text-align: center">
                                <form action="reponota.do" method="post">
                            <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(año);%>">
                            <input style="visibility: hidden; height: 1px; width: 1px;" name="grado" value="<%out.print(lis.get(i).getGrado());%>">
                            <input style="visibility: hidden; height: 1px; width: 1px;" name="seccion" value="<%out.print(lis.get(i).getSeccion());%>">
                            <input style="visibility: hidden; height: 1px; width: 1px;" name="curso" value="<%out.print(lis.get(i).getCurso());%>">   
                            <input style="visibility: hidden; height: 1px; width: 1px;" name="profe" value="<%out.print(correo);%>">   
                            <button type="submit" class="btn btn-secondary"><i class="fas fa-list-alt">&nbsp; Reporte</i></button>
                                </form>
                            </td>
                                </tr>
                            <%
                                   
                                } }%>

                            </tbody>
                        </table>
                   
                </section>
            </div>
            <div class="col-2"></div>
        </div>
            <section></section>  
 



        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <%@include file="WEB-INF/jspf/jsfooter.jspf" %>
    </body>
</html>
