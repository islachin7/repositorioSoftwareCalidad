
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Anio {
 int anio;
 private Connection conn;
 private PreparedStatement ps;

    public Anio(int anio) {
        this.anio = anio;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }
    
    private Connection obtenerCone() throws SQLException{
        return conexion.Conexion.getConnection();
    }
 
    public boolean insert() throws SQLException {
        
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call InsertarAnio(?)");
            ps.setInt(1, anio);

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
            System.out.println("error en insertar año");
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
                System.out.println("error total");
                
            }

        }
    }
    
    
    public boolean editar(String nuevo) throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call EditarAnio(?,?)");
            ps.setInt(1, anio);
            ps.setString(2, nuevo);

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
            System.out.println("error en editar");
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
            ps = conn.prepareCall("call EliminarAnio(?)");
            ps.setInt(1, anio);
            
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
            System.out.println("error en eliminar");
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
 
 
}
