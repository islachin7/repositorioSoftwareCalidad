<%@page import="modelo.ListaAlumnos"%>
<%@page import="modelo.Literal"%>
<%@page import="modelo.Nota"%>
<%@page import="java.util.LinkedList"%>
<%@page import="modelo.ListaNotas"%>
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
%>
<!DOCTYPE html>

<html ng-app>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/estilos.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/estilos.jspf" %>     
        <%@include file="WEB-INF/jspf/cabecera.jspf" %>
        <%@include file="WEB-INF/jspf/navAdministrador.jspf" %>
<%
ListaAlumnos alumnos = new ListaAlumnos(año);
alumnos.select();

LinkedList<Nota> nota= (LinkedList<Nota>)request.getSession().getAttribute("lista");
String correo = (String) request.getSession().getAttribute("correo");
String nombre ="",grado ="",seccion ="";
if (nota == null) {
                String error = "todavia no tiene nota";
                request.getSession().setAttribute("error", error);
                request.getRequestDispatcher("errorPadre.jsp").forward(request, response);
            } else {
 for(int i = 0 ; i< nota.size(); i++){
    nombre = nota.get(i).getAlumno();
    grado = nota.get(i).getGra();
    seccion = nota.get(i).getSec();
}   
}


%>
<div class="justify-content-center">
    <form method="post" action="reportetotal.do">
       <input name="an" type="text" style="visibility: hidden; width: 1px; height: 1px;" value="<%out.print(anio);%>">
     <input style="width: 1px; height: 1px; visibility: hidden;" name="grado" value="<%out.print(grado);%>">
<input style="width: 1px; height: 1px; visibility: hidden;" name="sec" value="<%out.print(seccion);%>">
        <button class="btn btn-primary text-white" type="submit"><i class="fas fa-backward">&nbsp; Volver atrás</i></button>   
    </form>
</div> 

