package ClasesMusiteka;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UsuariosHelper {
    Session session = null;
    Transaction tx = null;
    
    public UsuariosHelper(){
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    @SuppressWarnings("unchecked")
	public String getPassword(String correo){
        List<String> listaPasswords;
        String password = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("select password from Usuarios where email = '" + correo + "'");
            listaPasswords = (List<String>) query.list();
            password = String.valueOf(listaPasswords.get(0));
        }
        catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla USUARIOS: " + ex);
        }
        
        return password;
    }
    
    @SuppressWarnings("unchecked")
	public String getNombre(String correo){
        List<String> listaNombres;
        String nombre = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("select nombre from Usuarios where email = '" + correo + "'");
            listaNombres = (List<String>) query.list();
            nombre = String.valueOf(listaNombres.get(0));
        }
        catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla USUARIOS: " + ex);
        }
        
        return nombre;
    }
    
    @SuppressWarnings("unchecked")
	public int getIdusuario(String correo){
        List<Usuarios> listaNombres;
        Usuarios usuario;
        int idusuario = 0;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Usuarios where email = '" + correo + "'");
            listaNombres = (List<Usuarios>) query.list();
            usuario = listaNombres.get(0);
            idusuario = (int) usuario.getIdusuario();
        }
        catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla USUARIOS: " + ex);
        }
        
        return idusuario;
    }
    
    public void insertarUsuario(String tratamiento, String nombre, String apellidos, String calle, String numeroypiso,
            int codigopostal, String localidad, int pais, int tipodocumento, String documento, String correo, String password)
    {
        this.tx = this.session.beginTransaction();
        Query query = session.createSQLQuery("CALL INSERTARUSUARIO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        query.setParameter(0, tratamiento);
        query.setParameter(1, nombre);
        query.setParameter(2, apellidos);
        query.setParameter(3, calle);
        query.setParameter(4, numeroypiso);
        query.setParameter(5, codigopostal);
        query.setParameter(6, localidad);
        query.setParameter(7, pais);
        query.setParameter(8, tipodocumento);
        query.setParameter(9, documento);
        query.setParameter(10, correo);
        query.setParameter(11, password);
        query.executeUpdate();
        tx.commit();
    }
    
    public void modificarUsuario(int idUsuario, String tratamiento, String nombre, String apellidos, 
             String correo, int tipodocumento, String documento, String password)
    {
        this.tx = this.session.beginTransaction();
        Query query = session.createSQLQuery("CALL MODIFICARUSUARIO(?, ?, ?, ?, ?, ?, ?, ?)");
        query.setParameter(0, idUsuario);
        query.setParameter(1, tratamiento);
        query.setParameter(2, nombre);
        query.setParameter(3, apellidos);
        query.setParameter(4, correo);
        query.setParameter(5, tipodocumento);
        query.setParameter(6, documento);
        query.setParameter(7, password);
        query.executeUpdate();
        tx.commit();
    }
    
    @SuppressWarnings("unchecked")
	public Usuarios getUsuario(int idUsuario){
        List<Usuarios> listaNombres;
        Usuarios usuario = new Usuarios();
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Usuarios where idusuario = " + idUsuario );
            listaNombres = (List<Usuarios>) query.list();
            usuario = listaNombres.get(0);
        }
        catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla USUARIOS: " + ex);
        }
        
        return usuario;
    }
    
    @SuppressWarnings("unchecked")
	public Usuarios getIdDocumento(int idUsuario){
        List<Usuarios> listaNombres;
        Usuarios usuario = new Usuarios();
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Usuarios where idusuario = " + idUsuario );
            listaNombres = (List<Usuarios>) query.list();
            usuario = listaNombres.get(0);
        }
        catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla USUARIOS: " + ex);
        }
        
        return usuario;
    }
}
