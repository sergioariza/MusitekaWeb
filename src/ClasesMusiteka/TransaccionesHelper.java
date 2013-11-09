package ClasesMusiteka;

import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TransaccionesHelper {
    Session session = null;
    Transaction tx = null;
    
    public TransaccionesHelper(){
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List<Transacciones> getTransacciones(int idUsuario){
        List<Transacciones> listaTransacciones = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Transacciones where Comprador = " + idUsuario);
            listaTransacciones = (List<Transacciones>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaTransacciones;
    }
    
    public List<Transacciones> getTransaccionesTotales(){
        List<Transacciones> listaTransacciones = null;
    
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Transacciones");
            listaTransacciones = (List<Transacciones>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaTransacciones;
    }
    
    public void comprarProducto(int idUsuario, String formaPago, int numcompra, Map<Integer, Integer> listaCompra){
        this.tx = this.session.beginTransaction();
        Query query = session.createSQLQuery("CALL INSERTARCOMPRA(?, ?, ?, ?)");
        
        for(Map.Entry<Integer, Integer> entry : listaCompra.entrySet()){
            for(int i = 1; i <= entry.getValue(); i++){
                query.setParameter(0, entry.getKey());
                query.setParameter(1, idUsuario);
                query.setParameter(2, formaPago);
                query.setParameter(3, numcompra);        
                query.executeUpdate();
            }
        }
        
        tx.commit();
    }
}