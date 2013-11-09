package ClasesMusiteka;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class ClasesproductosHelper {
    Session session = null;
    
    public ClasesproductosHelper(){
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List getProductos(){
        List<Clasesproductos> listaClasesproductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Clasesproductos");
            listaClasesproductos = (List<Clasesproductos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla CLASESPRODUCTOS: " + ex);
        }
        
        return listaClasesproductos;
    }
    
    public String getNombreProducto(int i){
        List<Clasesproductos> listaClasesproductos;
        String nombreProducto = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("select descclaseproducto from Clasesproductos where Idclaseproducto = " + i);
            listaClasesproductos = (List<Clasesproductos>) query.list();
            nombreProducto = String.valueOf(listaClasesproductos.get(0));
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla CLASESPRODUCTOS: " + ex);
        }
        
        return nombreProducto;
    }
    
    public String getLinkProducto(int i){
        List<Clasesproductos> listaClasesproductos;
        String linkProducto = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("select link from Clasesproductos where Idclaseproducto = " + i);
            listaClasesproductos = (List<Clasesproductos>) query.list();
            linkProducto = String.valueOf(listaClasesproductos.get(0));
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla CLASESPRODUCTOS: " + ex);
        }
        
        return linkProducto;
    }
}
