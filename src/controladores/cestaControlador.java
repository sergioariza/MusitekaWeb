package controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.MenuNav;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class cestaControlador{
	@RequestMapping("/cesta")
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("cesta");
        
        //Ponemos valores predeterminados en el menú de navegación
        MenuNav menuNav = new MenuNav();
        menuNav.setProducto(0);
        menuNav.setNivel(0);
        menuNav.setDescripcion("Mi cesta");
        menuNav.setDescripcionLogin("");
        mv.addObject("menuNav", menuNav);
        return mv;
    }
}