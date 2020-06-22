/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Anio;
import modelo.EsNumero;

/**
 *
 * @author Alumno UCH
 */
public class ControladorEliminarAnio extends HttpServlet {

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
          String an = request.getParameter("anio");
       if(an.equals("")){
        String error = "Debera de completar todos los campos";
          request.getSession().setAttribute("error", error);
          request.getRequestDispatcher("errorAdmi2.jsp").forward(request, response);   
       }else{
        if(EsNumero.validar(an)==false){
         String error = "No es un numero el año";
          request.getSession().setAttribute("error", error);
          request.getRequestDispatcher("errorAdmi2.jsp").forward(request, response);   
        }else{
           int ani = Integer.parseInt(an);
            Anio a = new Anio(ani);
            try {
                if(a.eliminar()==true){
                    request.getRequestDispatcher("administrador2.jsp").forward(request, response);
                }else{
                    String error = "no se pudo eliminar";
                    request.getSession().setAttribute("error", error);   
                    request.getRequestDispatcher("errorAdmi2.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                String error = "Error BDD eliminar Año";
                    request.getSession().setAttribute("error", error);
                    request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
                }
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
