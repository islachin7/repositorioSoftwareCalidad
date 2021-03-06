package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaAnios {

    public LinkedList<Anio> lista;
    private Connection conn;
    private PreparedStatement ps;

    public ListaAnios() {
        lista = new LinkedList<Anio>();
    }

    private Connection obtenerCone() throws SQLException {
        return conexion.Conexion.getConnection();
    }

    public LinkedList<Anio> select() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call ConsultarAnio");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
                int ani = rs.getInt(1);
                Anio a = new Anio(ani);
                lista.add(a);
            }
            conn.commit();
            return lista;
        } catch (Exception e) {
            conn.rollback();
            System.out.println("error");
            return null;
        } finally {

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

    public int tama() {
        return lista.size();
    }

}
