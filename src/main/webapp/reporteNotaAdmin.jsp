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
String an = (String) request.getSession().getAttribute("año");
 int año = Integer.parseInt(an);
    LinkedList<Nota> lis = (LinkedList<Nota>) request.getSession().getAttribute("notas");
    String gra = (String) request.getSession().getAttribute("gra");
    String cur = (String) request.getSession().getAttribute("cur");
    String sec = (String) request.getSession().getAttribute("sec");
    if(lis.size()==0){
     String error = "No Se han registrado las notas de esta aula";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);   
    }
    String pro="";
    for(int i = 0; i<lis.size(); i++){
         pro = lis.get(i).getProfesor();
    }
    ListaCursos li1 = new ListaCursos(año);
    LinkedList<Curso> a = li1.select();
    ListaProfesores li2 = new ListaProfesores(año);
    LinkedList<Profesor> b = li2.select();
    ListaAlumnos li3 = new ListaAlumnos(año);
    LinkedList<Alumno> c = li3.select();
    
    
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
                        <label for="inputState">Profesor:</label>
                                

                        <input class="form-control text-center" readonly="readonly"  value=" <%out.print(li2.buscar(pro).getNombre() + " " + li2.buscar(pro).getApellido());%>" name="grado"/>
                    </div>
                    <div class="form-group col-md-6 col-lg-6">
                        <label for="inputState">Area/Asignatura:</label>
                        <input class="form-control text-center" readonly="readonly"  value="<%out.print(li1.buscar(cur).getNombre());%>"  />
                    </div>
                </div>
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
                    
                    <div class="row justify-content-center" id="bimestre1">
                    <div class="col-1">

                    </div>

                    <div class="col-12 justify-content-center">

                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th colspan="10" style="text-align: left; font-size: 18px;">I BIMESTRE</th>
                                </tr>
                                <tr>
                                    <th colspan="2" style="text-align: center;">Apellidos y Nombres</th>
                                    <th style="text-align: center;">Bimestre</th>
                                    <th style="text-align: center;">Nota Oral</th>
                                    <th style="text-align: center;">Nota Prac</th>
                                    <th style="text-align: center;">Nota Trab</th>
                                    <th style="text-align: center;">Nota Cuad</th>
                                    <th style="text-align: center;">Proceso</th>
                                    <th style="text-align: center;">Ex. Bimes.</th>
                                    <th style="text-align: center;">Promedio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                   
                                    for (int i = 0; i < lis.size(); i++) {
                                     if(lis.get(i).getBime().equals("I")){
                                %>
                                <tr>
                                    <td style="text-align: left;" colspan="2"><%out.print(li3.buscar(lis.get(i).getAlumno()).getApellidoh()+" "+li3.buscar(lis.get(i).getAlumno()).getNombreh());%>  
                                    </td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getBime());%> &nbsp; Bimestre</td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNoral());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNprac());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNtrab());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNcuad());%></td>
                                    <td style="text-align: center;"><%out.print((double)lis.get(i).getProce());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getExabi());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getPromedio());%></td>
                                </tr>
                                <%}}%>
                        
                            </tbody>
                        </table>
                    </div>

                    <div class="col-1">

                    </div>

                </div>
                 
                <div class="row justify-content-center" id="bimestre2">
                    <div class="col-1">

                    </div>

                   <div class="col-12 justify-content-center">

                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th colspan="10" style="text-align: left; font-size: 18px;">II BIMESTRE</th>
                                </tr>
                                <tr>
                                    <th colspan="2" style="text-align: center;">Apellidos y Nombres</th>
                                    <th style="text-align: center;">Bimestre</th>
                                    <th style="text-align: center;">Nota Oral</th>
                                    <th style="text-align: center;">Nota Prac</th>
                                    <th style="text-align: center;">Nota Trab</th>
                                    <th style="text-align: center;">Nota Cuad</th>
                                    <th style="text-align: center;">Proceso</th>
                                    <th style="text-align: center;">Ex. Bimes.</th>
                                    <th style="text-align: center;">Promedio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                   
                                    for (int i = 0; i < lis.size(); i++) {
                                     if(lis.get(i).getBime().equals("II")){
                                %>
                                <tr>
                                    <td style="text-align: left;" colspan="2">
                                        <%out.print(li3.buscar(lis.get(i).getAlumno()).getApellidoh()+" "+li3.buscar(lis.get(i).getAlumno()).getNombreh());%>
                                        
                                    </td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getBime());%> &nbsp; Bimestre</td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNoral());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNprac());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNtrab());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNcuad());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getProce());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getExabi());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getPromedio());%></td>
                                </tr>
                                <%}}%>
                               
                            </tbody>
                        </table>
                    </div>

                    <div class="col-1">

                    </div>

                </div>
              
                <div class="row justify-content-center" id="bimestre3">
                    <div class="col-1">

                    </div>

                   <div class="col-12 justify-content-center">

                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th colspan="10" style="text-align: left; font-size: 18px;">III BIMESTRE</th>
                                </tr>
                                <tr>
                                    <th colspan="2" style="text-align: center;">Apellidos y Nombres</th>
                                    <th style="text-align: center;">Bimestre</th>
                                    <th style="text-align: center;">Nota Oral</th>
                                    <th style="text-align: center;">Nota Prac</th>
                                    <th style="text-align: center;">Nota Trab</th>
                                    <th style="text-align: center;">Nota Cuad</th>
                                    <th style="text-align: center;">Proceso</th>
                                    <th style="text-align: center;">Ex. Bimes.</th>
                                    <th style="text-align: center;">Promedio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                   
                                    for (int i = 0; i < lis.size(); i++) {
                                     if(lis.get(i).getBime().equals("III")){
                                %>
                                <tr>
                                    <td style="text-align: left;" colspan="2"><%out.print(li3.buscar(lis.get(i).getAlumno()).getApellidoh()+" "+li3.buscar(lis.get(i).getAlumno()).getNombreh());%>
                                    
                                        
                                    </td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getBime());%> &nbsp; Bimestre</td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNoral());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNprac());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNtrab());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNcuad());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getProce());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getExabi());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getPromedio());%></td>
                                </tr>
                                <%}}%>
                       
                            </tbody>
                        </table>
                    </div>

                    <div class="col-1">

                    </div>

                </div>
                
                <div class="row justify-content-center" id="bimestre4">
                    <div class="col-1">

                    </div>

                    <div class="col-12 justify-content-center">

                        <table class="table table-hover">
                            
                            <thead class="thead-dark">
                                <tr>
                                    <th colspan="10" style="text-align: left; font-size: 18px;">IV BIMESTRE</th>
                                </tr>
                                <tr>
                                    <th colspan="2" style="text-align: center;">Apellidos y Nombres</th>
                                    <th style="text-align: center;">Bimestre</th>
                                    <th style="text-align: center;">Nota Oral</th>
                                    <th style="text-align: center;">Nota Prac</th>
                                    <th style="text-align: center;">Nota Trab</th>
                                    <th style="text-align: center;">Nota Cuad</th>
                                    <th style="text-align: center;">Proceso</th>
                                    <th style="text-align: center;">Ex. Bimes.</th>
                                    <th style="text-align: center;">Promedio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                   
                                    for (int i = 0; i < lis.size(); i++) {
                                     if(lis.get(i).getBime().equals("IV")){
                                %>
                                <tr>
                                    <td style="text-align: left;" colspan="2"><%out.print(li3.buscar(lis.get(i).getAlumno()).getApellidoh()+" "+li3.buscar(lis.get(i).getAlumno()).getNombreh());%>
                                     
                                    </td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getBime());%> &nbsp; Bimestre</td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNoral());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNprac());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNtrab());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getNcuad());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getProce());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getExabi());%></td>
                                    <td style="text-align: center;"><%out.print(lis.get(i).getPromedio());%></td>
                                </tr>
                                <%}}%>
                              
                            </tbody>
                        </table>
                    </div>

                    <div class="col-1">

                    </div>

                </div>
            </section>
        </div>
        <div class="py-3" style="text-align: center;">
            <a href="administrador.jsp" class="btn btn-primary">ir al panel de control</a>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf" %> 
        <%@include file="WEB-INF/jspf/jsfooter.jspf" %> 

    </body>
</html>
