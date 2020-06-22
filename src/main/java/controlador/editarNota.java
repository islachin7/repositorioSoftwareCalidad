/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ListaNotas;
import modelo.Nota;

/**
 *
 * @author KandL
 */
public class editarNota extends HttpServlet {

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
        String grado = request.getParameter("grado");
        String secc = request.getParameter("seccion");
        String curso = request.getParameter("curso");
        String profe = request.getParameter("profe");
        String bime = request.getParameter("bime");
        String an = request.getParameter("an");
        int año = Integer.parseInt(an);

        ListaNotas no = new ListaNotas(año);
        try {
            LinkedList<Nota> lis = no.select();
        } catch (SQLException ex) {
            String error = "error BDD listar para editar notas";
                    request.getSession().setAttribute("error", error);
                    request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
                }
        LinkedList<Nota> listaOficial = no.reporteNotaAlumnoBimestre(grado, secc, curso, bime, profe);
        request.getSession().setAttribute("gra", grado);
        request.getSession().setAttribute("cur", curso);
        request.getSession().setAttribute("sec", secc);
        request.getSession().setAttribute("pro", profe);
        request.getSession().setAttribute("bime", bime);
        request.getSession().setAttribute("notas", listaOficial);
        request.getRequestDispatcher("editarNota.jsp").forward(request, response);
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
