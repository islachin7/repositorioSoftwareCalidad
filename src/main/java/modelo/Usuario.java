
package modelo;

public class Usuario {
    private String codigo,contra;
    private int tipo;

    public Usuario(String codigo, String contra, int tipo) {
        this.codigo = codigo;
        this.contra = contra;
        this.tipo = tipo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
   
    
}
