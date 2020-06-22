
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//la clase alumno es la clase principal aqui se ponen los atributos que tiene el alumno y los metodos
//cada clase general como alumno, nota , curso tiene 3 metodos importantes muy aparte de los 
//get y set
public class Alumno {
    //atributos principales de la clase alumno junto con informacion del padre
    // lo que tiene h al final como nombreh es del hijo y lo que tiene p como
    // nombrep es del padre
    public String grado,sexoh,nombreh,apellidoh,deparh,distritoh,dnih,direccionh,obserh,usuario,contra;
    public String estado,sexop,nombrep,apellidop,dnip,seccion;
    public int edadh,telefonoh,año;
    //estos son 2 atributos importantes de la conexion para la base de datos
    //aqui esta Conexion que es de la clase que creamos Conexion
    private Connection conn;
    //este es una varible de la clase PreparedStament
    //esta clase esta en la libreria java.SQL 
    private PreparedStatement ps;

    
    //aqui esta el constructor de alumno
    public Alumno(String grado,String seccion, String sexoh, String nombreh
            , String apellidoh, String deparh, String distritoh, String dnih
            , String direccionh, String obserh, String usuario, String contra
            , String estado, String sexop, String nombrep, String apellidop, String dnip
            , int edadh, int telefonoh, int año) {
        this.grado = grado;
        this.sexoh = sexoh;
        this.nombreh = nombreh;
        this.apellidoh = apellidoh;
        this.deparh = deparh;
        this.distritoh = distritoh;
        this.dnih = dnih;
        this.direccionh = direccionh;
        this.obserh = obserh;
        this.usuario = usuario;
        this.contra = contra;
        this.estado = estado;
        this.sexop = sexop;
        this.nombrep = nombrep;
        this.apellidop = apellidop;
        this.dnip = dnip;
        this.seccion = seccion;
        this.edadh = edadh;
        this.telefonoh = telefonoh;
        this.año = año;
    }

    //este es otro constructor de la clase alumno y lo e utilizado mas que todo para poder
    //usar la eliminacion del alumno ya que no se podia
    //aqui al igual la conexion se instancia y el ps en null
    //una clase puede tener varios contructores pero con la codicion de que no tenga la misma cantidad de parametros mira
    public Alumno(String usuario) {
        this.usuario = usuario;
    }
    
    private Connection obtenerCone() throws SQLException{
        return conexion.Conexion.getConnection();
    }
    
    //primero cuando se logea 

