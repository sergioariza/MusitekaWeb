package controladores;

import ClasesMusiteka.UsuariosHelper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.MenuNav;
import modelos.UsuarioRegistro;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import varios.ValidacionFormularios;

@Controller
public class cuentaControlador{
	@RequestMapping("/cuenta")
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("cuenta");       
        MenuNav menuNav = new MenuNav();        
        String accion = (String) hsr.getParameter("accion");
        UsuarioRegistro usuarioRegistro = new UsuarioRegistro();
        ValidacionFormularios vf = new ValidacionFormularios();
        String errores = "";
        UsuariosHelper usuariosHelper = new UsuariosHelper();
        
        if((accion != null)&&(accion.compareTo("modificar") == 0)){
            //Rellenamos los datos recibidos y lo pasamos al modelo para su posterior validación
            int tratamiento = Integer.parseInt(hsr.getParameter("tratamiento"));
            if(tratamiento == 1){
                usuarioRegistro.setTratamiento("Sr.");
            }else{
                usuarioRegistro.setTratamiento("Sra.");
            }
            usuarioRegistro.setNombre(hsr.getParameter("nombre"));
            usuarioRegistro.setApellidos(hsr.getParameter("apellidos"));
            usuarioRegistro.setCorreo(hsr.getParameter("correo"));
            usuarioRegistro.setTipodocumento(Integer.parseInt(hsr.getParameter("tipodocumento")));
            usuarioRegistro.setDocumento(hsr.getParameter("documento"));            
            usuarioRegistro.setPassword(hsr.getParameter("password"));
            usuarioRegistro.setPasswordRepetir(hsr.getParameter("passwordRepetir"));            
            int idUsuario = Integer.parseInt(hsr.getParameter("idUsuario"));
            
            //Validación de los campos de entrada
            if(!vf.validarCampoObligatorio(usuarioRegistro.getNombre())){
                errores = "Falta por rellenar: nombre";
            }

            if(!vf.validarCampoObligatorio(usuarioRegistro.getApellidos())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: apellidos";
                }else{
                    errores = errores + ", apellidos";
                }
            }
            
            if(!vf.validarCampoObligatorio(usuarioRegistro.getDocumento())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: documento";
                }else{
                    errores = errores + ", documento";
                }
            }
        
            if(!vf.validarCampoObligatorio(usuarioRegistro.getCorreo())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: correo";
                }else{
                    errores = errores + ", correo";
                }
            }

            if(!vf.validarCampoObligatorio(usuarioRegistro.getPassword())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: contraseña";
                }else{
                    errores = errores + ", contraseña";
                }
            }

            if(!vf.validarCampoObligatorio(usuarioRegistro.getPasswordRepetir())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: repetir contraseña";
                }else{
                    errores = errores + ", repetir contraseña";
                }
            }

            if(errores.compareTo("") != 0){
                errores = errores + ". ";
            }

            if(usuarioRegistro.getPassword().compareTo(usuarioRegistro.getPasswordRepetir()) != 0){
                if(errores.compareTo("") == 0){
                    errores = "Las contraseñas no coinciden. ";
                }else{
                    errores = errores + "Aparte, las contraseñas no coinciden. ";
                }
            }
            
            if(vf.validarCampoObligatorio(usuarioRegistro.getCorreo())){
                if(!vf.validarCorreo(usuarioRegistro.getCorreo())){
                    if(errores.compareTo("") == 0){
                        errores = "Dirección de correo no válida.";
                    }else{
                        errores = errores + "Además, la dirección de correo no es válida. ";
                    }
                }else{        
                    String nombreAux = usuariosHelper.getNombre(usuarioRegistro.getCorreo());
                    int idUsuarioTemp = usuariosHelper.getIdusuario(usuarioRegistro.getCorreo());
                    if(idUsuarioTemp != idUsuario){
                        if(nombreAux != null){
                            if(errores.compareTo("") == 0){
                                errores = "Dirección de correo ya registrada. ";
                            }else{
                                errores = errores + "Además, la dirección de correo ya está registrada. ";
                            }
                        }
                    }
                }
            }
            
            menuNav.setProducto(0);
            menuNav.setNivel(0);
            menuNav.setDescripcion("Datos de usuario");
            
            if(errores.compareTo("") == 0){            
                usuariosHelper.modificarUsuario(idUsuario, usuarioRegistro.getTratamiento(), usuarioRegistro.getNombre(),
                    usuarioRegistro.getApellidos(), usuarioRegistro.getCorreo(), usuarioRegistro.getTipodocumento(),
                    usuarioRegistro.getDocumento(), usuarioRegistro.getPassword());                
                menuNav.setDescripcionLogin("Se modificaron los datos de usuario correctamente.");
            }else{
                menuNav.setDescripcionLogin(errores);
            }            
        }else{
            //Ponemos valores predeterminados en el menú de navegación
            menuNav.setProducto(0);
            menuNav.setNivel(0);
            menuNav.setDescripcion("Datos de usuario");
            menuNav.setDescripcionLogin("");
        }       
        
        mv.addObject("menuNav", menuNav);
        return mv;
    }
}