/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author The_Edge
 */
public class MenuNav {
    private int nivel, producto;
    private String descripcion, descripcionLogin;
    
    public MenuNav(){
        nivel = 0;
        producto = 0;
        descripcion = "";
    }
    
    public int getNivel() {
        return nivel;
    }

    public int getProducto() {
        return producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getDescripcionLogin() {
        return descripcionLogin;
    }
    
    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setDescripcionLogin(String descripcionLogin) {
        this.descripcionLogin = descripcionLogin;
    }    
}
