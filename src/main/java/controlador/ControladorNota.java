/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Alumno;
import modelo.EsDouble;
import modelo.EsNumero;
import modelo.ListaAlumnos;
import modelo.ListaNotas;
import modelo.Nota;

/**
 *
 * @author alumno
 */
public class ControladorNota extends HttpServlet {

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
        String an = request.getParameter("an");
        int año = Integer.parseInt(an);
        
        ListaAlumnos li = new ListaAlumnos(año);
        try {
            LinkedList<Alumno> ve = li.select();
        } catch (SQLException ex) {
            String error = "error BDD listarNotas";
                    request.getSession().setAttribute("error", error);
                    request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
                }
        
        boolean si=false;
        
        String profe = request.getParameter("profe");
        String grado = request.getParameter("grado");
        String secc = request.getParameter("seccion");
        String curso = request.getParameter("curso");
        String bimestre = request.getParameter("bimestre");
        LinkedList<Alumno> listadea = li.reporteAlumno(grado, secc);
        int tam = listadea.size();
                
        String alu[] = new String[tam];
        String oral[] = new String[tam];
        String prac[] = new String[tam];
        String trab[] = new String[tam];
        String cuad[] = new String[tam];
        String proc[] = new String[tam];
        String bime[] = new String[tam];
        String prome[] = new String[tam];

        if(bimestre.equals("0")){
         String error = "No selecciono el Bimestre";
         request.getSession().setAttribute("error", error);
         request.getRequestDispatcher("errorProfe.jsp").forward(request, response);   
        }else{

        for (int i = 0; i < tam; i++) {
 
            alu[i] = request.getParameter("codi"+i);
            oral[i] = request.getParameter("ora"+i);
            prac[i] = request.getParameter("pra"+i);
            trab[i] = request.getParameter("tra"+i);
            cuad[i] = request.getParameter("cua"+i);
            proc[i] = request.getParameter("pro"+i);
            bime[i] = request.getParameter("bi"+i);
            prome[i] = request.getParameter("p"+i);

                if(EsNumero.validar(oral[i])==false || EsNumero.validar(prac[i])==false || EsNumero.validar(trab[i])==false
                      || EsNumero.validar(cuad[i])==false || EsNumero.validar(bime[i])==false || EsDouble.validar(proc[i])==false || EsDouble.validar(prome[i])==false){
                String error = "Error en uno de las notas";
                request.getSession().setAttribute("error", error);
                request.getRequestDispatcher("errorProfe.jsp").forward(request, response);   
                }else{ 
                
                  Nota not = new Nota(alu[i], profe,curso,grado,secc,bimestre,Integer.parseInt(oral[i]), Integer.parseInt(prac[i]), Integer.parseInt(trab[i]), Integer.parseInt(cuad[i]), Integer.parseInt(bime[i]),(double) Math.round(Double.parseDouble(proc[i])),(double) Math.round(Double.parseDouble(prome[i])),año);
                  
                try {
                    if(not.insert()==false){
                        String error = "Las notas ya han sido registradas no se puede volver a registrar";
                        request.getSession().setAttribute("error", error);
                    }else{
                        si = true;
                    }
                } catch (SQLException ex) {
                    String error = "error BDD insetar Nota";
                    request.getSession().setAttribute("error", error);
                    request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
                }
               }
           
    }
        
      }  
        if(si==true){
          ListaNotas no = new ListaNotas(año);
            try {
                LinkedList<Nota> lis = no.select();
            } catch (SQLException ex) {
                String error = "Error Listar Nots 2";
                    request.getSession().setAttribute("error", error);
                    request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
                }
          LinkedList<Nota> listaOficial = no.reporteNotaAlumno(grado, secc, curso);
          request.getSession().setAttribute("gra", grado);
          request.getSession().setAttribute("cur", curso);
          request.getSession().setAttribute("sec", secc);
          request.getSession().setAttribute("pro", profe);
          request.getSession().setAttribute("notas", listaOficial);
          request.getRequestDispatcher("reporteNota.jsp").forward(request, response);  
        }else{
          request.getRequestDispatcher("errorProfe.jsp").forward(request, response);  
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
