<%-- 
    Document   : registroProfesor
    Created on : 19-sep-2018, 17:21:03
    Author     : alumno
--%>
<%@page import="modelo.Asignacion"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Aula"%>
<%@page import="modelo.ListaAulas"%>
<%@page import="modelo.Curso"%>
<%@page import="modelo.ListaCursos"%>
<%@page import="modelo.Profesor"%>
<%@page import="modelo.ListaProfesores"%>
<%@page import="java.util.LinkedList"%>

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
    String an = (String) request.getSession().getAttribute("año");
 int año = Integer.parseInt(an);

    ListaAulas ls = new ListaAulas(año);
    LinkedList<Aula> li = ls.select();
    ListaProfesores ls3 = new ListaProfesores(año);
    LinkedList<Profesor> li3 = ls3.select();
    ListaCursos ls4 = new ListaCursos(año);
    LinkedList<Curso> li4 = ls4.select();

    Asignacion asi = (Asignacion) request.getSession().getAttribute("asignacion");
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
                            <div class="jumbotron p-3 p-md-5 text-dark rounded" style="background-color: #fffa65;">
                                <div class="col-md-12 px-0">
                                    <h1 class="text-center display-6 font-weight-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Editar de Asignación </font></font></h1>
                                </div>
                            </div>
                            <form action="controladoreditarasig.do" method="post">
                                <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                                 <div class="form-row">

                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Grado de estudio Primario:</label>
                                        <input class="form-control" name="grado" value="<%out.print(asi.getGrado());%>" readonly="readonly">
                                    </div>
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Sección:</label>
                                        <input class="form-control" name="comboSe" value="<%out.print(asi.getSeccion());%>" readonly="readonly">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Lista de Profesores:</label>
                                        <select id="inputState" class="form-control" name="comboPro">
                                            <option value="0">Seleccionar:</option>
                                            <%     if (li3.size() == 0) {
                                                    out.print("<option value=" + 0 + ">No Hay Profesores </option>");
                                                } else {
                                                    for (int i = 0; i < li3.size(); i++) {
                                                        if (li3.get(i).getCodigo().equals(asi.getProfesor())) {%>
                                            <option value="<%out.print(li3.get(i).getCodigo());%>" selected="selected"><%out.print(li3.get(i).getNombre() + " " + li3.get(i).getApellido());%></option>
                                            <%} else {%>
                                            <option value="<%out.print(li3.get(i).getCodigo());%>"><%out.print(li3.get(i).getNombre() + " " + li3.get(i).getApellido());%></option>    
                                            <% }
                                                    }
                                                }
                                            %>

                                        </select>
                                    </div>  
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState"> Lista de Cursos:</label>
                                        <select id="inputState" class="form-control" name="curso" >
                                            <%
                                                if (li4.size() == 0) {
                                           out.print("<option value=" + 0 + ">No Hay Cursos </option>");
                                                } else {
                                                    for (int i = 0; i < li4.size(); i++) {
                                                        if (li4.get(i).getCodigo().equals(asi.getCurso())) { %>
                                            <option value="<%out.print(li4.get(i).getCodigo());%>" selected="selected" ><%out.print(li4.get(i).getNombre());%></option>
                                            <%
                                                    }
                                                }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <div style="text-align: center;">
                                    <button type="submit" class="btn btn-success">Editar</button> <a href="administrador.jsp" class="btn btn-danger">Cancelar</a>
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
