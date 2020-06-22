/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Alumno;
import modelo.EsNumero;
import modelo.ListaAlumnos;
import modelo.ListaAulas;

/**
 *
 * @author KandL
 */
public class ControladorAlumno extends HttpServlet {

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
        response.setContentType("text/html;charset=utf-8");
      try{
        String an = request.getParameter("an");
        int año = Integer.parseInt(an);
        ListaAulas aulas = new ListaAulas(año);
        aulas.select();
        ListaAlumnos alumnos = new ListaAlumnos(año);
        alumnos.select();
        int valor1 = 0,valor2 = 0;
               
        
        
        String combo1 = request.getParameter("combo1");
        String estado = "";

        if (combo1.equalsIgnoreCase("0")) {
            String error = "No selecciono ningun estado Civil";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
        } else {
            if (combo1.equalsIgnoreCase("1")) {
                estado = "soltero";
            } else {
                if (combo1.equalsIgnoreCase("2")) {
                    estado = "casado";
                } else {
                    if (combo1.equalsIgnoreCase("3")) {
                        estado = "viudo";
                    } else {
                        if (combo1.equalsIgnoreCase("4")) {
                            estado = "divorciado";
                        }
                    }
                }
            }
        }

        String combo2 = request.getParameter("combo2");
        String sexo = "";

        if (combo2.equalsIgnoreCase("0")) {
            String error = "No selecciono ningun Sexo";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
        } else {
            if (combo2.equalsIgnoreCase("1")) {
                sexo = "Hombre";
            } else {
                if (combo2.equalsIgnoreCase("2")) {
                    sexo = "Mujer";
                }
            }
        }

        String nombre = request.getParameter("nomp");
        String apellido = request.getParameter("apep");
        String dnip = request.getParameter("dnip");
        String telef = request.getParameter("fonop");

        //ALUMNO
        String grado = request.getParameter("combo3");
        if (grado.equalsIgnoreCase("0")) {
            String error = "No selecciono ningun Grado";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
        }

        String combo4 = request.getParameter("combo4");
        String sexoh = "";

        if (combo4.equalsIgnoreCase("0")) {
            String error = "No selecciono ningun Sexo";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
        } else {
            if (combo4.equalsIgnoreCase("1")) {
                sexoh = "Hombre";
            } else {
                if (combo4.equalsIgnoreCase("2")) {
                    sexoh = "Mujer";
                }
            }
        }

        String nomh = request.getParameter("nomh");
        String apeh = request.getParameter("apeh");
        String deph = request.getParameter("deph");
        String dish = request.getParameter("dish");
        String dnih = request.getParameter("dnih");
        String edadh = request.getParameter("edadh");
        String secci = request.getParameter("comboSe");
        if (secci.equalsIgnoreCase("0")) {
            String error = "No selecciono ninguna Sección";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
        }

        String direh = request.getParameter("direh");
        String obseh = request.getParameter("obseh");

        String usu = request.getParameter("usu");
        String contra = request.getParameter("contra");

        if (estado.equals("") || sexo.equals("") || nombre.equals("") || apellido.equals("")
                || dnip.equals("") || telef.equals("")) {
            String error = "Debera de completar todos los campos del padre o apoderado";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
        } else {
            if (grado.equals("") || sexoh.equals("") || nomh.equals("") || apeh.equals("")
                    || deph.equals("") || dish.equals("") || dnih.equals("") || edadh.equals("")
                    || direh.equals("") || obseh.equals("") || usu.equals("")
                    || contra.equals("")) {
                String error = "Debera de completar todos los campos del Alumno";
                request.getSession().setAttribute("error", error);
                request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
            } else {
                if (EsNumero.validar(telef) == false || EsNumero.validar(edadh) == false) {
                    String error = "Error No es numero el telefono o la edad";
                    request.getSession().setAttribute("error", error);
                    request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
                } else {
                    int te = Integer.parseInt(telef);
                    int ed = Integer.parseInt(edadh);

                    Alumno al = new Alumno(grado, secci, sexoh, nomh, apeh, deph, dish, dnih, direh, obseh, usu, contra, estado, sexo, nombre, apellido, dnip,ed, te,año);
                    valor1 =alumnos.reporteAlumno(grado, secci).size();
                    valor2 = aulas.verAula(grado, secci).getCantMax();
                    if(valor1==valor2){
                     String error = "Aula llena no se puede insertar";
                     request.getSession().setAttribute("error", error);
                     request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);   
                    }else{
                     boolean insertar= al.insert();
                     if (insertar == true) {
                        request.getSession().setAttribute("alumno", al);
                        request.getRequestDispatcher("inforAlumno.jsp").forward(request, response);
                    } else {
                        String error = "no se inserto correctamente vuelva a intentar";
                        request.getSession().setAttribute("error", error);
                        request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
                    }
                    }
                }
            }
        }
 
        }catch(Exception a){
         String error = "Error el aula no existe";
         request.getSession().setAttribute("error", error);
         request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);       
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
