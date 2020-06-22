package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaProfesores {

    public LinkedList<Profesor> lista;
    int año;
    private Connection conn;
    private PreparedStatement ps;

    public ListaProfesores(int año){
        this.año = año;
        lista = new LinkedList<Profesor>();
    }
    
    private Connection obtenerCone() throws SQLException {
        return conexion.Conexion.getConnection();
    }

    public LinkedList<Profesor> select() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call ConsultarProfesor(?)");
            ps.setInt(1, año);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
                String codigo = rs.getString(1);
                String nombre = rs.getString(2);
                String apellido = rs.getString(3);
                String dni = rs.getString(4);
                String direccion = rs.getString(5);
                String ciudad = rs.getString(6);
                int edad = rs.getInt(7);
                int tcasa = rs.getInt(8);
                int tmovil = rs.getInt(9);
                String correo = rs.getString(10);
                String contra = rs.getString(11);
                int an =rs.getInt(13);

                Profesor a = new Profesor(codigo,apellido, nombre,dni, direccion, ciudad, edad, tcasa, tmovil, correo, contra,an);
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
    public Profesor buscar(String pro){
        for(int i=0; i<tama();i++){
            if(lista.get(i).getCodigo().equalsIgnoreCase(pro)){
                
                return lista.get(i);
                
            }
        }
        return null;
    }
}
