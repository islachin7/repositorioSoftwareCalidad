
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaAsignaciones {
    
    public LinkedList<Asignacion> lista;
    int año;
    private Connection conn;
    private PreparedStatement ps;
    
    public ListaAsignaciones(int año){
        this.año = año;
        lista = new LinkedList<Asignacion>();
    }
    
    private Connection obtenerCone() throws SQLException {
        return conexion.Conexion.getConnection();
    }
    
    public LinkedList<Asignacion> select() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call ConsultarAsignacion(?)");
            ps.setInt(1, año);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
               String cur =rs.getString(1);
               String pro =rs.getString(2);
               String gra =rs.getString(3);
               String sec =rs.getString(4);
               int an =rs.getInt(6);
               
               Asignacion a = new Asignacion(gra, sec, pro, cur,an);
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
    
        public LinkedList<Asignacion> registro(String profe){
        LinkedList<Asignacion> lis = new LinkedList<>();
        for(int i =0; i<tama();i++){
         if(lista.get(i).getProfesor().equalsIgnoreCase(profe)){
           lis.add(lista.get(i));
        }   
        }
        
        return lis;
    }
    
        public Asignacion verAsignacion(String gra,String sec, String cur){
            for(int i =0 ; i<tama();i++){
             if(lista.get(i).getGrado().equalsIgnoreCase(gra) && lista.get(i).getSeccion().equalsIgnoreCase(sec)
                && lista.get(i).getCurso().equalsIgnoreCase(cur)) {
                 return lista.get(i);
             }
            }
            return null;
        }
    
}
