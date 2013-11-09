package controladores;

import ClasesMusiteka.DomiciliosHelper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.MenuNav;
import modelos.UsuarioRegistro;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import varios.ValidacionFormularios;

@Controller
public class direccionControlador{
	@RequestMapping("/direccion")
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("direccion");       
        MenuNav menuNav = new MenuNav();        
        String accion = (String) hsr.getParameter("accion");
        UsuarioRegistro usuarioRegistro = new UsuarioRegistro();
        ValidacionFormularios vf = new ValidacionFormularios();
        String errores = "";
        DomiciliosHelper domiciliosHelper = new DomiciliosHelper();
        
        if((accion != null)&&(accion.compareTo("modificar") == 0)){
            //Rellenamos los datos recibidos y lo pasamos al modelo para su posterior validación
            usuarioRegistro.setCalle(hsr.getParameter("calle"));
            usuarioRegistro.setNumeroypiso(hsr.getParameter("numeroypiso"));
            usuarioRegistro.setCodpostal(hsr.getParameter("codigopostal"));
            usuarioRegistro.setLocalidad(hsr.getParameter("localidadprovincia"));
            usuarioRegistro.setPais(Integer.parseInt(hsr.getParameter("pais")));
            int idDomicilio = Integer.parseInt(hsr.getParameter("idDomicilio"));
            
            //Validaci�n de los campos de entrada
            if(!vf.validarCampoObligatorio(usuarioRegistro.getCalle())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: calle";
                }else{
                    errores = errores + ", calle";
                }
            }

            if(!vf.validarCampoObligatorio(usuarioRegistro.getNumeroypiso())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: n�mero y piso";
                }else{
                    errores = errores + ", n�mero y piso";
                }
            }

            if(!vf.validarCampoObligatorio(usuarioRegistro.getCodpostal())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: c�digo postal";
                }else{
                    errores = errores + ", c�digo postal";
                }
            }

            if(!vf.validarCampoObligatorio(usuarioRegistro.getLocalidad())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: localidad";
                }else{
                    errores = errores + ", localidad";
                }
            }
            
            if(errores.compareTo("") != 0){
                errores = errores + ". ";
            }
            
            if(vf.validarCampoObligatorio(usuarioRegistro.getCodpostal())){
                if(!vf.validarNumero(usuarioRegistro.getCodpostal())){
                    if(errores.compareTo("") == 0){
                        errores = "C�digo postal no num�rico. ";
                    }else{
                        errores = errores + "Y finalmente, el c�digo postal no es num�rico. ";
                    }
                }        
            }
            
            menuNav.setProducto(0);
            menuNav.setNivel(0);
            menuNav.setDescripcion("Datos de env�o");
            
            if(errores.compareTo("") == 0){            
                domiciliosHelper.modificarDomicilio(idDomicilio, usuarioRegistro.getCalle(),
                        usuarioRegistro.getNumeroypiso(), Integer.parseInt(usuarioRegistro.getCodpostal()),
                        usuarioRegistro.getLocalidad(), usuarioRegistro.getPais());              
                menuNav.setDescripcionLogin("Se modificaron los datos de env�o correctamente.");
            }else{
                menuNav.setDescripcionLogin(errores);
            }            
        }else{
            //Ponemos valores predeterminados en el men� de navegaci�n
            menuNav.setProducto(0);
            menuNav.setNivel(0);
            menuNav.setDescripcion("Datos de env�o");
            menuNav.setDescripcionLogin("");
        }       
        
        mv.addObject("menuNav", menuNav);
        return mv;
    }
}