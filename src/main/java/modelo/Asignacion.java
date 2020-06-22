
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Asignacion {
    String grado, seccion, profesor,curso;
    int año;
    private Connection conn;
    private PreparedStatement ps;

    public Asignacion(String grado, String seccion, String profesor, String curso, int año) {
        this.grado = grado;
        this.seccion = seccion;
        this.profesor = profesor;
        this.curso = curso;
        this.año = año;
    }

    public Asignacion(String grado, String seccion, String curso) {
        this.grado = grado;
        this.seccion = seccion;
        this.curso = curso;
    }
    
    private Connection obtenerCone() throws SQLException{
        return conexion.Conexion.getConnection();
    }

    
    public boolean insert() throws SQLException {
        
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call InsertarAsignacion(?,?,?,?,?)");
            ps.setString(1, curso);
            ps.setString(2, profesor);
            ps.setString(3, grado);
            ps.setString(4, seccion);
            ps.setInt(5, año);
            
            int filas = ps.executeUpdate();

            if (filas > 0) {
                System.out.print("bien");
            } else {
                System.out.print("mal");
            }
            conn.commit();
            return true;
        } catch (Exception e) {
            conn.rollback();
            System.out.println("Error en asignacion 1");
            return false;
        }
        finally {

            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println("error");
                
            }

        }
    }
    
    public boolean editar() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call EditarAsignacion(?,?,?,?)");
            ps.setString(1, curso);
            ps.setString(2, profesor);
            ps.setString(3, grado);
            ps.setString(4, seccion);

            int filas = ps.executeUpdate();

            if (filas > 0) {
                System.out.print("bien");
            } else {
                System.out.print("mal");
            }
            conn.commit();
            return true;
        } catch (Exception e) {
            conn.rollback();
            System.out.println("Error en asignacion 2");
            return false;
        }
        finally {

            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println("error");
                
            }

        }
    }
    
    public boolean eliminar() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call EliminarAsignacion(?,?,?)");
            ps.setString(1, curso);
            ps.setString(2, grado);
            ps.setString(3, seccion);

            int filas = ps.executeUpdate();

            if (filas > 0) {
                System.out.print("bien");
            } else {
                System.out.print("mal");
            }
            conn.commit();
            
            return true;
        } catch (Exception e) {
            conn.rollback();
            System.out.println("Error en asignacion 3");
            return false;
        }
        finally {

            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println("error");
                
            }

        }
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }
    
    

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public String getSeccion() {
        return seccion;
    }

    public void setSeccion(String seccion) {
        this.seccion = seccion;
    }

    public String getProfesor() {
        return profesor;
    }

    public void setProfesor(String profesor) {
        this.profesor = profesor;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }


    
    
}
