package modelos;

import java.util.HashMap;
import java.util.Map;

public class UsuarioNav {
    private String nombre;
    private int idusuario;
    private Map<Integer,Integer> listaCompra;
    
    public UsuarioNav(){
        nombre = "Invitado";
        listaCompra = new HashMap<Integer,Integer>();
        idusuario = 0;
    }
    
    public String getNombre() {
        return nombre;
    }    

    public int getIdusuario() {
        return idusuario;
    }

    public Map<Integer,Integer> getListaCompra() {
        return listaCompra;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public void setListaCompra(Map<Integer,Integer> listaCompra) {
        this.listaCompra = listaCompra;
    }    
}