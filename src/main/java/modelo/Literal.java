
package modelo;

public class Literal {
    public static String notaLiteral(double numero){
        String nota="";
       if(numero<=20 && numero>17){
           nota="AD";
       }else if(numero<=17 && numero>14){
           nota="A"; 
       }else if(numero<=14 && numero>11){
           nota="B"; 
       }else if(numero<=11 && numero>=0){
           nota="C"; 
       }
       return nota;
    }
}
