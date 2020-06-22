
package modelo;

public class EsDouble {
    public static boolean validar(String numero){
        try{
            Double.parseDouble(numero);
            return true;
        }catch(Exception e){
            return false;
        }
    }
}