    //ya ahora si lo fuerte men atento 
    //si entiendes esto entiendes todo el proyecto
     public boolean insert() throws SQLException {
         //primero creamos el metodo insert que te retorne una varible boolean osea un true o un false
         //siempre cuando se trata de alguna conexion como puede ver errores te pide
         //que este dentro de un try y catch 
         
         conn = obtenerCone();
        try {
            //primero a la varible ps de la clase PreparedStament la llenamos con 
            //el metodo de conexion llamado prepareCall
            //en la clase Connection de MYSQL tiene un metodo llamado prepareCall
            //esto sirve para llamar a procedimientos almacenados de la base de datos 
            //esto te devuelve un preparedStament 
            //para eso sirve el ps permite recibir declaraciones preparadas de mysql
            //primero conn es nuestra varible de nuestra clase Conexion
            //en nuestra clase ay un metodo que se llama getConnection
            //ese metodo te retorna la varible conn ahora dentro de esa variable 
            //que no te olvides que viene de una clase de la libreria MYSQL llamada Connection
            //la en esa clase que te mostre que no debi abrir tiene un metodo llamado prepareCall
            //este metodo te retorna un tipo de varible llamado PreparedStament
            //pero ese metodo prepareCall tiene la particularidad de poder ejecutar codigo sql
            //de procedimeintos almacenados osea que en ese momento lo estoy llamando a ese metodo
            //le estoy diciendo que ese es el procedimento que voy a ejecutar pero todavia no
            //lo ejecuto solo lo llamo al procedimeinto
            //luego de llamarlo nada mas si tiene parametros ese prodimento se pone la cantidad
            //de parametros con signo de ?
            //aqui esta este procedmiento
            
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call InsertarAlumno(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            //ya ahora para llenar de informacion en cada paramaetro de ese procedimiento
            //utilizamos el metodo de ps llamado set(aqui se ppone el tipo de dato) hay
            //de todo tipo setString setInt setDouble asi
            //ahora esto debe hacerse segun el orden del procedmiento almacenado
            ps.setString(1, usuario);
            ps.setString(2, nombreh);
            ps.setString(3, apellidoh);
            ps.setString(4, dnih);
            ps.setString(5, direccionh);
            ps.setString(6, grado);
            ps.setString(7, seccion);
            ps.setString(8, sexoh);
            ps.setString(9, deparh);
            ps.setString(10, distritoh);
            ps.setString(11, obserh);
            ps.setInt(12, edadh);
            ps.setString(13, nombrep);
            ps.setString(14, apellidop);
            ps.setString(15, dnip);
            ps.setString(16, estado);
            ps.setString(17, sexop);
            ps.setInt(18, telefonoh);
            ps.setString(19, contra);
            ps.setInt(20, año);
            //despues de que ya lo llenaste todo segun el orden del procedimiento
            //ahora si lo ejecutamos porfin
            //con el metodo de ps.executeUpdate();
            //esto como puedes ver te retorna un int y lo almaceno el filas
            int filas = ps.executeUpdate();
            //ahora pregunto si filas mayor a 0 quiere decir que inserto una fila
            if (filas > 0) {
                System.out.print("inserto");
            } else {
                //si no no ps
                System.out.print("nooo");
            }
            conn.commit();
            //y por fin retorna true
            return true;
        } catch (Exception e) {
            conn.rollback();
            //si hay alguna problema o excepcion retorna false
            System.out.println("error en alumno 1");
            return false;
        }
        //luego ya esto la verdad no se muy bien jajaj me lo enseño mi profe despues
        //pero con finally es lo que se hace finalmente osea al final de todo
        finally {
            //aqui pregunto si ps ya no es null entonces lo cierro
            try {
                if (ps != null) {
                    ps.close();
                }
                //si conn ya no es null lo desconceto o cierro
                //como te dije solamente se cierra por buenas constumbre
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println("error");
                
            }

        }
    }
     
     //este editar es igualito lo unico es que llama al procediminto editarAlumno
    public boolean editar() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call EditarAlumno(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, usuario);
            ps.setString(2, nombreh);
            ps.setString(3, apellidoh);
            ps.setString(4, dnih);
            ps.setString(5, direccionh);
            ps.setString(6, grado);
            ps.setString(7, seccion);
            ps.setString(8, sexoh);
            ps.setString(9, deparh);
            ps.setString(10, distritoh);
            ps.setString(11, obserh);
            ps.setInt(12, edadh);
            ps.setString(13, nombrep);
            ps.setString(14, apellidop);
            ps.setString(15, dnip);
            ps.setString(16, estado);
            ps.setString(17, sexop);
            ps.setInt(18, telefonoh);
            ps.setString(19, contra);
            int filas = ps.executeUpdate();

            if (filas > 0) {
                System.out.print("inserto");
            } else {
                System.out.print("nooo");
            }
            conn.commit();
            return true;
        } catch (Exception e) {
            System.out.println("error en alumno 2");
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
    
    //igualito al anterior con la diferencia que llamo a eliminarAlumno jaja 
    public boolean eliminar() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call EliminarAlumno(?)");
            ps.setString(1, usuario);
           
            int filas = ps.executeUpdate();

            if (filas > 0) {
                System.out.print("inserto");
            } else {
                System.out.print("nooo");
            }
            conn.commit();
            return true;
        } catch (Exception e) {
            conn.rollback();
            System.out.println("error en alumno 3");
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

    public String getSexoh() {
        return sexoh;
    }

    public void setSexoh(String sexoh) {
        this.sexoh = sexoh;
    }

    public String getNombreh() {
        return nombreh;
    }

    public void setNombreh(String nombreh) {
        this.nombreh = nombreh;
    }

    public String getApellidoh() {
        return apellidoh;
    }

    public void setApellidoh(String apellidoh) {
        this.apellidoh = apellidoh;
    }

    public String getDeparh() {
        return deparh;
    }

    public void setDeparh(String deparh) {
        this.deparh = deparh;
    }

    public String getDistritoh() {
        return distritoh;
    }

    public void setDistritoh(String distritoh) {
        this.distritoh = distritoh;
    }

    public String getDnih() {
        return dnih;
    }

    public void setDnih(String dnih) {
        this.dnih = dnih;
    }

    public String getDireccionh() {
        return direccionh;
    }

    public void setDireccionh(String direccionh) {
        this.direccionh = direccionh;
    }

    public String getObserh() {
        return obserh;
    }

    public void setObserh(String obserh) {
        this.obserh = obserh;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getSexop() {
        return sexop;
    }

    public void setSexop(String sexop) {
        this.sexop = sexop;
    }

    public String getNombrep() {
        return nombrep;
    }

    public void setNombrep(String nombrep) {
        this.nombrep = nombrep;
    }

    public String getApellidop() {
        return apellidop;
    }

    public void setApellidop(String apellidop) {
        this.apellidop = apellidop;
    }

    public String getDnip() {
        return dnip;
    }

    public void setDnip(String dnip) {
        this.dnip = dnip;
    }


    public int getEdadh() {
        return edadh;
    }

    public void setEdadh(int edadh) {
        this.edadh = edadh;
    }

    public int getTelefonoh() {
        return telefonoh;
    }

    public void setTelefonoh(int telefonoh) {
        this.telefonoh = telefonoh;
    }

    public String getSeccion() {
        return seccion;
    }

    public void setSeccion(String seccion) {
        this.seccion = seccion;
    }

    // estos son los metodos get y set
    
    
    
    
    
    
}
