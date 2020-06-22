
package testing;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Anio;


public class Test {
    public static void main(String[] args) {
        Anio a = new Anio(2013);
        try {
            if(a.eliminar()==true){
                System.out.println("inserto chequea");
            }else{
                System.out.println("alaaaa");
            }
        } catch (SQLException ex) {
            System.out.println("peor error"+ex);
        }
    }
    
}
