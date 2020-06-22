<%-- 
    Document   : index
    Created on : 12/09/2018, 07:12:56 PM
    Author     : ALUMNO
--%>

<%@page import="modelo.Alumno"%>
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

    Alumno alu = (Alumno) request.getSession().getAttribute("alumno");

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
            <div class="container-fluid bg-light">

                <section class="bg-light">

                    <div class="container col-12 col-lg-10 col-md-10 col-xl-10 col-xs-10 col-sm-10" >
                        <form action="controladoreditaralumno.do" method="post" class="container" id="needs-validation" novalidate>
                            <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                            <div class="card">
                                <h5 class="card-header bg-dark text-white">EDICIÓN DEL ALUMNO </h5>
                                <div class="card-body">


                                    <div class="container">

                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="validationCustom01">Nombre</label>
                                                <input type="text" name="nomh" class="form-control" value="<%out.print(alu.getNombreh());%>">
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="validationCustom02">Apellidos</label>
                                                <input type="text" name="apeh" class="form-control" value="<%out.print(alu.getApellidoh());%>">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-4 col-lg-6">
                                                <label for="inputState">Grado de estudio Primario:</label>
                                                <select id="inputState" class="form-control" name="combo3">
                                                    <option value="0">Seleccionar:</option>
                                                    <%
                                                        if (li.size() == 0) {
                                                            out.print("<option value=" + 0 + ">No Hay Grados </option>");
                                                        } else {
                                                        if(li.get(0).getGrado().equals(alu.getGrado())){%>
                                                        
                                                        <option value="<%out.print(li.get(0).getGrado());%>" selected="selected"><%out.print(li.get(0).getGrado());%></option>
                                                    <%    for (int i = 0; i < li.size() - 1; i++) {
                                                            if (li.get(i).getGrado().equalsIgnoreCase(li.get(i + 1).getGrado())) {
                                                            } else {
                                                     %>               
                                                    <option value="<%out.print(li.get(i + 1).getGrado());%>"><%out.print(li.get(i + 1).getGrado());%></option>

                                                    <%}
                                                       }%>
                                                     <%}else{%>
                                                    <option value="<%out.print(li.get(0).getGrado());%>"><%out.print(li.get(0).getGrado());%></option>
                                                    <%    for (int i = 0; i < li.size() - 1; i++) {
                                                            if (li.get(i).getGrado().equalsIgnoreCase(li.get(i + 1).getGrado())) {
                                                            } else {
                                                            if (li.get(i+1).getGrado().equalsIgnoreCase(alu.getGrado())) {%>
                                                    <option value="<%out.print(li.get(i + 1).getGrado());%>" selected="selected"><%out.print(li.get(i + 1).getGrado());%></option>      
                                                    <%} else {%>

                                                    <option value="<%out.print(li.get(i + 1).getGrado());%>"><%out.print(li.get(i + 1).getGrado());%></option>

                                                    <%}
                                                                }
                                                            }
                                                        }
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6 col-lg-6">
                                                <label for="inputState">Sección:</label>
                                                <select id="inputState" class="form-control" name="comboSe">
                                                    <option value="0">Seleccionar:</option>
                                                    <%
                                                        List<String> ordenado = new LinkedList<String>();
                                                        for (int i = 0; i < li.size(); i++) {
                                                            ordenado.add(li.get(i).getSeccion());
                                                            Collections.sort(ordenado);
                                                        }

                                                        if (li.size() == 0) {
                                                        } else {
                                                    if (ordenado.get(0).equalsIgnoreCase(alu.getSeccion())) {%>

                                                    <option value="<%out.print(ordenado.get(0));%>" selected="selected"><%out.print(ordenado.get(0));%></option>
                                                    <%   for (int i = 0; i < li.size() - 1; i++) {
                                                            if (ordenado.get(i).equalsIgnoreCase(ordenado.get(i + 1))) {
                                                            } else {
                                                    %>     

                                                    <option value="<%out.print(ordenado.get(i + 1));%>"><%out.print(ordenado.get(i + 1));%></option>

                                                    <% }
                                                    }%> 
                                                    <%} else {%>
                                                    <option value="<%out.print(ordenado.get(0));%>"><%out.print(ordenado.get(0));%></option>

                                                    <%
                                                        for (int i = 0; i < li.size() - 1; i++) {
                                                            if (ordenado.get(i).equalsIgnoreCase(ordenado.get(i + 1))) {
                                                            } else {
                                                            if (ordenado.get(i+1).equalsIgnoreCase(alu.getSeccion())) {%>
                                                    <option value="<%out.print(ordenado.get(i + 1));%>" selected="selected"><%out.print(ordenado.get(i + 1));%></option>        
                                                    <%} else {%>

                                                    <option value="<%out.print(ordenado.get(i + 1));%>"><%out.print(ordenado.get(i + 1));%></option>

                                                    <% }
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    %>

                                                </select>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-6 mb-3 col-lg-6">
                                                <label for="validationCustom03">Departamento</label>
                                                <input type="text" name="deph" class="form-control" value="<%out.print(alu.getDeparh());%>">

                                            </div>
                                            <div class="col-md-3 mb-3 col-lg-6">
                                                <label for="validationCustom04">Distrito</label>
                                                <input type="text" name="dish" class="form-control" value="<%out.print(alu.getDistritoh());%>">

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6">
                                                <label for="validationCustom03">DNI</label>
                                                <input type="text" name="dnih" class="form-control" value="<%out.print(alu.getDnih());%>">

                                            </div>
                                            <div class="col-md-2 col-lg-2">
                                                <label for="validationCustom04">Edad</label>
                                                <input type="number" name="edadh" class="form-control" value="<%out.print(alu.getEdadh());%>">
                                            </div>
                                            <div class="form-group col-md-4 col-lg-4">
                                                <label for="inputState">Sexo:</label>
                                                <select id="inputState" class="form-control" name="combo4">
                                                    <%                                                        if (alu.getSexoh().equalsIgnoreCase("Hombre")) {
                                                    %>
                                                    <option value="1" selected="selected">Hombre</option>
                                                    <option value="2">Mujer</option>
                                                    <%} else {%>
                                                    <option value="1">Hombre</option>
                                                    <option value="2" selected="selected">Mujer</option>    
                                                    <%}%>  

                                                </select>
                                            </div>
                                            
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3 mb-3 col-lg-12">
                                                <label for="validationCustom04">Dirección</label>
                                                <input type="text" name="direh" class="form-control" value="<%out.print(alu.getDireccionh());%>">

                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">Observaciones Generales del estudiante:</label>
                                            <textarea  class="form-control" name="obseh" rows="3" ><%out.print(alu.getObserh());%></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br>
                            <%--todo sobre padre--%> 
                            <div class="card">
                                <h5 class="card-header bg-dark text-white">EDICIÓN DEL APODERADO</h5>
                                <div class="card-body">


                                    <div class="container">

                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="validationCustom01">Nombre</label>
                                                <input type="text" name="nomp" class="form-control" readonly="readonly" value="<%out.print(alu.getNombrep());%>">
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="validationCustom02">Apellidos</label>
                                                <input type="text" name="apep" class="form-control" readonly="readonly" value="<%out.print(alu.getApellidop());%>">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6 col-lg-6">
                                                <label for="inputState">Estado:</label>
                                                <select id="inputState" class="form-control" name="combo1">
                                                    <%
                                                        if (alu.getEstado().equalsIgnoreCase("soltero")) {
                                                    %>
                                                    <option value="1" selected="selected">Soltero</option>
                                                    <option value="2">Casado</option>
                                                    <option value="3">Viudo</option>
                                                    <option value="4">Divorciado</option>
                                                    <%} else if (alu.getEstado().equalsIgnoreCase("casado")) {%>
                                                    <option value="1" >Soltero</option>
                                                    <option value="2" selected="selected">Casado</option>
                                                    <option value="3">Viudo</option>
                                                    <option value="4">Divorciado</option>   
                                                    <%} else if (alu.getEstado().equalsIgnoreCase("viudo")) {%>
                                                    <option value="1" >Soltero</option>
                                                    <option value="2">Casado</option>
                                                    <option value="3"  selected="selected">Viudo</option>
                                                    <option value="4">Divorciado</option>   
                                                    <%} else if (alu.getEstado().equalsIgnoreCase("divorciado")) {%>
                                                    <option value="1" >Soltero</option>
                                                    <option value="2" >Casado</option>
                                                    <option value="3">Viudo</option>
                                                    <option value="4" selected="selected">Divorciado</option>   
                                                    <%}%> 

                                                </select>
                                            </div>
                                            <div class="form-group col-md-6 col-lg-6">
                                                <label for="inputState">Sexo:</label>
                                                <select id="inputState" class="form-control" name="combo2">
                                                    <%
                                                        if (alu.getSexop().equalsIgnoreCase("Hombre")) {
                                                    %>
                                                    <option value="1" selected="selected">Hombre</option>
                                                    <option value="2">Mujer</option>
                                                    <%} else {%>
                                                    <option value="1">Hombre</option>
                                                    <option value="2" selected="selected">Mujer</option>    
                                                    <%}%>  
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3 col-lg-6">
                                                <label for="validationCustom03">DNI</label>
                                                <input type="text" name="dnip" class="form-control" id="validationCustom03" readonly="readonly" value="<%out.print(alu.getDnip());%>">

                                            </div>
                                            <div class="col-md-3 mb-3 col-lg-6">
                                                <label for="validationCustom04">Teléfono</label>
                                                <input type="number" name="fonop" class="form-control" value="<%out.print(alu.getTelefonoh());%>">

                                            </div>
                                        </div>

                                        <br>

                                        <div class="container col-12 col-lg-10 col-md-10 col-xl-10 col-xs-10 col-sm-10">
                                            <div class="card">
                                                <h5 class="card-header text-center bg-dark text-white">EDICIÓN DE LA CUENTA</h5>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="mb-12 col-lg-12 col-md-12 col-xl-12 col-xs-12 col-sm-12 justify-content-center">
                                                            <label for="validationCustom01">Usuario</label>
                                                            <input type="text" name="usu" class="form-control" value="<%out.print(alu.getUsuario());%>" readonly="readonly">
                                                        </div>
                                                        <div class="mb-12 col-lg-12 col-md-12 col-xl-12 col-xs-12 col-sm-12 justify-content-center">
                                                            <label for="validationCustom02">Contraseña</label>
                                                            <input type="password" name="contra" class="form-control" value="<%out.print(alu.getContra());%>">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="text-align: center;" class="py-3 row">
                                                <div class="mb-12 col-lg-12 col-md-12 col-xl-12 col-xs-12 col-sm-12 justify-content-center">
                                                    <button type="submit" id="boton" class="btn btn-success">Editar</button>  
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


