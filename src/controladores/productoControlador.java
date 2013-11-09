package controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.MenuNav;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class productoControlador{
	@RequestMapping("/producto")
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("producto");
        MenuNav menuNav = new MenuNav();
        String id = hsr.getParameter("id");
        
        if(id == null){
            menuNav.setProducto(0);
        }else{
            menuNav.setProducto(Integer.parseInt(id));
        }
        
        menuNav.setNivel(3);
        menuNav.setDescripcion("");
        menuNav.setDescripcionLogin("");
        
        //Insertamos el modelo para pasarlo a la vista
        mv.addObject("menuNav", menuNav);        
        return mv;
    }
}