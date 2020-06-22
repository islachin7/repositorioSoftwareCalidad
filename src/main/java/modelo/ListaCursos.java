package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaCursos {

    public LinkedList<Curso> lista;
    int año;
    private Connection conn;
    private PreparedStatement ps;

    public ListaCursos(int año) {
        this.año = año;
        lista = new LinkedList<Curso>();
    }

    private Connection obtenerCone() throws SQLException {
        return conexion.Conexion.getConnection();
    }

    public LinkedList<Curso> select() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call ConsultarCurso(?)");
            ps.setInt(1, año);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
                String cod = rs.getString(1);
                String cur = rs.getString(2);
                int an = rs.getInt(4);

                Curso a = new Curso(cod, cur, an);
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

    public Curso buscar(String cur) {
        for (int i = 0; i < tama(); i++) {
            if (lista.get(i).getCodigo().equalsIgnoreCase(cur)) {

                return lista.get(i);

            }
        }
        return null;
    }

}
