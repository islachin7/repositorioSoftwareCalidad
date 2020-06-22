<%@page import="modelo.Alumno"%>
<%@page import="modelo.ListaAlumnos"%>
<%@page import="modelo.Nota"%>
<%@page import="modelo.Curso"%>
<%@page import="modelo.ListaCursos"%>

<%@page import="java.util.LinkedList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : registroNota
    Created on : 20/09/2018, 03:54:26 AM
    Author     : KandL
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
<%  String grado = (String) request.getSession().getAttribute("gra");
    String seccion = (String) request.getSession().getAttribute("sec");
    String curso = (String) request.getSession().getAttribute("cur");
    String pro = (String) request.getSession().getAttribute("pro");
    String bime = (String) request.getSession().getAttribute("bime");
    LinkedList<Nota> lista = (LinkedList<Nota>) request.getSession().getAttribute("notas");
    
%>
<!DOCTYPE html>
<html ng-app>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="WEB-INF/jspf/estilos.jspf" %>
    </head>
    <body>


        <%@include  file="WEB-INF/jspf/cabecera.jspf" %>      
        <%@include  file="WEB-INF/jspf/navProfesor.jspf" %>    
<%
ListaCursos cur = new ListaCursos(año);
    LinkedList<Curso> cur1 = cur.select();
    ListaAlumnos li3 = new ListaAlumnos(año);
    LinkedList<Alumno> c = li3.select();
%>
        <div class="row py-1">
            <div class="jumbotron text-white rounded bg-dark py-2 col-12 row">
                <div class="col-1">
                    <img src="img/cole.ico" style="height: 50px; width: 50px;">
                </div>
                <div class="col-11">
                    <h1 class="text-center font-weight-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Edición de Evaluación</font></font></h1>
                </div>
            </div>

            <div class="col-12" style="height: 100%">
                <form action="controladoreditarnota.do" method="post">
                    <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(año);%>">
                    <div class="form-row">
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="inputState">Periodo Escolar:</label>
                            <input class="form-control text-center" readonly="readonly"  value="<%out.print(bime);%> BIMESTRE" />
                            <input class="form-control text-center" readonly="readonly"  value="<%out.print(bime);%>" name="bimestre" style="visibility: hidden; height: 1px; width: 1px;"/>
                        </div>
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="inputState">Grado:</label>
                            <input class="form-control text-center" readonly="readonly"  value="<%out.print(grado);%>" name="grado"/>
                        </div>
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="inputState">Area/Asignatura:</label>
                            <input style="visibility: hidden" value="<%out.print(curso);%>"  name="curso"/>
                            <input style="visibility: hidden" value="<%out.print(correo);%>" name="profe" />
                            <input class="form-control text-center" readonly="readonly"  value="<%out.print(cur.buscar(curso).getNombre());%>"  />
                        </div>
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="inputState">Sección:</label>
                            <input class="form-control text-center" readonly="readonly"  value="<%out.print(seccion);%>" name="seccion"/>
                        </div>
                    </div>

                    <div class="py-3" style="text-align: center;">
                        <button type="submit" class="btn btn-success">Editar</button>
                        <a href="profesor.jsp" class="btn btn-danger">Cancelar</a>
                    </div> 
                    <div class="row">
                        <div class="col-12" style="width: 100%">
                            <table class="table table-hover table-responsive-lg table-responsive-md">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Cod.Usuario</th>
                                        <th>Nombre y Apellido</th>
                                        <th>Nota Oral</th>
                                        <th>Nota Prac</th>
                                        <th>Nota Trab</th>
                                        <th>Nota Cuad</th>
                                        <th>Proceso</th>
                                        <th>Ex. Bimes.</th>
                                        <th>Promedio</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%    for (int i = 0; i < lista.size(); i++) {
                                            out.print("<tr>");
                                    %>
                                <td><input class="alert alert-success" readonly="readonly" size="4" class="text-center" name="codi<%out.print(i);%>" type="text" value="<%out.print(lista.get(i).getAlumno());%>"/></td>
                                <td><input class="alert alert-success" readonly="readonly" size="30" class="text-center"  type="text" value="<%out.print(li3.buscar(lista.get(i).getAlumno()).getApellidoh() + " " + li3.buscar(lista.get(i).getAlumno()).getNombreh());%>"/></td>
                                <td><input class="alert alert-secondary" min="0" max="20" class="text-center" name="ora<%out.print(i);%>" type="number" ng-model="a<%out.print(i);%>" ng-init="a<%out.print(i);%> = <%out.print(lista.get(i).getNoral());%>" value="<%out.print(lista.get(i).getNoral());%>"/></td>
                                <td><input class="alert alert-secondary" min="0" max="20" class="text-center" name="pra<%out.print(i);%>" type="number" ng-model="b<%out.print(i);%>" ng-init="b<%out.print(i);%> = <%out.print(lista.get(i).getNprac());%>" value="<%out.print(lista.get(i).getNprac());%>"/></td>
                                <td><input class="alert alert-secondary" min="0" max="20" class="text-center" name="tra<%out.print(i);%>" type="number" ng-model="c<%out.print(i);%>" ng-init="c<%out.print(i);%> = <%out.print(lista.get(i).getNtrab());%>" value="<%out.print(lista.get(i).getNtrab());%>"/></td>
                                <td><input class="alert alert-secondary" min="0" max="20" class="text-center" name="cua<%out.print(i);%>" type="number" ng-model="d<%out.print(i);%>" ng-init="d<%out.print(i);%> = <%out.print(lista.get(i).getNcuad());%>" value="<%out.print(lista.get(i).getNcuad());%>"/></td>
                                <td><input class="alert alert-danger" min="0" max="20" readonly="readonly" class="text-center" name="pro<%out.print(i);%>" type="number" value="{{(((a<%out.print(i);%>) + (b<%out.print(i);%>) + (c<%out.print(i);%>) + (d<%out.print(i);%>)) / 4)}}"/></td>
                                <td><input class="alert alert-secondary" min="0" max="20" class="text-center" name="bi<%out.print(i);%>" type="number"  ng-model="bi<%out.print(i);%>" ng-init="bi<%out.print(i);%> = <%out.print(lista.get(i).getExabi());%>" value="<%out.print(lista.get(i).getExabi());%>"/></td>
                                <td><input class="alert alert-danger" min="0" max="20" readonly="readonly" class="text-center" name="p<%out.print(i);%>" type="number" value="{{(((((a<%out.print(i);%>) + (b<%out.print(i);%>) + (c<%out.print(i);%>) + (d<%out.print(i);%>)) / 4)) + bi<%out.print(i);%>) / 2}}" ng-init="0"/></td>
                                    <%
                                            out.print("</tr>");
                                        }
                                    %>  
                                </tbody>
                            </table>
                            
                        </div>
                    </div>
                 </form>
            </div>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf" %> 
        <%@include file="WEB-INF/jspf/jsfooter.jspf" %> 

    </body>
</html>