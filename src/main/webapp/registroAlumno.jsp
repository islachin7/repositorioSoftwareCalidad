<%-- 
    Document   : index
    Created on : 12/09/2018, 07:12:56 PM
    Author     : ALUMNO
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="modelo.Aula"%>
<%@page import="modelo.ListaAulas"%>
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

 //   String ape1 = (String) request.getSession().getAttribute("ape1");
 //   String ape2 = (String) request.getSession().getAttribute("ape2");
 //   String nom = (String) request.getSession().getAttribute("nom");
 //   String dni = (String) request.getSession().getAttribute("dni");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <%@include file="WEB-INF/jspf/estilos.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecera.jspf" %>
        <%@include file="WEB-INF/jspf/navAdministrador.jspf" %>
        <%@include file="WEB-INF/jspf/navAdministrador2.jspf" %>
        <div id="page-content-wrapper container">
            <div class="container-fluid bg-info">

                <section class="bg-info">

                    <div class="container col-12 col-lg-10 col-md-10 col-xl-10 col-xs-10 col-sm-10" >
                        <form action="controladoralumno.do" method="post" class="container" id="needs-validation" novalidate>
                        <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                            <div class="card">
                                <h5 class="card-header">REGISTRO DEL ALUMNO </h5>
                                <div class="card-body">


                                    <div class="container">

                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="validationCustom01">Nombre</label>
                                                <input type="text" name="nomh" class="form-control" id="validationCustom01" placeholder="Ej: Mario" required>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="validationCustom02">Apellidos</label>
                                                <input type="text" name="apeh" class="form-control" id="validationCustom02" placeholder="Ej: Vargas" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-4 col-lg-6">
                                                <label for="inputState">Grado de estudio Primario:</label>
                                                <select id="inputState" class="form-control" name="combo3">
                                                    <option selected="selected" value="0">Seleccionar:</option>
                                                    <%
                                                        if (li.size() == 0) {
                                                            out.print("<option value=" + 0 + ">No Hay Grados </option>");
                                                        } else {%>
                                                    <option value="<%out.print(li.get(0).getGrado());%>"><%out.print(li.get(0).getGrado());%></option>
                                                    <%    for (int i = 0; i < li.size() - 1; i++) {
                                                            if (li.get(i).getGrado().equalsIgnoreCase(li.get(i + 1).getGrado())) {
                                                            } else {
                                                    %>

                                                    <option value="<%out.print(li.get(i + 1).getGrado());%>"><%out.print(li.get(i + 1).getGrado());%></option>

                                                    <% }
                                                            }
                                                        }

                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6 col-lg-6">
                                                <label for="inputState">Sección:</label>
                                                <select id="inputState" class="form-control" name="comboSe">
                                                    <option selected="selected" value="0">Seleccionar:</option>
                                                    <% List<String> ordenado = new LinkedList<String>();
                                                        for (int i = 0; i < li.size(); i++) {
                                                            ordenado.add(li.get(i).getSeccion());
                                                            Collections.sort(ordenado);
                                                        }

                                                        if (li.size() == 0) {
                                                            out.print("<option value=" + 0 + ">No Hay Secciones </option>");
                                                        } else {%>
                                                    <option value="<%out.print(ordenado.get(0));%>"><%out.print(ordenado.get(0));%></option>
                                                    <%   for (int i = 0; i < li.size() - 1; i++) {
                                                            if (ordenado.get(i).equalsIgnoreCase(ordenado.get(i + 1))) {
                                                            } else {
                                                    %>

                                                    <option value="<%out.print(ordenado.get(i + 1));%>"><%out.print(ordenado.get(i + 1));%></option>

                                                    <% }
                                                            }
                                                        }

                                                    %>

                                                </select>
                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-md-6 mb-3 col-lg-6">
                                                <label for="validationCustom03">Departamento</label>
                                                <input type="text" name="deph" class="form-control" id="validationCustom03" placeholder="Ej: Lima" required>

                                            </div>
                                            <div class="col-md-3 mb-3 col-lg-6">
                                                <label for="validationCustom04">Distrito</label>
                                                <input type="text" name="dish" class="form-control" id="validationCustom04" placeholder="Ej: Independencia" required>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6">
                                                <label for="validationCustom03">DNI</label>
                                                <input type="text" name="dnih" class="form-control" id="validationCustom03" placeholder="Ej: 93456789" required>

                                            </div>
                                            <div class="col-md-2 col-lg-2">
                                                <label for="validationCustom04">Edad</label>
                                                <input type="number" name="edadh" class="form-control" id="validationCustom04" placeholder="Ej: 9" required>
                                            </div>
                                            <div class="form-group col-md-4 col-lg-4">
                                                <label for="inputState">Sexo:</label>
                                                <select id="inputState" class="form-control" name="combo4">
                                                    <option selected value="0">Elija:</option>
                                                    <option value="1">Hombre</option>
                                                    <option value="2">Mujer</option>
                                                </select>
                                            </div> 
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3 mb-3 col-lg-12">
                                                <label for="validationCustom04">Dirección</label>
                                                <input type="text" name="direh" class="form-control" id="validationCustom04" placeholder="Ej: San Camilo Mz. A Lt.1" required>

                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">Observaciones Generales del estudiante:</label>
                                            <textarea class="form-control" name="obseh" id="exampleFormControlTextarea1" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>
                            <%--todo sobre padre--%> 
                            <div class="card">
                                <h5 class="card-header">REGISTRO DEL APODERADO</h5>
                                <div class="card-body">


                                    <div class="container">

                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="validationCustom01">Nombre</label>
                                                <input type="text" name="nomp" class="form-control" value="Edson">
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="validationCustom02">Apellidos</label>
                                                <input type="text" name="apep" class="form-control"  value="Vargas Tarazona">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6 col-lg-6">
                                                <label for="inputState">Estado:</label>
                                                <select id="inputState" class="form-control" name="combo1">
                                                    <option selected value="0">ESTADO CIVIL:</option>
                                                    <option value="1">Soltero</option>
                                                    <option value="2">Casado</option>
                                                    <option value="3">Viudo</option>
                                                    <option value="4">Divorciado</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6 col-lg-6">
                                                <label for="inputState">Sexo:</label>
                                                <select id="inputState" class="form-control" name="combo2">
                                                    <option selected value="0">Elija:</option>
                                                    <option value="1">Hombre</option>
                                                    <option value="2">Mujer</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3 col-lg-6">
                                                <label for="validationCustom03">DNI</label>
                                                <input type="text" name="dnip" class="form-control" id="validationCustom03"  value="76876756">

                                            </div>
                                            <div class="col-md-3 mb-3 col-lg-6">
                                                <label for="validationCustom04">Telefono</label>
                                                <input type="number" name="fonop" class="form-control" id="validationCustom04" placeholder="Ej: 984567329" required>

                                            </div>
                                        </div>

                                        <br>

                                        <div class="container col-12 col-lg-10 col-md-10 col-xl-10 col-xs-10 col-sm-10">
                                            <div class="card">
                                                <h5 class="card-header text-center">REGISTRO DE LA CUENTA</h5>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="mb-12 col-lg-12 col-md-12 col-xl-12 col-xs-12 col-sm-12 justify-content-center">
                                                            <label for="validationCustom01">Usuario</label>
                                                            <input type="text" name="usu" class="form-control" id="usuario" placeholder="Ej: Mario" >
                                                        </div>
                                                        <div class="mb-12 col-lg-12 col-md-12 col-xl-12 col-xs-12 col-sm-12 justify-content-center">
                                                            <label for="validationCustom02">Contraseña</label>
                                                            <input type="password" name="contra" class="form-control" id="contra1" placeholder="Ej: *****">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="text-align: center;" class="py-3 row">
                                                <div class="mb-12 col-lg-12 col-md-12 col-xl-12 col-xs-12 col-sm-12 justify-content-center">
                                                    <button type="submit" id="boton" class="btn btn-primary">Registrar</button>  
                                                    <a href="administrador.jsp" class="btn btn-danger">Cancelar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
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


