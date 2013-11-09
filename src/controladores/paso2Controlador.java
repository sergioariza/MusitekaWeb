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
public class paso2Controlador{	
	@RequestMapping("/paso2")
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("paso2");       
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
            
            //Validación de los campos de entrada
            if(!vf.validarCampoObligatorio(usuarioRegistro.getCalle())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: calle";
                }else{
                    errores = errores + ", calle";
                }
            }

            if(!vf.validarCampoObligatorio(usuarioRegistro.getNumeroypiso())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: número y piso";
                }else{
                    errores = errores + ", número y piso";
                }
            }

            if(!vf.validarCampoObligatorio(usuarioRegistro.getCodpostal())){
                if(errores.compareTo("") == 0){
                    errores = "Falta por rellenar: código postal";
                }else{
                    errores = errores + ", código postal";
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
                        errores = "Código postal no númerico. ";
                    }else{
                        errores = errores + "Y finalmente, el código postal no es numérico. ";
                    }
                }        
            }
            
            menuNav.setProducto(0);
            menuNav.setNivel(0);
            menuNav.setDescripcion("Datos / Dirección");
            
            if(errores.compareTo("") == 0){            
                domiciliosHelper.modificarDomicilio(idDomicilio, usuarioRegistro.getCalle(),
                        usuarioRegistro.getNumeroypiso(), Integer.parseInt(usuarioRegistro.getCodpostal()),
                        usuarioRegistro.getLocalidad(), usuarioRegistro.getPais());              
                menuNav.setDescripcionLogin("Se modificaron los datos de envío correctamente.");
            }else{
                menuNav.setDescripcionLogin(errores);
            }            
        }else{
            //Ponemos valores predeterminados en el menú de navegación
            menuNav.setProducto(0);
            menuNav.setNivel(0);
            menuNav.setDescripcion("Datos / Dirección");
            menuNav.setDescripcionLogin("");
        }       
        
        mv.addObject("menuNav", menuNav);
        return mv;
    }
}
