package ClasesMusiteka;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class DomiciliosHelper {
    Session session = null;
    Transaction tx = null;
    
    public DomiciliosHelper(){
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public void modificarDomicilio(int idDomicilio, String calle, String numeroypiso, int codigopostal, 
             String localidad, int pais)
    {
        this.tx = this.session.beginTransaction();
        Query query = session.createSQLQuery("CALL MODIFICARDOMICILIO(?, ?, ?, ?, ?, ?)");
        query.setParameter(0, idDomicilio);
        query.setParameter(1, calle);
        query.setParameter(2, numeroypiso);
        query.setParameter(3, codigopostal);
        query.setParameter(4, localidad);
        query.setParameter(5, pais);
        query.executeUpdate();
        tx.commit();
    }
}