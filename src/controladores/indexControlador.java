package controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.MenuNav;
import modelos.UsuarioNav;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class indexControlador{	
	@RequestMapping("/index")
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("index");
        UsuarioNav usuarioNav = (UsuarioNav) hsr.getSession().getAttribute("usuarioNav");
        String id = hsr.getParameter("id");
        String nivel = hsr.getParameter("niv");
        
        MenuNav menuNav = new MenuNav();        
        
        if(usuarioNav == null){
            usuarioNav = new UsuarioNav();
            hsr.getSession().setAttribute("usuarioNav", usuarioNav);
        }
        
        if((id != null) && (nivel != null)){
            menuNav.setProducto(Integer.parseInt(id));
            menuNav.setNivel(Integer.parseInt(nivel));
            menuNav.setDescripcion("");
            menuNav.setDescripcionLogin("");
        }

        //Insertamos el modelo para pasarlo a la vista
        mv.addObject("menuNav", menuNav);   
        return mv;
    }
}