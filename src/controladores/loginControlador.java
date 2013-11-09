package controladores;

import ClasesMusiteka.UsuariosHelper;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.MenuNav;
import modelos.UsuarioLogin;
import modelos.UsuarioNav;
import modelos.UsuarioRegistro;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import varios.EnvioCorreo;
import varios.ValidacionFormularios;

@Controller
public class loginControlador{
	@RequestMapping("/login")
    public ModelAndView handleRequest(@RequestParam("opcion") String opcion, HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException {
		ModelAndView mv = new ModelAndView("login");        
        MenuNav menuNav = new MenuNav();
        String nombre = null, password = null, passwordRequest = null, direccion = null;
        UsuariosHelper usuariosHelper;
        ValidacionFormularios vf;
        UsuarioNav usuarioNav;
        
		switch(opcion){
        	case "inicio":
        		//Ponemos valores predeterminados en el menú de navegación
                menuNav.setProducto(0);
                menuNav.setNivel(0);
                menuNav.setDescripcion("Login");
                menuNav.setDescripcionLogin("");
                
                //Insertamos el modelo para pasarlo a la vista
                mv.addObject("menuNav", menuNav);                
        		break;
        	case "alta":
                UsuarioRegistro usuarioRegistro = new UsuarioRegistro();   
                usuariosHelper = new UsuariosHelper();
                vf = new ValidacionFormularios();
                String errores = "";
                
                //Rellenamos los datos recibidos y lo pasamos al modelo para su posterior validaciÃ³n
                int tratamiento = Integer.parseInt(request.getParameter("tratamiento"));
                
                if(tratamiento == 1){
                    usuarioRegistro.setTratamiento("Sr.");
                }else{
                    usuarioRegistro.setTratamiento("Sra.");
                }
                
                usuarioRegistro.setNombre(request.getParameter("nombre"));
                usuarioRegistro.setApellidos(request.getParameter("apellidos"));
                usuarioRegistro.setCalle(request.getParameter("calle"));
                usuarioRegistro.setNumeroypiso(request.getParameter("numeroypiso"));
                usuarioRegistro.setCodpostal(request.getParameter("codigopostal"));
                usuarioRegistro.setLocalidad(request.getParameter("localidad"));
                usuarioRegistro.setPais(Integer.parseInt(request.getParameter("pais")));
                usuarioRegistro.setTipodocumento(Integer.parseInt(request.getParameter("tipodocumento")));
                usuarioRegistro.setDocumento(request.getParameter("documento"));
                usuarioRegistro.setCorreo(request.getParameter("email"));
                usuarioRegistro.setPassword(request.getParameter("password"));
                usuarioRegistro.setPasswordRepetir(request.getParameter("passwordRepetir"));
                
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
                        if(nombreAux != null){
                            if(errores.compareTo("") == 0){
                                errores = "Dirección de correo ya registrada. ";
                            }else{
                                errores = errores + "Además, la dirección de correo ya está registrada. ";
                            }
                        }
                    }
                }
                
                if(vf.validarCampoObligatorio(usuarioRegistro.getCodpostal())){
                    if(!vf.validarNumero(usuarioRegistro.getCodpostal())){
                        if(errores.compareTo("") == 0){
                            errores = "Código postal no numérico. ";
                        }else{
                            errores = errores + "Y finalmente, el código postal no es numérico. ";
                        }
                    }        
                }
                
                //Ponemos valores predeterminados en el menú de navegación
                menuNav.setProducto(0);
                menuNav.setNivel(0);
                menuNav.setDescripcion("Login");      
                
                if(errores.compareTo("") == 0){            
                    usuariosHelper.insertarUsuario(usuarioRegistro.getTratamiento(), usuarioRegistro.getNombre(),
                    usuarioRegistro.getApellidos(), usuarioRegistro.getCalle(), usuarioRegistro.getNumeroypiso(),
                    Integer.parseInt(usuarioRegistro.getCodpostal()), usuarioRegistro.getLocalidad(), usuarioRegistro.getPais(),
                    usuarioRegistro.getTipodocumento(), usuarioRegistro.getDocumento(), usuarioRegistro.getCorreo(),
                    usuarioRegistro.getPassword());           
                    EnvioCorreo ec = new EnvioCorreo();
                    ec.enviarCorreoAlta(usuarioRegistro.getCorreo(), usuarioRegistro.getNombre(), usuarioRegistro.getPassword());
                    menuNav.setDescripcionLogin("Le hemos dado de alta. Por favor comprueba los datos de acceso en su archivo de entradas del correo electrÃ³nico e inicie sesiÃ³n en esta pÃ¡gina.");
                    usuarioRegistro = null;
                }else{
                    menuNav.setDescripcionLogin(errores);
                }
                
                //Insertamos el modelo para pasarlo a la vista
                mv.addObject("usuarioRegistro", usuarioRegistro);
                mv.addObject("menuNav", menuNav);        
        		break;
        	case "login":
        		int idusuario = 0;
                usuariosHelper = new UsuariosHelper();
                UsuarioLogin usuarioLogin = new UsuarioLogin();
                vf = new ValidacionFormularios();
                usuarioNav = (UsuarioNav) request.getSession().getAttribute("usuarioNav");
                nombre = null;
                password = null;
                passwordRequest = request.getParameter("password");
                direccion = request.getParameter("email");
                
                //Recogemos la informaciÃ³n desde la vista y luego lo volvemos a mandar al request
                usuarioLogin.setCorreo(direccion);
                usuarioLogin.setPassword(passwordRequest);
                mv.addObject("usuarioLogin", usuarioLogin);
                
                //Ponemos valores predeterminados en el menÃº de navegaciÃ³n
                menuNav.setProducto(0);
                menuNav.setNivel(0);
                menuNav.setDescripcion("Login");
                menuNav.setDescripcionLogin("");
                
                //Validación de los datos de formulario
                if(!vf.validarCampoObligatorio(direccion)){
                    menuNav.setDescripcionLogin("Para iniciar sesión, necesita introducir una dirección de correo válida.");
                    
                    //Insertamos el modelo para pasarlo a la vista
                    mv.addObject("menuNav", menuNav);        
                    return mv;
                }
                    
                if(!vf.validarCorreo(direccion)){
                    menuNav.setDescripcionLogin("La dirección de correo electrónico que ha introducido no corresponde con una dirección de correo válida.");
                    
                    //Insertamos el modelo para pasarlo a la vista
                    mv.addObject("menuNav", menuNav);        
                    return mv;
                }
                
                if(!vf.validarCampoObligatorio(passwordRequest)){
                    menuNav.setDescripcionLogin("Para iniciar sesión, necesita introducir una contraseña válida.");
                    
                    //Insertamos el modelo para pasarlo a la vista
                    mv.addObject("menuNav", menuNav);        
                    return mv;
                }
                
                nombre = usuariosHelper.getNombre(direccion);
                password = usuariosHelper.getPassword(direccion);
                idusuario = usuariosHelper.getIdusuario(direccion);
                
                if((nombre == null) || (password == null)){
                    menuNav.setDescripcionLogin("La dirección de correo electrónico que nos ha facilitado no está en nuestra base de datos. Es probable que dicha dirección no se haya registrado.");
                    
                    //Insertamos el modelo para pasarlo a la vista
                    mv.addObject("menuNav", menuNav);        
                    return mv;
                }
                
                if(password.compareTo(passwordRequest) != 0){
                    menuNav.setDescripcionLogin("La contraseña que nos ha facilitado no coincide con la del correo indicado.");
                    
                    //Insertamos el modelo para pasarlo a la vista
                    mv.addObject("menuNav", menuNav);        
                    return mv;
                }
                
                //Modificamos el modelo session de Usuario
                usuarioNav = new UsuarioNav();
                usuarioNav.setNombre(nombre);        
                usuarioNav.setListaCompra(new HashMap<Integer, Integer>());
                usuarioNav.setIdusuario(idusuario);
                request.getSession().setAttribute("usuarioNav", usuarioNav);
                
                //Insertamos el modelo para pasarlo a la vista
                menuNav.setDescripcion("");
                menuNav.setDescripcionLogin("");
                mv = new ModelAndView("index");
                mv.addObject("menuNav", menuNav);
        		break;
        	case "logout":
        		mv = new ModelAndView("index");
        		usuarioNav = (UsuarioNav) request.getSession().getAttribute("usuarioNav");
                               
                //Ponemos valores predeterminados en el menÃº de navegaciÃ³n
                menuNav.setProducto(0);
                menuNav.setNivel(0);
                menuNav.setDescripcion("");
                menuNav.setDescripcionLogin("");
                
                //Ponemos valores predeterminador en el usuario de navegaciÃ³n
                usuarioNav.setIdusuario(0);
                usuarioNav.setListaCompra(new HashMap<Integer, Integer>());
                usuarioNav.setNombre("Invitado");
                request.getSession().setAttribute("usuarioNav", usuarioNav);
                
                //Insertamos el modelo para pasarlo a la vista
                mv.addObject("menuNav", menuNav);    
        		break;
        	case "recordar":
        		usuariosHelper = new UsuariosHelper();
        		EnvioCorreo ec = new EnvioCorreo();
                vf = new ValidacionFormularios();                 
                nombre = null;
                password = null;
                direccion = request.getParameter("email");
                
                //Ponemos valores predeterminados en el menú de navegación
                menuNav.setProducto(0);
                menuNav.setNivel(0);
                menuNav.setDescripcion("Login");
                menuNav.setDescripcionLogin("");
                
                //Validación de los datos de formulario y envío de correo electrónico
                if(!vf.validarCampoObligatorio(direccion)){
                    menuNav.setDescripcionLogin("Para recuperar la contraseña, necesita introducir una dirección de correo válida.");           
                    mv.addObject("menuNav", menuNav);
                    return mv;
                }
                    
                if(!vf.validarCorreo(direccion)){
                    menuNav.setDescripcionLogin("La dirección de correo electrónico que ha introducido no corresponde con una dirección de correo válida.");
                    mv.addObject("menuNav", menuNav);
                    return mv;
                }            
                       
                nombre = usuariosHelper.getNombre(direccion);
                password = usuariosHelper.getPassword(direccion);
                
                if((nombre == null) || (password == null)){
                    menuNav.setDescripcionLogin("La dirección de correo electrónico que nos ha facilitado no está en nuestra base de datos. Es probable que dicha dirección no se haya registrado.");
                    mv.addObject("menuNav", menuNav);
                    return mv;
                }
                
                //Envío de correo electrónico
                ec.enviarCorreoRecordatorio(direccion, nombre, password);
                menuNav.setDescripcionLogin("Le hemos enviado la contraseña. Por favor compruébelo en su archivo de entradas del correo electrónico e indique en esta página su contraseña.");
                
                //Insertamos el modelo para pasarlo a la vista
                mv.addObject("menuNav", menuNav);  
        		break;
        }
		
		return mv;
    }
}