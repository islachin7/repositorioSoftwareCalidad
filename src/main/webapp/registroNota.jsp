<%@page import="modelo.Curso"%>
<%@page import="modelo.ListaCursos"%>
<%@page import="modelo.Alumno"%>
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
<%    String grado = (String) request.getSession().getAttribute("gra");
    String seccion = (String) request.getSession().getAttribute("sec");
    String curso = (String) request.getSession().getAttribute("cur");
    LinkedList<Alumno> l = (LinkedList<Alumno>) request.getSession().getAttribute("lista");
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
%>

        <div class="row py-1">
            <div class="jumbotron text-white rounded bg-dark py-2 col-12 row">
                <div class="col-1">
                    <img src="img/cole.ico" style="height: 50px; width: 50px;">
                </div>
                <div class="col-11">
                    <h1 class="text-center font-weight-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Registro de Evaluación</font></font></h1>
                </div>
            </div>

            <div class="col-12" style="height: 100%">
                <form action="controladornota.do" method="post">
                    <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(año);%>">
                    <div class="form-row">
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="inputState">Periodo Escolar:</label>
                            <select id="inputState" class="form-control" name="bimestre">
                                <option selected value="0">Seleccionar:</option>
                                <option value="I">Primer Bimestre 2018</option>
                                <option value="II">Segundo Bimestre 2018</option>
                                <option value="III">Tercero Bimestre 2018</option>
                                <option value="IV">Cuarto Bimestre 2018</option>
                            </select>
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
                        <button type="submit" class="btn btn-primary">Registrar</button>
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

                                    <%    for (int i = 0; i < l.size(); i++) {
                                    %>
                                <tr>
                                <td><input class="alert alert-success" readonly="readonly" size="4" class="text-center" name="codi<%out.print(i);%>" type="text" value="<%out.print(l.get(i).getUsuario());%>" /></td>
                                <td><input class="alert alert-success" readonly="readonly" size="30" class="text-center"  type="text" value="<%out.print(l.get(i).getNombreh() + " " + l.get(i).getApellidoh());%>"/></td>
                                <td><input class="alert alert-secondary" min="0" max="20" class="text-center" name="ora<%out.print(i);%>" type="number" ng-model="a<%out.print(i);%>" ng-init="a<%out.print(i);%> = 0"/></td>
                                <td><input class="alert alert-secondary" min="0" max="20" class="text-center" name="pra<%out.print(i);%>" type="number" ng-model="b<%out.print(i);%>" ng-init="b<%out.print(i);%> = 0"/></td>
                                <td><input class="alert alert-secondary" min="0" max="20" class="text-center" name="tra<%out.print(i);%>" type="number" ng-model="c<%out.print(i);%>" ng-init="c<%out.print(i);%> = 0"/></td>
                                <td><input class="alert alert-secondary" min="0" max="20" class="text-center" name="cua<%out.print(i);%>" type="number" ng-model="d<%out.print(i);%>" ng-init="d<%out.print(i);%> = 0"/></td>
                                <td><input class="alert alert-danger" style="width:100px;" step="any" size="2" min="0" max="20" readonly="readonly" class="text-center" name="pro<%out.print(i);%>" type="number" value="{{(((a<%out.print(i);%>) + (b<%out.print(i);%>) + (c<%out.print(i);%>) + (d<%out.print(i);%>)) / 4)}}"/></td>
                                <td><input class="alert alert-secondary"  min="0" max="20" class="text-center" name="bi<%out.print(i);%>" type="number"  ng-model="bi<%out.print(i);%>" ng-init="bi<%out.print(i);%> = 0"/></td>
                                <td><input class="alert alert-danger" style="width:100px;" step="any" min="0" max="20" readonly="readonly" class="text-center" name="p<%out.print(i);%>" type="number" value="{{(((((a<%out.print(i);%>) + (b<%out.print(i);%>) + (c<%out.print(i);%>) + (d<%out.print(i);%>)) / 4)) + bi<%out.print(i);%>) / 2}}" ng-init="0"/></td>
                                </tr>
                                <%} %>  
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