package controladores;

import ClasesMusiteka.Transacciones;
import ClasesMusiteka.TransaccionesHelper;
import ClasesMusiteka.UsuariosHelper;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.MenuNav;
import modelos.UsuarioNav;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import varios.EnvioCorreo;

@Controller
public class panelControlador{	
	@RequestMapping("/panel")
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        ModelAndView mv = new ModelAndView("panel");        
        UsuarioNav usuarioNav = (UsuarioNav) hsr.getSession().getAttribute("usuarioNav");
        Map<Integer, Integer> listaCompra = usuarioNav.getListaCompra();
        TransaccionesHelper transaccionesHelper = new TransaccionesHelper();
        String accion = (String) hsr.getParameter("accion");
        
        if((accion != null) && (accion.compareTo("comprar") == 0)){
            int formaPago = Integer.valueOf(hsr.getParameter("formapago"));
            String formaPagoStr;
            switch(formaPago){
                case 1:
                    formaPagoStr = "Paypal";
                    break;
                case 2:
                    formaPagoStr = "Tarjeta";
                    break;
                case 3:
                    formaPagoStr = "Contrareembolso";
                    break;
                case 4:
                    formaPagoStr = "Transferencia";
                    break;
                default:
                    formaPagoStr = "Paypal";
                    break;
            }
            
            int numTransaccion = 1;
            List<Transacciones> listaTransacciones = transaccionesHelper.getTransaccionesTotales();            
            Iterator<Transacciones> iter = listaTransacciones.iterator();
            
            while(iter.hasNext()){
                Transacciones transaccion = iter.next();
                int numTransaccionAux = (int) transaccion.getNumerocompra();
                if(numTransaccionAux > numTransaccion){
                    numTransaccion = numTransaccionAux;
                }
            }
            
            numTransaccion++;            
            transaccionesHelper.comprarProducto(usuarioNav.getIdusuario(), formaPagoStr, numTransaccion, listaCompra);            
            EnvioCorreo ec = new EnvioCorreo();
            UsuariosHelper usuariosHelper = new UsuariosHelper();            
            ec.enviarCorreoCompra(usuarioNav.getIdusuario(), usuariosHelper.getUsuario(usuarioNav.getIdusuario()).getEmail(), listaCompra);            
            usuarioNav.setListaCompra(new HashMap<Integer, Integer>());
            hsr.getSession().setAttribute("usuarioNav", usuarioNav);
            mv.addObject("accion", accion);
        }
        
        //Ponemos valores predeterminados en el menú de navegación
        MenuNav menuNav = new MenuNav();
        menuNav.setProducto(0);
        menuNav.setNivel(0);
        menuNav.setDescripcion("Mi cuenta");
        menuNav.setDescripcionLogin("");
        
        mv.addObject("menuNav", menuNav);
        return mv;
    }
}