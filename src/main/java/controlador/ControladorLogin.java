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
import modelo.DAOusuario;
import modelo.Usuario;

/**
 *
 * @author KandL
 */
public class ControladorLogin extends HttpServlet {

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
       //antes de que entre a administrador como vez primero pasa por aca
              //aqui recibo todos los valores de los input y del selected como si fuera mi getText()
        String codigo = request.getParameter("txtCodigo");
        String contra = request.getParameter("txtContra");
        String tipo = request.getParameter("tipo");
        //valido que no esten vacios si alguno de ellos esta vacio voto error
         if(codigo.equals("") || contra.equals("") || tipo.equals("")){
          String error = "Debera de completar todos los campos";
          request.getSession().setAttribute("error", error);
          request.getRequestDispatcher("errorLogin.jsp").forward(request, response);
          //sino 
      }else{
          //paseamos el tipo si es 1 es administrador, profesor, padre
         int ti=Integer.parseInt(tipo);
         //ya mira primero despues de parsear a entero creo una instancia de la clase Usuario
         Usuario usuario = new Usuario(codigo, contra, ti);
         //luego esa es la clase pero para valida lo hago con daoUsuario
         //es para validar observa
         DAOusuario da = new DAOusuario(usuario);
         
                  try {
                      if(da.validar()==false){
                          String error = "Datos Incorrectos no esta Registrado";
                          request.getSession().setAttribute("error", error);
                          request.getRequestDispatcher("errorLogin.jsp").forward(request, response);
                      }else{
                          //aqui por tipo de usuario lo envio a diferentes cosas
                          switch(usuario.getTipo()){
                              case 1:
                                  request.getSession().setAttribute("usuario", usuario.getCodigo());
                                  request.getRequestDispatcher("administrador2.jsp").forward(request, response);
                                  break;
                              case 2:
                                  request.getSession().setAttribute("usuario", usuario.getCodigo());
                                  request.getRequestDispatcher("profesor.jsp").forward(request, response);
                                  break;
                              case 3:
                                  request.getSession().setAttribute("usuario", usuario.getCodigo());
                                  request.getRequestDispatcher("padre.jsp").forward(request, response);
                                  break;
                          }
                          
                          
                          
                      }        } catch (SQLException ex) {
                      String error = "Error BDD Login ";
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
