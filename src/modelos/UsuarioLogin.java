package modelos;


public class UsuarioLogin {
    private String correo;
    private String password;
    
    public UsuarioLogin(){
        correo = "";
        password = "";
    }

    public String getCorreo() {
        return correo;
    }

    public String getPassword() {
        return password;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setPassword(String password) {
        this.password = password;
    }    
}