/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author alumno
 */
public class Profesor {

    public String nombre, apellido, dni, direccion, ciudad, contraseña, codigo, correo;
    public int edad, tcasa, tmovil,año;
    private Connection conn;
    private PreparedStatement ps;

    public Profesor(String codigo, String apellido, String nombre, String dni
            , String direccion, String ciudad, int edad, int tcasa
            , int tmovil, String correo, String contraseña, int año) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.tcasa = tcasa;
        this.tmovil = tmovil;
        this.contraseña = contraseña;
        this.codigo = codigo;
        this.correo = correo;
        this.edad = edad;
        this.año = año;
    }

    public Profesor(String codigo) {
        this.codigo = codigo;
    }
    
    private Connection obtenerCone() throws SQLException {
        return conexion.Conexion.getConnection();
    }

    public boolean insert() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call InsertarProfesor(?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, codigo);
            ps.setString(2, nombre);
            ps.setString(3, apellido);
            ps.setString(4, dni);
            ps.setString(5, direccion);
            ps.setString(6, ciudad);
            ps.setInt(7, edad);
            ps.setInt(8, tcasa);
            ps.setInt(9, tmovil);
            ps.setString(10, correo);
            ps.setString(11, contraseña);
            ps.setInt(12, año);

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
            System.out.println("Error en profe 1");
            return false;
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

    public boolean editar() throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call EditarProfesor(?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, this.codigo);
            ps.setString(2, this.nombre);
            ps.setString(3, this.apellido);
            ps.setString(4, this.dni);
            ps.setString(5, this.direccion);
            ps.setString(6, this.ciudad);
            ps.setInt(7, this.edad);
            ps.setInt(8, this.tcasa);
            ps.setInt(9, this.tmovil);
            ps.setString(10, this.correo);
            ps.setString(11, this.contraseña);

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
            System.out.println("Error en profe 2");
            return false;
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

    public boolean eliminar(String codigo) throws SQLException {
        conn = obtenerCone();
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareCall("call EliminarProfesor(?)");
            ps.setString(1, codigo);
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
            System.out.println("erro en profe 3");
            return false;
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
    
    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getTcasa() {
        return tcasa;
    }

    public void setTcasa(int tcasa) {
        this.tcasa = tcasa;
    }

    public int getTmovil() {
        return tmovil;
    }

    public void setTmovil(int tmovil) {
        this.tmovil = tmovil;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
}