<div class="row"  style="text-align: center;" id="HTMLtoPDF">
          
            <div class="col-12">
            <table class="table table-hover table-light table-responsive-lg table-responsive-md ">
  <thead>
      
    <!-----1----->
    <tr>    
        <th scope="col" colspan="13" class="text-center">"Año del Diálogo y la Reconciliación Nacional"</th>
        <td></td>
    </tr>
    
  </thead>
  
  <tbody>
      <!-----2----->
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      
      </tr>
      
      <!-----3----->
      <tr>
        <td scope="col" colspan="13" class="text-center">BOLETA DE INFORMACIÓN – AÑO ESCOLAR 2018</td>

      </tr>
      
      <!-----4----->
      <tr>
          <td scope="col" colspan="2" scope="row" rowspan="5">
              <div class="container">
                  <img src="img\escudo.png">
              </div>
          </td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td scope="col" colspan="2" scope="row" rowspan="5">
              <div class="container">
                  <img src="img\cole_1.png"
              </div>
          </td>
       
      </tr>
      
      <!-----5----->
      <tr>
        
        <td scope="col" colspan="2" class=" border border-danger">INSTITUCION EDUCATIVA</td>
        <td scope="col" colspan="6" class="text-center border border-danger"> LA INMACULADA CONCEPCION</td>
        <td></td>
     
       

      </tr>
      
      
      <!-----6----->
      <tr>
        
        <td scope="col" colspan="2" class="border border-danger">NIVEL EDUCATIVO</td>
        <td scope="col" colspan="6" class="text-center border border-danger"> PRIMARIA </td>
        <td></td>

      </tr>
      
      
      <!-----7----->
      <tr>
        
        <td scope="col" colspan="2" class="border border-danger">GRADO</td>
        <td scope="col" class="text-center border border-danger"><%out.print(grado);%></td>
        <td scope="col" colspan="2" class="text-center border border-danger">SECCION</td>
        <td scope="col" colspan="3" class="text-center border border-danger"><%out.print(seccion);%></td>
        <td></td>
       
      </tr>
      
      
      <!-----8----->
      <tr>
        
        <td scope="col" colspan="2" class="border border-danger">ESTUDIANTE</td>
        <td scope="col" colspan="6" class="text-center border border-danger">
            <%out.print(alumnos.buscar(correo).getNombreh()+" "+alumnos.buscar(correo).getApellidoh());%>
        </td>
        <td></td>
      
      </tr>
      
      
      <!-----9----->
      <tr>
          <td style="visibility: hidden">1</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       
        
      </tr>
      
      
      <!-----10----->
      <tr >
        <td scope="col" colspan="3" scope="row" rowspan="2" class="text-center  border border-danger">AREAS CURRICULARES</td>
        <td scope="col" colspan="4" class="text-center border border-danger">PERIODOS DE EVALUACION</td>
        <td scope="col" colspan="6" class="text-center border border-danger">SITUACION FINAL DE EVALUACION</td>

      </tr>
      
      
      <!----11----->
      <tr>
          <td scope="col" class="text-center border border-danger">I</br> BIMESTRE</td>
        <td scope="col" class="text-center border border-danger">II BIMESTRE</td>
        <td scope="col" class="text-center border border-danger">III BIMESTRE</td>
        <td scope="col" class="text-center border border-danger">IV BIMESTRE</td>
        <td scope="col" colspan="2" class="text-center border border-danger">LOGRO ALCANZADO</td>
        <td scope="col" colspan="2" class="text-center border border-danger">AREAS CURRICULARES APROBADAS</td>
        <td scope="col" colspan="2" class="text-center border border-danger">REQUIERE RECUPERACION PEDAGOGICA</td>

      </tr>
      <%
        String proMat1="",proMat2="",proMat3="",proMat4="";
      for(int i = 0; i<nota.size();i++){
        if(nota.get(i).getBime().equals("I") && nota.get(i).getCur().equals("MAT")){
          proMat1=Literal.notaLiteral(nota.get(i).getPromedio());
        }else if(nota.get(i).getBime().equals("II") && nota.get(i).getCur().equals("MAT")){
          proMat2=Literal.notaLiteral(nota.get(i).getPromedio());
        }else if(nota.get(i).getBime().equals("III") && nota.get(i).getCur().equals("MAT")){
          proMat3=Literal.notaLiteral(nota.get(i).getPromedio());  
        }else if(nota.get(i).getBime().equals("IV") && nota.get(i).getCur().equals("MAT")){
          proMat4=Literal.notaLiteral(nota.get(i).getPromedio());  
        }  
      }
      %>
      
      <!-----12----->
      <tr>
        <td scope="col" class="text-center border border-danger">1.</td>
        <td scope="col" colspan="2" class="border border-danger">MATEMATICA</td>
        <td scope="col" class="text-center border border-danger"><%out.print(proMat1);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proMat2);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proMat3);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proMat4);%></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>

      </tr>
      
      <%
        String proCom1="",proCom2="",proCom3="",proCom4="";
      for(int i = 0; i<nota.size();i++){
        if(nota.get(i).getBime().equals("I") && nota.get(i).getCur().equals("COM")){
          proCom1=Literal.notaLiteral(nota.get(i).getPromedio());
        }else if(nota.get(i).getBime().equals("II") && nota.get(i).getCur().equals("COM")){
          proCom2=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("III") && nota.get(i).getCur().equals("COM")){
          proCom3=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("IV") && nota.get(i).getCur().equals("COM")){
          proCom4=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }  
      }
      %>
      <!-----13----->
      <tr>
        <td scope="col" class="text-center border border-danger">2.</td>
        <td scope="col" colspan="2" class="border border-danger">COMUNICACIÓN</td>
        <td scope="col" class="text-center border border-danger"><%out.print(proCom1);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proCom2);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proCom3);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proCom4);%></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>

      </tr>
      
       <%
        String proCi1="",proCi2="",proCi3="",proCi4="";
      for(int i = 0; i<nota.size();i++){
        if(nota.get(i).getBime().equals("I") && nota.get(i).getCur().equals("CYT")){
          proCi1=Literal.notaLiteral(nota.get(i).getPromedio());
        }else if(nota.get(i).getBime().equals("II") && nota.get(i).getCur().equals("CYT")){
          proCi2=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("III") && nota.get(i).getCur().equals("CYT")){
          proCi3=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("IV") && nota.get(i).getCur().equals("CYT")){
          proCi4=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }  
      }
      %>
      <!-----14----->
      <tr>
        <td scope="col" class="text-center border border-danger">3.</td>
        <td scope="col" colspan="2" class="border border-danger">CIENCIA Y TECNOLOGÍA</td>
        <td scope="col" class="text-center border border-danger"><%out.print(proCi1);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proCi2);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proCi3);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proCi4);%></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>

      </tr>
      
       <%
        String proAr1="",proAr2="",proAr3="",proAr4="";
      for(int i = 0; i<nota.size();i++){
        if(nota.get(i).getBime().equals("I") && nota.get(i).getCur().equals("AR")){
          proAr1=Literal.notaLiteral(nota.get(i).getPromedio());
        }else if(nota.get(i).getBime().equals("II") && nota.get(i).getCur().equals("AR")){
          proAr2=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("III") && nota.get(i).getCur().equals("AR")){
          proAr3=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("IV") && nota.get(i).getCur().equals("AR")){
          proAr4=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }  
      }
      %>
      <!-----15----->
      <tr>
        <td scope="col" class="text-center border border-danger">4.</td>
        <td scope="col" colspan="2" class="border border-danger">ARTE Y CULTURA</td>
        <td scope="col" class="text-center border border-danger"><%out.print(proAr1);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proAr2);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proAr3);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proAr4);%></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>

      </tr>
      
       <%
        String proPs1="",proPs2="",proPs3="",proPs4="";
      for(int i = 0; i<nota.size();i++){
        if(nota.get(i).getBime().equals("I") && nota.get(i).getCur().equals("PS")){
          proPs1=Literal.notaLiteral(nota.get(i).getPromedio());
        }else if(nota.get(i).getBime().equals("II") && nota.get(i).getCur().equals("PS")){
          proPs2=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("III") && nota.get(i).getCur().equals("PS")){
          proPs3=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("IV") && nota.get(i).getCur().equals("PS")){
          proPs4=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }  
      }
      %>
      <!-----16----->
      <tr>
        <td scope="col" class="text-center border border-danger">5.</td>
        <td scope="col" colspan="2" class="border border-danger">PERSONAL SOCIAL</td>
        <td scope="col" class="text-center border border-danger"><%out.print(proPs1);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proPs2);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proPs3);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proPs4);%></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>

      </tr>
      
       <%
        String proEf1="",proEf2="",proEf3="",proEf4="";
      for(int i = 0; i<nota.size();i++){
        if(nota.get(i).getBime().equals("I") && nota.get(i).getCur().equals("EF")){
          proEf1=Literal.notaLiteral(nota.get(i).getPromedio());
        }else if(nota.get(i).getBime().equals("II") && nota.get(i).getCur().equals("EF")){
          proEf2=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("III") && nota.get(i).getCur().equals("EF")){
          proEf3=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("IV") && nota.get(i).getCur().equals("EF")){
          proEf4=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }  
      }
      %>
      <!-----17----->
      <tr>
        <td scope="col" class="text-center border border-danger">6.</td>
        <td scope="col" colspan="2" class="border border-danger">EDUCACION FISICA</td>
        <td scope="col" class="text-center border border-danger"><%out.print(proEf1);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proEf2);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proEf3);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proEf4);%></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>

      </tr>
      
      <%
        String proEr1="",proEr2="",proEr3="",proEr4="";
      for(int i = 0; i<nota.size();i++){
        if(nota.get(i).getBime().equals("I") && nota.get(i).getCur().equals("ED")){
          proEr1=Literal.notaLiteral(nota.get(i).getPromedio());
        }else if(nota.get(i).getBime().equals("II") && nota.get(i).getCur().equals("ED")){
          proEr2=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("III") && nota.get(i).getCur().equals("ED")){
          proEr3=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("IV") && nota.get(i).getCur().equals("ED")){
          proEr4=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }  
      }
      %>
      <!-----18----->
      <tr>
        <td scope="col" class="text-center border border-danger">7.</td>
        <td scope="col" colspan="2" class="border border-danger">EDUCACION RELIGIOSA</td>
        <td scope="col" class="text-center border border-danger"><%out.print(proEr1);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proEr2);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proEr3);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proEr4);%></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>

      </tr>
      
      <%
        String proIn1="",proIn2="",proIn3="",proIn4="";
      for(int i = 0; i<nota.size();i++){
        if(nota.get(i).getBime().equals("I") && nota.get(i).getCur().equals("IN")){
          proIn1=Literal.notaLiteral(nota.get(i).getPromedio());
        }else if(nota.get(i).getBime().equals("II") && nota.get(i).getCur().equals("IN")){
          proIn2=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("III") && nota.get(i).getCur().equals("IN")){
          proIn3=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }else if(nota.get(i).getBime().equals("IV") && nota.get(i).getCur().equals("IN")){
          proIn4=Literal.notaLiteral(nota.get(i).getPromedio()); 
        }  
      }
      %>
      <!-----19----->
      <tr>
        <td scope="col" class="text-center border border-danger">8.</td>
        <td scope="col" colspan="2" class="border border-danger">INGLES</td>
        <td scope="col" class="text-center border border-danger"><%out.print(proIn1);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proIn2);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proIn3);%></td>
        <td scope="col" class="text-center border border-danger"><%out.print(proIn4);%></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>
        <td scope="col" colspan="2" class="text-center border border-danger"></td>

      </tr>
  </tbody>
</table>
                </div>
       </div> 
        <%@include file="WEB-INF/jspf/footer.jspf" %> 
        <%@include file="WEB-INF/jspf/jsfooter.jspf" %>

</body>
</html>
