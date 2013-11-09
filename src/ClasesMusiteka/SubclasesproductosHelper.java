package ClasesMusiteka;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class SubclasesproductosHelper {
    Session session = null;
    
    public SubclasesproductosHelper(){
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List getSubproductos(int producto){
        List<Subclasesproductos> listaSubclasesproductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Subclasesproductos as scp where scp.clasesproductos = " + producto);
            listaSubclasesproductos = (List<Subclasesproductos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla SUBCLASESPRODUCTOS: " + ex);
        }
        
        return listaSubclasesproductos;
    }
    
    public String getNombreSubproducto(int i){
        List<Subclasesproductos> listaSubclasesproductos;
        String nombreSubproducto = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("select descsubclaseproducto from Subclasesproductos where Idsubclaseproducto = " + i);
            listaSubclasesproductos = (List<Subclasesproductos>) query.list();
            nombreSubproducto = String.valueOf(listaSubclasesproductos.get(0));
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla CLASESPRODUCTOS: " + ex);
        }
        
        return nombreSubproducto;
    }
    
    public int getIdClaseProducto(int i){
        List<Subclasesproductos> listaSubclasesproductos;
        int idProducto = 0;
        Clasesproductos cp;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Subclasesproductos where idsubclaseproducto = " + i);
            listaSubclasesproductos = (List<Subclasesproductos>) query.list();
            cp = listaSubclasesproductos.get(0).getClasesproductos();
            idProducto = (int) cp.getIdclaseproducto();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla CLASESPRODUCTOS: " + ex);
        }
        
        return idProducto;
    }
}
