
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaAulas {
    
    public LinkedList<Aula> lista;
    int año;
    private Connection conn;
    private PreparedStatement ps;
    
    public ListaAulas(int año){
        this.año = año;
        lista = new LinkedList<Aula>();
    }
    
    private Connection obtenerCone() throws SQLException {
        return conexion.Conexion.getConnection();
    }
    
    public LinkedList<Aula> select() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call ConsultarAula(?)");
            ps.setInt(1, año);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
               String gra =rs.getString(1);
               String sec =rs.getString(2);
               String profe =rs.getString(3);
               int cant =rs.getInt(4);
               int an =rs.getInt(6);
               
               Aula a = new Aula(gra, sec, profe, cant,an);
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
    
    public Aula verAula(String gra, String sec){
       Aula au = null;
       for(int i = 0 ; i<tama(); i++){
       if(lista.get(i).getGrado().equals(gra) && lista.get(i).getSeccion().equals(sec)){
           au = lista.get(i);
       }    
       }
       return au;
    }
    
   
}
