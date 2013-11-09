package modelos;

public class UsuarioRegistro {
    private String tratamiento, nombre, apellidos,
           calle, numeroypiso, codpostal, localidad,
           documento, correo, password, passwordRepetir;
    
    private int pais, tipodocumento;
    
    public UsuarioRegistro(){
        tratamiento = "Sr.";
        nombre = "";
        apellidos = "";
        calle = "";
        numeroypiso = "";
        codpostal = "";
        localidad = "";
        documento = "";
        correo = "";
        password = "";
        passwordRepetir = "";
        pais = 27;
        tipodocumento = 0;
    }
    
    public String getApellidos() {
        return apellidos;
    }

    public String getCalle() {
        return calle;
    }

    public String getCodpostal() {
        return codpostal;
    }

    public String getDocumento() {
        return documento;
    }

    public String getLocalidad() {
        return localidad;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNumeroypiso() {
        return numeroypiso;
    }

    public int getPais() {
        return pais;
    }
    
    public String getCorreo() {
        return correo;
    }
    
    public String getPassword() {
        return password;
    }

    public String getPasswordRepetir() {
        return passwordRepetir;
    }

    public int getTipodocumento() {
        return tipodocumento;
    }

    public String getTratamiento() {
        return tratamiento;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public void setCodpostal(String codpostal) {
        this.codpostal = codpostal;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setNumeroypiso(String numeroypiso) {
        this.numeroypiso = numeroypiso;
    }

    public void setPais(int pais) {
        this.pais = pais;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public void setPasswordRepetir(String passwordRepetir) {
        this.passwordRepetir = passwordRepetir;
    }

    public void setTipodocumento(int tipodocumento) {
        this.tipodocumento = tipodocumento;
    }

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }    
}