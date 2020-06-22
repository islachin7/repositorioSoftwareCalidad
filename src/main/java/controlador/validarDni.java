/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.reniec;

/**
 *
 * @author alumno
 */
public class validarDni extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String dni = request.getParameter("dni");
        
        if(dni.equals("")){
            String error = "No hay ningun dni";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);   
        }else{
        try{
            /*
        reniec re = new reniec();
        String recivido = re.dni("http://aplicaciones007.jne.gob.pe/srop_publico/consulta/afiliado/getNombresCiudadano?DNI="+dni);
        StringTokenizer st= new StringTokenizer(recivido,"|");
        String apeP = st.nextToken();
        String apeM = st.nextToken();
        String Nombre = st.nextToken();
        request.getSession().setAttribute("ape1", apeP);
        request.getSession().setAttribute("ape2", apeM);
        request.getSession().setAttribute("nom", Nombre);
        request.getSession().setAttribute("dni", dni);
        request.getRequestDispatcher("registroAlumno.jsp").forward(request, response);   */
        }catch(Exception e){
        String error = "No se pudo validar el dni del padre "+e;
        request.getSession().setAttribute("error", error);
        request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);    
        }
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
