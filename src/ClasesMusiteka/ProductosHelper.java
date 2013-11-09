package ClasesMusiteka;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class ProductosHelper {
    Session session = null;
    
    public ProductosHelper(){
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List<Productos> getProductos(){
        List<Productos> listaProductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos order by idproducto desc");
            listaProductos = (List<Productos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaProductos;
    }
    
    public List<String> getMarcas(){
        List<String> listaMarcas = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("select distinct marca from Productos");
            listaMarcas = (List<String>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaMarcas;
    }
    
    public List<String> getMarcasClaseProductos(int claseproducto){
        List<String> listaMarcas = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("select distinct marca from Productos where clasesproductos = " + claseproducto);
            listaMarcas = (List<String>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaMarcas;
    }
    
    public List<String> getMarcasSubclaseProductos(int subclaseproducto){
        List<String> listaMarcas = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("select distinct marca from Productos where subclasesproductos = " + subclaseproducto);
            listaMarcas = (List<String>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaMarcas;
    }
    
    public List<Productos> getProductosSubclaseProductosOrdenMarcamodeloAsc(int subclaseproducto){
        List<Productos> listaProductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where subclasesproductos = " + subclaseproducto + " order by marca asc, modelo");
            listaProductos = (List<Productos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaProductos;
    }
    
    public List<Productos> getProductosSubclaseProductosOrdenPrecioAsc(int subclaseproducto){
        List<Productos> listaProductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where subclasesproductos = " + subclaseproducto + " order by precio asc");
            listaProductos = (List<Productos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaProductos;
    }
    
    public List<Productos> getProductosSubclaseProductosOrdenPrecioDesc(int subclaseproducto){
        List<Productos> listaProductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where subclasesproductos = " + subclaseproducto + " order by precio desc");
            listaProductos = (List<Productos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaProductos;
    }
    
    public List<Productos> getProductosSubclaseProductosOrdenMarcamodeloDesc(int subclaseproducto){
        List<Productos> listaProductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where subclasesproductos = " + subclaseproducto + " order by marca desc, modelo");
            listaProductos = (List<Productos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaProductos;
    }
    
    public List<Productos> getProductosSubclaseProductosMarcaOrdenMarcamodeloAsc(int subclaseproducto, String marca){
        List<Productos> listaProductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where subclasesproductos = " + subclaseproducto + " and marca = '" + marca + "' order by marca asc, modelo");
            listaProductos = (List<Productos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaProductos;
    }
    
    public List<Productos> getProductosSubclaseProductosMarcaOrdenPrecioAsc(int subclaseproducto, String marca){
        List<Productos> listaProductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where subclasesproductos = " + subclaseproducto + " and marca = '" + marca + "' order by precio asc");
            listaProductos = (List<Productos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaProductos;
    }
    
    public List<Productos> getProductosSubclaseProductosMarcaOrdenMarcamodeloDesc(int subclaseproducto, String marca){
        List<Productos> listaProductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where subclasesproductos = " + subclaseproducto + " and marca = '" + marca + "' order by marca desc, modelo");
            listaProductos = (List<Productos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaProductos;
    }
    
    public List<Productos> getProductosSubclaseProductosMarcaOrdenPrecioDesc(int subclaseproducto, String marca){
        List<Productos> listaProductos = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where subclasesproductos = " + subclaseproducto + " and marca = '" + marca + "' order by precio desc");
            listaProductos = (List<Productos>) query.list();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return listaProductos;
    }
    
    public Productos getProducto(int idproducto){
        Productos producto = null;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where idproducto = " + idproducto);
            producto = (Productos) query.list().get(0);
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return producto;
    }
    
    public int getIdClaseProducto(int i){
        List<Productos> listaProductos;
        int idClaseproducto = 0;
        Clasesproductos cp;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where idproducto = " + i);
            listaProductos = (List<Productos>) query.list();
            cp = listaProductos.get(0).getClasesproductos();
            idClaseproducto = (int) cp.getIdclaseproducto();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return idClaseproducto;
    }
    
    public int getIdSubclaseProducto(int i){
        List<Productos> listaProductos;
        int idSubclaseproducto = 0;
        Subclasesproductos scp;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where idproducto = " + i);
            listaProductos = (List<Productos>) query.list();
            scp = listaProductos.get(0).getSubclasesproductos();
            idSubclaseproducto = (int) scp.getIdsubclaseproducto();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return idSubclaseproducto;
    }
    
    public String getMarca(int idproducto){
        String marca = null;
        Productos p;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where idproducto = " + idproducto);
            p = (Productos) query.list().get(0);
            marca = p.getMarca();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return marca;
    }
    
    public String getMarcaymodelo(int idproducto){
        String marcaymodelo = null;
        Productos p;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where idproducto = " + idproducto);
            p = (Productos) query.list().get(0);
            marcaymodelo = p.getMarca() + " " + p.getModelo();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return marcaymodelo;
    }
    
    public String getObservaciones(int idproducto){
        String observaciones = null;
        Productos p;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where idproducto = " + idproducto);
            p = (Productos) query.list().get(0);
            observaciones = p.getObservaciones();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return observaciones;
    }
    
    public double getPrecio(int idproducto){
        double precio = 0;
        Productos p;
        
        try 
        {
            session.beginTransaction();
            Query query = session.createQuery("from Productos where idproducto = " + idproducto);
            p = (Productos) query.list().get(0);
            precio = p.getPrecio().doubleValue();
        } catch (Exception ex) 
        {
            System.out.println("Excepción listando tabla PRODUCTOS: " + ex);
        }
        
        return precio;
    }
}
