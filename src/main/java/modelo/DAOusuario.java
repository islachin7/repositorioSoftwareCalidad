package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOusuario {

    //dao usuario tiene como atributo principal al usuario
    Usuario usu;
    //esto no es un atributo de DaoUsuario pero lo cree por algo importante que esta mas abajo
    String cod, contra;
    //como siempre nuestras varibles de conexion para usar la base de datos
    private Connection conn;
    private PreparedStatement ps;

    //creamos el constructor como vez solo recibe al Usuario
    public DAOusuario(Usuario usu) {
        this.usu = usu;
    }

    //aqui estan los get y set de usuario
    public Usuario getUsu() {
        return usu;
    }

    public void setUsu(Usuario usu) {
        this.usu = usu;
    }

    private Connection obtenerCone() throws SQLException {
        return conexion.Conexion.getConnection();
    }
// esto valida a los usuarios este metodo te retorna solamente true o false si lo encuentra o no

    public boolean validar() throws SQLException {

        conn = obtenerCone();
        //primero una variable res lo inicializamos con false
        boolean res = false;
        //luego con un switch preguntamos segun del usuario el tipo
        switch (usu.getTipo()) {
            //en el caso que fuera 1 es admin entonces preguntamos
            case 1:
                //si el codigo o correo del usuario instanciado es admin@asdsa y la contra es 
                if (usu.getCodigo().equals("admin@gmail.com") && usu.getContra().equals("123456")) {
                    //res es true
                    res = true;
                }
                //rompe
                break;
            // este es cuando es profe
            case 2:
                //aqui es muy diferente al primero ya que el profe yo lo creo por lo tanto lo inserto en la
                //bdd y su codigo y contra esta en la bdd y pregunto
                //como es un llamado a un procedimeinto almacenado tengo que ponerlo en un try cathc
                //por si sucede algun problema jaja
                try {
                conn.setAutoCommit(false);
                //llamo al procedimeinto LoginProfesor
                //esto es lo que hace como sabes le doy el codigo o el correo del usuario
                ps = conn.prepareCall("call LoginProfesor(?)");
                //este es el parametro usu es el usuario creado y este tiene como metodo getCodigo
                ps.setString(1, usu.getCodigo());
                //luego ejecuto el proc con ps.execute ahora esto es muy diferente
                //esto ahora me retorna otra cosa llamado ResultSet
                //resultset es una clase que recibe por decir una consulta(select) y te permite recorrerlo
                ResultSet rs = ps.executeQuery();
                while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
                {
                    //en las variables que te dije te acuerdas
                    //es para llenarlo para preguntar no nas
                    //del select en la primera columna me da el correo y el segudo la contra
                    cod = rs.getString(1);
                    contra = rs.getString(2);

                }
                //luego pregunto del usuario que se a logeado su codigo o correo es igual al codigo y la 
                //contra tambien es igual a la contra del select
                if (usu.getCodigo().equals(cod) && usu.getContra().equals(contra)) {
                    //entonces procede y retorna true
                    res = true;
                }
                conn.commit();

            } catch (Exception e) {
                conn.rollback();
                //si no encuentra false no existe como ella
                res = false;
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

            break;
            case 3:
                // este es cuando es padre
                //aqui cambiamos el procedimiento almacenado se llama loginPadre
                //esto es para enviarle el parametro ahi le envio
                 try {
                conn.setAutoCommit(false);
                ps = conn.prepareCall("call LoginPadre(?)");
                ps.setString(1, usu.getCodigo());
                //aqui lo ejecuto y lo recupero el select en RS
                ResultSet rs = ps.executeQuery();
                while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
                {
                    //cuando el select regresa te da 2 cosas el usuario y la contra
                    //aqui lo capturo entendes jaj si ps es que es con procedimientos
                    cod = rs.getString(1);
                    contra = rs.getString(2);

                }
                //aqui comparo si existe o no ps
                if (usu.getCodigo().equals(cod) && usu.getContra().equals(contra)) {
                    res = true;
                }
                conn.commit();
            } catch (Exception e) {
                conn.rollback();
                res = false;
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
            break;
            default:
                res = false;
        }
        return res;
    }
}
