
package modelo;

public class EsNumero {
    public static boolean validar(String numero){
        try{
            Integer.parseInt(numero);
            return true;
        }catch(Exception e){
            return false;
        }
    }
}
