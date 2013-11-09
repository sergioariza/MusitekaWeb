package controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.MenuNav;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class paso3Controlador{	
	@RequestMapping("/paso3")
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("paso3");
        
        //Ponemos valores predeterminados en el menú de navegación
        MenuNav menuNav = new MenuNav();
        menuNav.setProducto(0);
        menuNav.setNivel(0);
        menuNav.setDescripcion("Pagar");
        menuNav.setDescripcionLogin("");
        mv.addObject("menuNav", menuNav);
        return mv;
    }
}