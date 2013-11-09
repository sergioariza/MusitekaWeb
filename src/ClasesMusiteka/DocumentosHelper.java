package ClasesMusiteka;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DocumentosHelper {
    Session session = null;
    
    public DocumentosHelper(){
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
}