<%-- 
    Document   : probando1
    Created on : 09/10/2018, 12:56:16 AM
    Author     : KandL
--%>

<%@page import="modelo.Curso"%>
<%@page import="modelo.ListaCursos"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="modelo.Aula"%>
<%@page import="modelo.ListaAulas"%>
<%@page import="java.util.LinkedList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
 ListaAulas ls = new ListaAulas(año);
 LinkedList<Aula> li= ls.select();
 ListaCursos ls4 = new ListaCursos(año);
    LinkedList<Curso> li4 = ls4.select();
 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/estilos.jspf" %>
         
    </head>
<body>
    <%@include file="WEB-INF/jspf/cabecera.jspf" %>
    <%@include file="WEB-INF/jspf/navAdministrador.jspf" %>
    <%@include file="WEB-INF/jspf/navAdministrador2.jspf" %>
    <div id="page-content-wrapper container" >
            
                <main role="main" class="bg-light">


            <div class="album py-5 bg-light">
                <div class="container">

                    <div class="row justify-content-center">
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <img class="card-img-top"  alt="secciones" style="height: 100%; width: 100%; display: block;" src="img/seccion.jpg" data-holder-rendered="true">
                                <div class="card-body">
                                    <p class="card-text">Modulo de las Secciones</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="registroSeccion.jsp" class="btn btn-sm btn-outline-secondary">Registrar</a>
                                            <a href="reporteSeccion.jsp" class="btn btn-sm btn-outline-secondary"  >Listar</a>
                                        </div>
                                        <small class="text-muted">Secciones</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <img class="card-img-top"  alt="grados" style="height: 100%; width: 100%; display: block;" src="img/grado.png" data-holder-rendered="true">
                                <div class="card-body">
                                    <p class="card-text">Modulo de los Grados</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="registroGrado.jsp" class="btn btn-sm btn-outline-secondary">Registrar</a>
                                            <a href="reporteGrado.jsp" class="btn btn-sm btn-outline-secondary"  >Listar</a>
                                        </div>
                                        <small class="text-muted">Grados</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <img class="card-img-top"  alt="profesores" style="height: 100%; width: 100%; display: block;" src="img/foto5.png" data-holder-rendered="true">
                                <div class="card-body">
                                    <p class="card-text">Módulo de Profesores</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="<%=request.getContextPath()%>/registroProfesor.jsp" class="btn btn-sm btn-outline-secondary">Registrar</a>
                                            <a href="<%=request.getContextPath()%>/repoprofe.do?an=<%out.print(anio);%>" class="btn btn-sm btn-outline-secondary"  >Listar</a>
                                        </div>
                                        <small class="text-muted">Profesores</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <img class="card-img-top"  alt="aulas" style="height: 100%; width: 100%; display: block;" src="img/aula.png" data-holder-rendered="true">
                                <div class="card-body">
                                    <p class="card-text">Modulo de los Aulas</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="registroAulas.jsp" class="btn btn-sm btn-outline-secondary">Registrar</a>
                                            <a href="reporteAula.jsp" class="btn btn-sm btn-outline-secondary"  >Listar</a>
                                        </div>
                                        <small class="text-muted">Aulas</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <img class="card-img-top"  alt="alumnos" style="height: 100%; width: 100%; display: block;" src="img/foto4.png" data-holder-rendered="true">
                                <div class="card-body">
                                    <p class="card-text">Módulo de Alumnos</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">

                                            <a href="<%=request.getContextPath()%>/registroAlumno.jsp" class="btn btn-sm btn-outline-secondary">Registrar</a>
                                            <a href="#ventana1" class="btn btn-sm btn-outline-secondary"  data-toggle="modal">Listar</a>

                                        </div>
                                        <small class="text-muted">alumnos</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <img class="card-img-top"  alt="cursos" style="height: 100%; width: 100%; display: block;" src="img/libro.png" data-holder-rendered="true">
                                <div class="card-body">
                                    <p class="card-text">Modulo de los Curso</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="registroCurso.jsp" class="btn btn-sm btn-outline-secondary">Registrar</a>
                                            <a href="reporteCurso.jsp" class="btn btn-sm btn-outline-secondary"  >Listar</a>
                                        </div>
                                        <small class="text-muted">Curso</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <img class="card-img-top"  alt="Asignacion" style="height: 100%; width: 100%; display: block;" src="img/asignacion.png" data-holder-rendered="true">
                                <div class="card-body">
                                    <p class="card-text">Modulo de los Asignaciones</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="registroAsignacion.jsp" class="btn btn-sm btn-outline-secondary">Registrar</a>
                                            <a href="reporteAsignacion.jsp" class="btn btn-sm btn-outline-secondary"  >Listar</a>
                                        </div>
                                        <small class="text-muted">Asignación</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <img class="card-img-top"  alt="observacion" style="height: 100%; width: 100%; display: block;" src="img/obser.png" data-holder-rendered="true">
                                <div class="card-body">
                                    <p class="card-text">Observaciones</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="reporteObser.jsp" class="btn btn-sm btn-outline-secondary">Reporte</a>
                                        </div>
                                        <small class="text-muted">Observación</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <img class="card-img-top"  alt="Nota" style="height: 100%; width: 100%; display: block;" src="img/notas.png" data-holder-rendered="true">
                                <div class="card-body">
                                    <p class="card-text">Módulo de los Notas</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="#ventana4" class="btn btn-sm btn-outline-secondary" data-toggle="modal">Reporte</a>
                                            <a href="#ventana5" class="btn btn-sm btn-outline-secondary" data-toggle="modal">Reporte Total</a>
                                        </div>
                                        <small class="text-muted">Notas</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         
        </main>
            <div class="modal fade" id="ventana1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        
                        <div class="modal-header">
                            <h4 class="modal-title text-center">Seleccione Aula:</h4> 
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <form action="repoalumno.do" method="post">
                            <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                        <div class="modal-body">
                           <div class="form-row">
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Grado de estudio Primario:</label>
                                        <select id="inputState" class="form-control" name="grado">
                                            <option selected="selected" value="0">Seleccionar:</option>
                                            <%
                                                
                                                if (li.size() == 0) {
                                                    out.print("<option value=" + 0 + ">No Hay Grados </option>");
                                                } else {%>
                                                <option value="<%out.print(li.get(0).getGrado());%>"><%out.print(li.get(0).getGrado());%></option>
                                                <%    for(int i=0;i<li.size()-1;i++){
                                                        if(li.get(i).getGrado().equalsIgnoreCase(li.get(i+1).getGrado())){  
                                                        }else{
                                               %>
                                               
                                               <option value="<%out.print(li.get(i+1).getGrado());%>"><%out.print(li.get(i+1).getGrado());%></option>
                                               
                                                <% }  }
                                                }

                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Sección:</label>
                                        <select id="inputState" class="form-control" name="sec">
                                            <option selected="selected" value="0">Seleccionar:</option>
                                            <% 
                                                List<String> ordenado =  new LinkedList<String>();
                                                for(int i=0;i<li.size();i++){
                                             ordenado.add(li.get(i).getSeccion());
                                             Collections.sort(ordenado);
                                                }
                                                
                                             if (li.size() == 0) {
                                                    out.print("<option value=" + 0 + ">No Hay Secciones </option>");
                                                } else {%>
                                                <option value="<%out.print(ordenado.get(0));%>"><%out.print(ordenado.get(0));%></option>
                                                <%   for(int i=0;i<li.size()-1;i++){
                                                        if(ordenado.get(i).equalsIgnoreCase(ordenado.get(i+1))){  
                                                        }else{
                                               %>
                                               
                                               <option value="<%out.print(ordenado.get(i+1));%>"><%out.print(ordenado.get(i+1));%></option>
                                               
                                                <% }  }
                                                }
                                             
                                             
                                            %>

                                        </select>
                                    </div>
                                </div>
                        </div>
                        
                        
                        <div class="modal-footer">
                             <button type="submit" class="btn btn-primary" >Ver</button>
                             <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="ventana4">
                <div class="modal-dialog">
                    <div class="modal-content">
                        
                        <div class="modal-header">
                            <h4 class="modal-title text-center">Seleccione Registro:</h4> 
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <form action="reportenotaad.do" method="post">
                            <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                        <div class="modal-body">
                           <div class="form-row">
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Grado de estudio Primario:</label>
                                        <select id="inputState" class="form-control" name="grado">
                                            <option selected="selected" value="0">Seleccionar:</option>
                                            <%
                                                
                                                if (li.size() == 0) {
                                                    out.print("<option value=" + 0 + ">No Hay Grados </option>");
                                                } else {%>
                                                <option value="<%out.print(li.get(0).getGrado());%>"><%out.print(li.get(0).getGrado());%></option>
                                                <%    for(int i=0;i<li.size()-1;i++){
                                                        if(li.get(i).getGrado().equalsIgnoreCase(li.get(i+1).getGrado())){  
                                                        }else{
                                               %>
                                               
                                               <option value="<%out.print(li.get(i+1).getGrado());%>"><%out.print(li.get(i+1).getGrado());%></option>
                                               
                                                <% }  }
                                                }

                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Sección:</label>
                                        <select id="inputState" class="form-control" name="sec">
                                            <option selected="selected" value="0">Seleccionar:</option>
                                            <% 
                                              List<String> ordenado2 =  new LinkedList<String>();
                                                for(int i=0;i<li.size();i++){
                                             ordenado2.add(li.get(i).getSeccion());
                                             Collections.sort(ordenado2);
                                                }
                                                
                                             if (li.size() == 0) {
                                                    out.print("<option value=" + 0 + ">No Hay Secciones </option>");
                                                } else {%>
                                                <option value="<%out.print(ordenado2.get(0));%>"><%out.print(ordenado2.get(0));%></option>
                                                <%   for(int i=0;i<li.size()-1;i++){
                                                        if(ordenado2.get(i).equalsIgnoreCase(ordenado2.get(i+1))){  
                                                        }else{
                                               %>
                                               
                                               <option value="<%out.print(ordenado2.get(i+1));%>"><%out.print(ordenado2.get(i+1));%></option>
                                               
                                                <% }  }
                                                }
                                             
                                             
                                            %>

                                        </select>
                                    </div>
                                </div>
                                            <div class="form-row">
                                  <div class="form-group col-md-12 col-lg-12">
                                        <label for="inputState"> Lista de Cursos:</label>
                                        <select id="inputState" class="form-control" name="curso">
                                            <option selected="selected" value="0">Seleccionar:</option>
                                            <%
                                                if (li4.size() == 0) {
                                                    out.print("<option value=" + 0 + ">No Hay Cursos </option>");
                                                } else {
                                                    for (int i = 0; i < li4.size(); i++) {
                                               %>
                                               <option value="<%out.print(li4.get(i).getCodigo());%>"><%out.print(li4.get(i).getNombre());%></option>
                                                <%    }
                                                }

                                            %>
                                        </select>
                                    </div>
                                                
                                            </div>      
                        </div>
                        
                        
                        <div class="modal-footer">
                             <button type="submit" class="btn btn-primary" >Ver</button>
                             <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="ventana5">
                <div class="modal-dialog">
                    <div class="modal-content">
                        
                        <div class="modal-header">
                            <h4 class="modal-title text-center">Seleccione Aula:</h4> 
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <form action="reportetotal.do" method="post">
                            <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
                        <div class="modal-body">
                           <div class="form-row">
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Grado de estudio Primario:</label>
                                        <select id="inputState" class="form-control" name="grado">
                                            <option selected="selected" value="0">Seleccionar:</option>
                                            <%
                                                
                                                if (li.size() == 0) {
                                                    out.print("<option value=" + 0 + ">No Hay Grados </option>");
                                                } else {%>
                                                <option value="<%out.print(li.get(0).getGrado());%>"><%out.print(li.get(0).getGrado());%></option>
                                                <%    for(int i=0;i<li.size()-1;i++){
                                                        if(li.get(i).getGrado().equalsIgnoreCase(li.get(i+1).getGrado())){  
                                                        }else{
                                               %>
                                               
                                               <option value="<%out.print(li.get(i+1).getGrado());%>"><%out.print(li.get(i+1).getGrado());%></option>
                                               
                                                <% }  }
                                                }

                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Sección:</label>
                                        <select id="inputState" class="form-control" name="sec">
                                            <option selected="selected" value="0">Seleccionar:</option>
                                            <% 
                                                List<String> ordenado3 =  new LinkedList<String>();
                                                for(int i=0;i<li.size();i++){
                                             ordenado3.add(li.get(i).getSeccion());
                                             Collections.sort(ordenado3);
                                                }
                                                
                                             if (li.size() == 0) {
                                                    out.print("<option value=" + 0 + ">No Hay Secciones </option>");
                                                } else {%>
                                                <option value="<%out.print(ordenado3.get(0));%>"><%out.print(ordenado3.get(0));%></option>
                                                <%   for(int i=0;i<li.size()-1;i++){
                                                        if(ordenado3.get(i).equalsIgnoreCase(ordenado3.get(i+1))){  
                                                        }else{
                                               %>
                                               
                                               <option value="<%out.print(ordenado3.get(i+1));%>"><%out.print(ordenado3.get(i+1));%></option>
                                               
                                                <% }  }
                                                }
                                             
                                             
                                            %>

                                        </select>
                                    </div>
                                </div>
                        </div>
                        
                        
                        <div class="modal-footer">
                             <button type="submit" class="btn btn-primary" >Ver</button>
                             <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
             <%@include file="WEB-INF/jspf/venRe.jspf" %> 
             <%@include file="WEB-INF/jspf/venRePro.jspf" %> 
             <%@include file="WEB-INF/jspf/footer.jspf" %>
        </div>
    </div>

    
    <%@include file="WEB-INF/jspf/jsfooter.jspf" %>
    
    
        <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>



</body>
</html>
