
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaSecciones {
    
    public LinkedList<Seccion> lista;
    int año;
    private Connection conn;
    private PreparedStatement ps;
    
    public ListaSecciones(int año){
        this.año = año;
        lista = new LinkedList<Seccion>();
    }
    
    private Connection obtenerCone() throws SQLException {
        return conexion.Conexion.getConnection();
    }
    
    public LinkedList<Seccion> select() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call ConsultarSeccion(?)");
            ps.setInt(1, año);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
               String sec =rs.getString(1);
               int an =rs.getInt(3);
               Seccion a = new Seccion(sec,an);
               lista.add(a);
            }           
            conn.commit();
            return lista;
        } catch (Exception e) {
            conn.rollback();
            System.out.println("error");
            return null;
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
    
    public int tama(){
        return lista.size();
    }
    

    
    
}
