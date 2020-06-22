package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaNotas {

    public LinkedList<Nota> lista;
    int año;
    private Connection conn;
    private PreparedStatement ps;

    public ListaNotas(int año){
        this.año = año;
        lista = new LinkedList<Nota>();
    }
    
    private Connection obtenerCone() throws SQLException {
        return conexion.Conexion.getConnection();
    }

    public LinkedList<Nota> select() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call consultarNotas(?)");
            ps.setInt(1, año);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
                String alu = rs.getString(1);
                String profe = rs.getString(2);
                String cur = rs.getString(3);
                String gra = rs.getString(4);
                String sec = rs.getString(5);
                String bim = rs.getString(6);
                int nor = rs.getInt(7);
                int nop = rs.getInt(8);
                int not = rs.getInt(9);
                int noc = rs.getInt(10);
                int nob = rs.getInt(11);
                double pro = rs.getDouble(12);
                double prom = rs.getDouble(13);
                int an =rs.getInt(15);

                Nota a = new Nota(alu, profe, cur, gra, sec, bim, nor, nop, not, noc, nob, pro, prom,an);
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

    public int buscarHijo(String usu) {

        for (int i = 0; i < tama(); i++) {
            if (lista.get(i).getAlumno().equalsIgnoreCase(usu)) {
                return i;
            }
        }

        return -1;
    }

    public LinkedList<Nota> reporteNotaAlumno(String gra, String sec, String curso) {
        LinkedList<Nota> lis = new LinkedList<>();
        for (int i = 0; i < tama(); i++) {
            if (lista.get(i).getGra().equalsIgnoreCase(gra) && lista.get(i).getSec().equalsIgnoreCase(sec)
                    && lista.get(i).getCur().equals(curso)) {
                lis.add(lista.get(i));
            }
        }

        return lis;
    }

    public LinkedList<Nota> reporteNotaAlumnoBimestre(String gra, String sec, String curso, String bime, String pro) {
        LinkedList<Nota> lis = new LinkedList<Nota>();
        for (int i = 0; i < tama(); i++) {
            if (lista.get(i).getGra().equalsIgnoreCase(gra) && lista.get(i).getSec().equalsIgnoreCase(sec)
                    && lista.get(i).getCur().equals(curso) && lista.get(i).getBime().equalsIgnoreCase(bime)
                    && lista.get(i).getProfesor().equals(pro)) {
                Nota n = new Nota(lista.get(i).getAlumno(), lista.get(i).getProfesor(), lista.get(i).getCur(), lista.get(i).getGra(), lista.get(i).getSec(), lista.get(i).getBime(), lista.get(i).getNoral(), lista.get(i).getNtrab(), lista.get(i).getNtrab(), lista.get(i).getNcuad(), lista.get(i).getExabi(), (double) lista.get(i).getProce(), (double) lista.get(i).getPromedio(),lista.get(i).getAño());
                lis.add(n);
            }
        }

        return lis;
    }

    public LinkedList<Nota> NotaPadre(String alumno) {
        LinkedList<Nota> lis = new LinkedList<>();
        for (int i = 0; i < tama(); i++) {
            if (lista.get(i).getAlumno().equalsIgnoreCase(alumno)) {
                lis.add(lista.get(i));
            }
        }

        return lis;
    }

    public LinkedList<Nota> NotaAdmi(String alumno, String bime) {
        LinkedList<Nota> lis = new LinkedList<Nota>();
        for (int i = 0; i < tama(); i++) {
            if(bime.equalsIgnoreCase("I")){
            if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
            }else if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase("I")){
               lis.add(lista.get(i));
            }
            }else if(bime.equalsIgnoreCase("II")){
            if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase("I") ||
               lista.get(i).getBime().equalsIgnoreCase(bime) ){
               lis.add(lista.get(i));
            }else if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
            }    
            }else if(bime.equalsIgnoreCase("III")){
            if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase("I") ||
               lista.get(i).getBime().equalsIgnoreCase("II") || lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
            }else if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
            }   
            }else if(bime.equalsIgnoreCase("IV")){
            if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase("I") ||
               lista.get(i).getBime().equalsIgnoreCase("II") || lista.get(i).getBime().equalsIgnoreCase("III")
               || lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
            }else if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
            }    
            }
        }

        return lis;
    }
    public LinkedList<Nota> NotaAdm(String alumno, String bime) {
        LinkedList<Nota> lis = new LinkedList<Nota>();
        for (int i = 0; i < tama(); i++) {
           if(bime.equalsIgnoreCase("I")){
           if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
           }    
           }else
           if(bime.equalsIgnoreCase("II")){
           if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime) 
               || lista.get(i).getBime().equalsIgnoreCase("I")){
               lis.add(lista.get(i));
           }else if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
           }    
           }else
           if(bime.equalsIgnoreCase("III")){
           if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime) 
               || lista.get(i).getBime().equalsIgnoreCase("I") || lista.get(i).getBime().equalsIgnoreCase("II")){
               lis.add(lista.get(i));
           }else if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
           }    
           }else
           if(bime.equalsIgnoreCase("IV")){
           if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime) 
               || lista.get(i).getBime().equalsIgnoreCase("I") || lista.get(i).getBime().equalsIgnoreCase("II")
               || lista.get(i).getBime().equalsIgnoreCase("III")){
               lis.add(lista.get(i));
           }else if(lista.get(i).getAlumno().equalsIgnoreCase(alumno) && lista.get(i).getBime().equalsIgnoreCase(bime)){
               lis.add(lista.get(i));
           }    
           }
           
        }

        return lis;
    }

}
